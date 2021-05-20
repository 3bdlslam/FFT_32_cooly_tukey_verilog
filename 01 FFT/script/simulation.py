import math
import numpy as np

def F(X,n,d):
    real=  math.cos(2*math.pi*n/d)#real
    imag=-math.sin(2*math.pi*n/d)#imag
    const=complex(real,imag)
    return [X[0]+X[1]*const,X[0]-X[1]*const]



# assume this is the input 
X=list(range(32))#X=[0,1,2,...,31]

###########################################################################################################
# sort the input as in the first column of the Figure
L1=[  [X[0],X[16]],  [X[8],X[24]],   [X[4],X[20]],  [X[12],X[28]],  
      [X[2],X[18]],  [X[10],X[26]],  [X[6],X[22]],  [X[14],X[30]],
      [X[1],X[17]],  [X[9],X[25]],   [X[5],X[21]],  [X[13],X[29]],
      [X[3],X[19]],  [X[11],X[27]],  [X[7],X[23]],  [X[15],X[31]],]

def F0(X):
    return F(X,0,2)
# input to layer 2
O1=[F0(i) for i in L1]

# 3mltlh reshape 34an eb2a 1 dimension oeshl al tawsel
X=np.array(O1).ravel()
###########################################################################################################
L2=[  [X[0],X[2]],   [X[1],X[3]],   [X[4],X[6]],   [X[5],X[7]],  
      [X[8],X[10]],  [X[9],X[11]],  [X[12],X[14]], [X[13],X[15]],
      [X[16],X[18]], [X[17],X[19]], [X[20],X[22]], [X[21],X[23]],
      [X[24],X[26]], [X[25],X[27]], [X[28],X[30]], [X[29],X[31]],]

def F1_4(X):
    return F(X,1,4)

# input to layer 2
O2=[F0(j) if i%2==0 else F1_4(j) for i,j in enumerate(L2)]

X=np.array(O2).ravel()
###########################################################################################################
L3=[  [X[0],X[4]],   [X[2],X[6]],   [X[1],X[5]],   [X[3],X[7]],  
      [X[8],X[12]],  [X[10],X[14]], [X[9],X[13]],  [X[11],X[15]],
      [X[16],X[20]], [X[18],X[22]], [X[17],X[21]], [X[19],X[23]],
      [X[24],X[28]], [X[26],X[30]], [X[25],X[29]], [X[27],X[31]],]

def F1_8(X):
    return F(X,1,8)

def F3_8(X):
    return F(X,3,8)

# input to layer 2
O3=[ F0(j) if i%4==0 else (F1_8(j) if i%4==1 else (F1_4(j) if i%4==2 else (F3_8(j) )) ) 
for i,j in enumerate(L3)]

X=np.array(O3).ravel()

###########################################################################################################


L4=[  [X[0],X[8]],   [X[2],X[10]],   [X[4],X[12]],   [X[6],X[14]],  
      [X[1],X[9]],   [X[3],X[11]],   [X[5],X[13]],   [X[7],X[15]],
      [X[16],X[24]], [X[18],X[26]],  [X[20],X[28]],  [X[22],X[30]],
      [X[17],X[25]], [X[19],X[27]],  [X[21],X[29]],  [X[23],X[31]],]

def F1_16(X):
    return F(X,1,16)

def F3_16(X):
    return F(X,3,16)

def F5_16(X):
    return F(X,5,16)

def F7_16(X):
    return F(X,7,16)
# input to layer 2
O4=[ F0(j) if i%8==0 else (F1_16(j) if i%8==1 else (F1_8(j) if i%8==2 else (F3_16(j) if i%8==3 
else (F1_4(j) if i%8==4 else (F5_16(j) if i%8==5 else (F3_8(j) if i%8==6 else F7_16(j))) )))) 
for i,j in enumerate(L4)]

X=np.array(O4).ravel()

###########################################################################################################
L5=[  [X[0],X[16]],   [X[2],X[18]],   [X[4],X[20]],   [X[6],X[22]],  
      [X[8],X[24]],   [X[10],X[26]],  [X[12],X[28]],  [X[14],X[30]],
      [X[1],X[17]],   [X[3],X[19]],   [X[5],X[21]],   [X[7],X[23]],
      [X[9],X[25]],   [X[11],X[27]],  [X[13],X[29]],  [X[15],X[31]],]

def F1_32(X):
    return F(X,1,32)

def F3_32(X):
    return F(X,3,32)

def F5_32(X):
    return F(X,5,32)

def F7_32(X):
    return F(X,7,32)

def F9_32(X):
    return F(X,9,32)

def F11_32(X):
    return F(X,11,32)

def F13_32(X):
    return F(X,13,32)

def F15_32(X):
    return F(X,15,32)

# input to layer 2
O3=[ F0(j)    if i%16==0 else (F1_32(j) if i%16==1 else (F1_16(j) if i%16==2 else (F3_32(j) if i%16==3 
else (F1_8(j) if i%16==4 else (F5_32(j) if i%16==5 else (F3_16(j) if i%16==6 else (F7_32(j) if i%16==7 
else (F1_4(j) if i%16==8 else (F9_32(j) if i%16==9 else (F5_16(j) if i%16==10 else (F11_32(j) if i%16==11 
else (F3_8(j)if i%16==12 else (F13_32(j) if i%16==13 else (F7_16(j) if i%16==14 else (F15_32(j)))))))))))))))) 
for i,j in enumerate(L5)]

X=np.array(O3).ravel()

Y=[ X[0], X[2],  X[4], X[6],  X[8], X[10],  X[12], X[14],  
    X[16], X[18],  X[20], X[22],  X[24], X[26],  X[28], X[30],
    X[1], X[3],  X[5], X[7],  X[9], X[11],  X[13], X[15],
    X[17], X[19],  X[21], X[23],  X[25], X[27],  X[29], X[31],]

print(Y)

