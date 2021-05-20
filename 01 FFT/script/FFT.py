from math import *
import numpy as np
from fxpmath import Fxp
import pickle

def write(myString):
    """remove all white space from string after each line"""
    t1=myString.split('\n')
    t2=[i.strip() for i in t1]
    return '\n'.join(t2)

def MulConst(n,d,INT=4,DEC=4):
    """ 
    returns Multiplier real and imag Constant 
    e^(-j*2*pi*n/d)
    INT=> number of integer bits
    DEC => number of decimal bits
    """
    a1=[]
    a2=[]
    c1=cos(2*pi*n/d)
    s1=-sin(2*pi*n/d)
    
    x = Fxp(c1, True, INT+DEC, DEC)      # signed=True, n_word=16, n_frac=8

    a1=x.bin(frac_dot=True)
    
    x = Fxp(s1, True, INT+DEC, DEC)      # signed=True, n_word=16, n_frac=8

    a2=x.bin(frac_dot=True)

    
    return [a1,a2]

def butterfly(N):
    """
    separate even and odd indicies recursivly
    N=> size of the list (FFT size) 
    """
    def rec(X):#recursive
        if len(X)<=2:
            return [X]
        even=X[0::2]
        odd=X[1::2]
        return [rec(even),rec(odd)]
    X=list(range(N))
    return list(np.array(rec(X)).ravel())

def MultiplierConstants(N=32,INT=4,DEC=4):
    """
    N=> size of FFT
    INT=> number of integer bits
    DEC => number of decimal bits
    """
    k=[[[i,2**j] for i in range(int(2**(j-1)))] for j in range(1,int(log2(N)+1))]


    C=[[MulConst(n=i[0], d=i[1],INT=INT,DEC=DEC) for i in j]   for j in k]

    def m1(e):
        def m2(e):
            def m3(e):
                return e.replace('.','_')
            return list(map(m3,e))
        return list(map(m2,e))

    C=list(map(m1,C))
    return C

def complex_mul(INT=4,DEC=4,file_path="FFT.v"):
    f=open(file_path,'a')
    f.write(write(f"""module complex_mul
            #(parameter  INT={INT},DEC={DEC})
            (input signed  [INT-1:-DEC] a,aj,b,bj,
            output signed  [INT-1:-DEC] c,cj);

            wire signed [2*INT-1:-2*DEC] real =(a*b)-(aj*bj);
            wire signed [2*INT-1:-2*DEC] img  =(aj*b)+(a*bj);

            assign c  =real[INT-1:-DEC];
            assign cj =img [INT-1:-DEC];
            endmodule"""))
    f.close()

def radix_2_fft(N=32,INT=4,DEC=4,file_path="FFT.v"):
  
    with open(file_path,'a') as f:
        f.write(f"\nmodule radix_2_fft #(parameter  INT={INT},DEC={DEC},FACTOR=1,FACTOR_IMAG=0)"
                    f"\n(input signed [INT-1:-DEC] X1_real,X1_imag,X2_real,X2_imag,"
                    f"\noutput signed [INT-1:-DEC] Y1_real,Y1_imag,Y2_real,Y2_imag );"
                    f"\nwire signed [INT-1:-DEC] mul_real,mul_imag;"
                    f"\ncomplex_mul #(.INT(INT),.DEC(DEC))"
                    f"\nmul (.a(X2_real),.aj(X2_imag),.b(FACTOR),.bj(FACTOR_IMAG),.c(mul_real),.cj(mul_imag));"
                    f"\nassign Y1_real = X1_real + mul_real;"
                    f"\nassign Y1_imag = X1_imag + mul_imag;"
                    f"\nassign Y2_real = X1_real - mul_real;"
                    f"\nassign Y2_imag = X1_imag - mul_imag; "   
                    f"\nendmodule\n")

def Layer0(N=32,C=[],file_path="FFT.v"):
    """
    prints verilog code for first layer of the FFT
    N=> size of the FFT
    """
    n=len(C[0])-1
    f=open(file_path,'a') 
    l=0 #layer 0
    #C=['b0001_0000 ', 'b0000_0000 '] # complex const
    b=butterfly(N)[0::2]
    #print(b)
    f.write(f"""\n//######################### Layer:0 #########################\n""")
    for i,j in enumerate(b):
        f.write(f"\n//Block Number:{i}\n")
        f.write(f"radix_2_fft\n" 
        f"#(.INT(INT), .DEC(DEC), .FACTOR({n}'b{C[0]}), .FACTOR_IMAG({n}'b{C[1]}))\n" 
        f"UUT_0_{i}(.X1_real(X{l}_r[{j}]) , .X1_imag(X{l}_i[{j}]) , \n" 
        f".X2_real(X{l}_r[{j+int(N/2)}]), .X2_imag(X{l}_i[{j+int(N/2)}]), \n" 
        f".Y1_real(X{l+1}_r[{2*i}]) , .Y1_imag(X{l+1}_i[{2*i}]), \n"
        f".Y2_real(X{l+1}_r[{2*i+1}]) , .Y2_imag(X{l+1}_i[{2*i+1}]));\n"); 
    f.close()

def OtherLayers(Const=[[[]]], N=32,file_path="FFT.v"):

    n=len(Const[0][0][0])-1
    f=open(file_path,'a') 
    Layers=list(range(1,int(log2(N))))
    for L in Layers:
        index=0
        f.write(f"""\n//######################### Layer:{L} #########################\n""")
        for i in range(int(16/2**(L))):
            for j in range(2**(L)):
                index+=1
                f.write(f"\n//Block Number:{index}\n")
                f.write(f"radix_2_fft\n"
                f"#(.INT(INT), .DEC(DEC),\n"
                f".FACTOR({n}'b{Const[L][j][0]}), .FACTOR_IMAG({n}'b{Const[L][j][1]}))\n"
                f"UUT_{L}_{index}(.X1_real(X{L}_r[{j+i*2**(L+1)}]) , .X1_imag(X{L}_i[{j+i*2**(L+1)}]) ,\n" 
                f".X2_real(X{L}_r[{j+i*2**(L+1)+2**L}]), .X2_imag(X{L}_i[{j+i*2**(L+1)+2**L}]) ,\n" 
                f".Y1_real(X{L+1}_r[{j+i*2**(L+1)}]) , .Y1_imag(X{L+1}_i[{j+i*2**(L+1)}])," 
                f".Y2_real(X{L+1}_r[{j+i*2**(L+1)+2**L}]) , .Y2_imag(X{L+1}_i[{j+i*2**(L+1)+2**L}]));\n")

def FFT(N=32,INT=4,DEC=4,file_path="FFT.v"):
    """
    prints verilog code for FFT
    N=> size of the FFT
    INT=> number of integer bits
    DEC => number of decimal bits
    """
    f=open(file_path,'w')
    f.write("`timescale 1ns / 1ps\n\n") 
    f.close()
    complex_mul(INT=INT,DEC=DEC,file_path=file_path)
    radix_2_fft(N=N,INT=INT,DEC=DEC,file_path=file_path)
    
    f=open(file_path,'a') 
    f.write(f"\n\nmodule FFT_{N} #(parameter  INT={INT},DEC={DEC})"
    f"\n(input[{N}*{INT+DEC}-1:0] Xn_vect_real,Xn_vect_imag,"
    f"\noutput[{N}*{INT+DEC}-1:0] Xk_vect_real,Xk_vect_imag,"
    f"\ninput clk);\n\n")
    
    for i in range(int(log2(N))+1):
        f.write(f"wire signed [INT-1:-DEC] X{i}_r [0:{N-1}] ,X{i}_i  [0:{N-1}];\n")
    
    f.write("\n\n")

    for i in range(N):
        f.write(f"assign X0_r[{i}] =  Xn_vect_real[{(INT+DEC)*(i+1)-1}:{(INT+DEC)*i}];\n"
        f"assign X0_i[{i}] =  Xn_vect_imag[{(INT+DEC)*(i+1)-1}:{(INT+DEC)*i}] ;\n")
    
    f.write("\n\n")
    f.close()
    

    Const=MultiplierConstants(N=N,INT=INT,DEC=DEC)
    Layer0(N=N,C=Const[0][0],file_path=file_path)
    OtherLayers(Const=Const, N=N,file_path=file_path)
    
    f=open(file_path,'a') 
    f.write("\n\n")

    for i in range(N):
        f.write(f"assign Xk_vect_real[{(INT+DEC)*(i+1)-1}:{(INT+DEC)*i}] =  X{int(log2(N))}_r[{i}];\n"
        f"assign  Xk_vect_imag[{(INT+DEC)*(i+1)-1}:{(INT+DEC)*i}] = X{int(log2(N))}_i[{i}] ;\n")

    f.write("\n\n")

    f.write("endmodule")

    f.close()
