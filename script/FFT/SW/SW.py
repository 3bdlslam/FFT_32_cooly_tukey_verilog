from math import *
import numpy as np
from fxpmath import Fxp

class write:
    def __init__(self,file):
        self.file=file
        f=open(self.file,'w')
        f.close()
    def __call__(self,myString):
        f=open(self.file,'a')
        t1=myString.split('\n')
        t2=[i.strip() for i in t1]
        t3='\n'.join(t2)
        f.write(t3)

def butterfly(N=32):
    """
    separate even and odd indicies recursivly
    N=> FFT size
    return =>[0,16,8,...]
    """
    def rec(X):#recursive
        if len(X)<=2:
            return [X]
        even=X[0::2]
        odd=X[1::2]
        return [rec(even),rec(odd)]
    X=list(range(N))
    return np.array(rec(X)).ravel()

def MAC_Indexes(N,MAC):
    Layers=int(log2(N))
    TotSize=N*Layers
    SelCounts=int(N*Layers/2/MAC)

    out=np.zeros([SelCounts,int(TotSize*2/SelCounts),6],dtype=int)

    # 4 for (2 input and 2 real/imag)
    t1=np.repeat(np.arange(MAC),4,axis=0)[None,:] 
    out[:,:,0]=t1

    # 2=>in1,in2  2=> for real/imag
    t1=np.repeat(np.arange(2),2,axis=0)[None,:] 
    t2=np.repeat(t1,MAC,axis=0).reshape([1,-1])
    out[:,:,1]=t2

    # 2=> for real/imag
    t1=np.arange(2)[None,:]
    t2=np.repeat(t1,TotSize/SelCounts,axis=0).reshape([1,-1])
    out[:,:,[2,5]]=np.expand_dims(t2,2)

    t1=np.repeat(np.arange(Layers),2*N,axis=0).reshape([SelCounts,-1])
    out[:,:,3]=t1


    out4=np.zeros([Layers,2*N],dtype=int)
    for L in range(Layers):
        index=0
        for i in range(int((N/2)/2**(L))):
            for j in range(2**(L)):
                out4[L,index]=int(j+i*2**(L+1))
                out4[L,index+1]=int(j+i*2**(L+1))
                out4[L,index+2]=int(j+i*2**(L+1)+2**L)
                out4[L,index+3]=int(j+i*2**(L+1)+2**L)
                index+=4
    out4=out4.reshape([SelCounts,-1])
    out[:,:,4]=out4
    return out

def MAC_Constants(N,MAC,INT,DEC):
    Layers=int(log2(N))
    TotSize=N*Layers
    SelCounts=int(N*Layers/2/MAC)
    Bits=DEC+INT

    out=np.zeros([SelCounts,int(TotSize/SelCounts),3],dtype=object)

    t1=np.repeat(np.arange(MAC),2,axis=0)[None,:] 
    out[:,:,0]=t1

    t1=np.arange(2)[None,:]
    t2=np.repeat(t1,TotSize/SelCounts/2,axis=0).reshape([1,-1])
    out[:,:,1]=t2


    k=np.array([2**i for i in range(1,int(log2(N)+1))])
    n=np.array([list(range(int(i/2)))*int(N/i) for i in k] )[:,0:int(N/2)]
    k=k[:,None]

    const=np.exp(-2j*np.pi*n/k)
    t1=const.ravel()
    t2=np.array([[ f"{Bits}'b"+Fxp(i.real,True,Bits,DEC).bin(),
                            f"{Bits}'b"+Fxp(i.imag,True,Bits,DEC).bin()] 
    for i in t1])

    t3=t2.reshape(SelCounts,-1)
    out[:,:,2]=t3

    return out


def RandomBinary(S,N,INT,DEC,Th):
    S=S*N*2
    Bits=INT+DEC
    Size=N*Bits
    
    Data= np.array(Fxp(list((np.random.random([S])-0.5)*2*Th),True,Bits,DEC).bin(),dtype=object)
 
    
    t1=Fxp(list('0b'+Data),True,Bits,DEC).hex()
    t2=np.array(list(map(lambda x:x[2:],t1)))
    t3=t2.reshape([2,-1,N])
    HexReal,HexImag=np.apply_along_axis(lambda args: f"{Size}'h"+'_'.join(args), 2, t3)

    Dec=Fxp(list('0b'+Data),True,Bits,DEC)().reshape([2,-1,N])
    DecComplex=np.apply_along_axis(lambda args: [complex(*args)], 0, Dec)[0]

    #return Data
    return [HexReal,HexImag,DecComplex]

def Dec2Hex(D,Bits,DEC,Size):
    real=np.apply_along_axis(lambda x:x.real,0,D)
    t1=Fxp(real,True,Bits,DEC).hex()
    HexReal=f"{Size}'h"+'_'.join(t1).replace('0x','')

    imag=np.apply_along_axis(lambda x:x.imag,0,D)
    t1=Fxp(imag,True,Bits,DEC).hex()
    HexImag=f"{Size}'h"+'_'.join(t1).replace('0x','')
    
    return [HexReal,HexImag]
