from FFT import write
from fxpmath import Fxp
import numpy as np

def RandomBinary(N=40,m=8,INT=4,DEC=4,Th=8):
    d=[]
    count=0
    while count<N:

        s=''
        for j in range(m):
            s+=str(np.random.randint(0,2))
        if abs(Fxp('0b'+s, True, INT+DEC, DEC)())<=Th:    
            d.append(s)
            count+=1
    return np.array(d,dtype=object)

def Binary2Dec_Hex(d=[],INT=4,DEC=4):
    """d=['110..,010..,...']"""
    assert(len(d)%4==0)
    t0=np.array(d,dtype=object)
    t1=list(['0b']+t0)
    t2=np.array(Fxp(t1, True, INT+DEC, DEC)()).reshape([-1,4])
    t3=np.array(Fxp(t1, True, INT+DEC, DEC).hex()).reshape([-1,4])
    return [t2,t3]

def FilterBinary2Dec_Hex(d,INT=4,DEC=4):
    def f(i):
        t1=complex(float(i[0]),float(i[1]))*complex(float(i[2]),float(i[3]))
        return abs(t1.real)<=2**(INT-1) and abs(t1.imag)<=2**(INT-1)
   

    dec,hexa=np.array(Binary2Dec_Hex(d=d,INT=INT,DEC=DEC)).reshape([2,-1,4])
    dec2,hexa2=zip(*[[i,j] for i , j in zip(dec,hexa) if f(i)
     ])
    #t2=[[i,j] for i,j in zip(t1[0],y1[1]) if ]
    return [dec2,hexa2]

def complex_mul_test(d=['010100',],INT=4,DEC=4,file_path="complex_mul_test.v"):
    
    dec,hexa=Binary2Dec_Hex(d=d,INT=INT,DEC=DEC)

    f=open(file_path,'w')
    f.write("`timescale 1ns / 1ps\n\n")
    
    f.write(write(f"""module complex_mul_test;
            // Inputs
            reg [{INT-1}:-{DEC}] a;
            reg [{INT-1}:-{DEC}] aj;
            reg [{INT-1}:-{DEC}] b;
            reg [{INT-1}:-{DEC}] bj;

            // Outputs
            wire [{INT-1}:-{DEC}] c;
            wire [{INT-1}:-{DEC}] cj;

            // Instantiate the Unit Under Test (UUT)
            complex_mul uut (
                .a(a), 
                .aj(aj), 
                .b(b), 
                .bj(bj), 
                .c(c), 
                .cj(cj)
            );
            initial begin
                // Initialize Inputs
                """))

    for dec1,hex1 in zip(dec,hexa): 
        f.write(write(f"""
            //{dec1[0]}+j{dec1[1]}
            a={hex1[0].replace('x',"'h")};
            aj={hex1[1].replace('x',"'h")};
            //{dec1[2]}+j{dec1[3]}
            b={hex1[2].replace('x',"'h")};
            bj={hex1[3].replace('x',"'h")};
            #100;
            """))
    
    f.write(write("""end
        
        always @(a,aj,b,bj)
        $monitor("['%h','%h'],\\n",c,cj);

        """))
        
    f.write("/*Expected output:\n[\n")
    for dec1,hex1 in zip(dec,hexa):
        
        number1=complex(float(dec1[0]),float(dec1[1]))
        number2=complex(float(dec1[2]),float(dec1[3]))
        t1=number1*number2
        t2=Fxp(t1.real, True, INT+DEC, DEC).hex()
        t3=Fxp(t1.imag, True, INT+DEC, DEC).hex()
        f.write(f"""{t1}\n['{t2.replace('x',"'h")}','{t3.replace('x',"'h")}'],\n""")
	
    f.write("]*/\n\n")
    f.write("endmodule")
    f.close()
    return
   
def List2Hex(d=[],INT=4,DEC=4):
    def m(a):
        return a[2:]
    return "".join(list(map(m,Fxp(d, True, INT+DEC, DEC).hex())))

def Hex2List(L,INT=4,DEC=4):
    n=int((INT+DEC)/4)
    O0=[Fxp('0x'+''.join(i), True, INT+DEC, DEC)() for i in  np.array(list(L[0])).reshape([-1,n])]
    O1=[Fxp('0x'+''.join(i), True, INT+DEC, DEC)() for i in  np.array(list(L[1])).reshape([-1,n])]
    return [complex(r,i) for r,i in zip(O0,O1)]
     
def Complex2R_I(L): 
    R=[]
    I=[]
    for i in L:
        i=complex(i)
        R.append(i.real)
        I.append(i.imag)
    return [R,I]

def FFT_test(d,N=32,INT=4,DEC=4,file_path="FFT_test.v"):
    size=N*(INT+DEC)
    shape=d.shape
    d=d.ravel()

    d=np.array(list(map(float,  Fxp(list('0b'+d), True, INT+DEC, DEC)()  )) ) 
    d=d.reshape(shape)
    def m(a):
        def m2(a):
            return complex(a[0],a[1])
        return list(map(m2,a))
    d=list(map(m,d))
    S=N*(INT+DEC)-1
    f=open(file_path,'w')
    f.write("`timescale 1ns / 1ps\n\n")
    f.write(f"\nmodule test_FFT_{N};\n"

	f"// Inputs\n"
	f"reg [{S}:0] Xn_vect_real;\n"
	f"reg [{S}:0] Xn_vect_imag;\n"
	"reg clk;\n"

	"// Outputs\n"
	f"wire [{S}:0] Xk_vect_real;\n"
	f"wire [{S}:0] Xk_vect_imag;\n"

	"// Instantiate the Unit Under Test (UUT)\n"
	f"FFT_{N} uut (\n"
		".Xn_vect_real(Xn_vect_real),\n"
		".Xn_vect_imag(Xn_vect_imag),\n"
		".Xk_vect_real(Xk_vect_real),\n"
		".Xk_vect_imag(Xk_vect_imag),\n"
		".clk(clk)\n"
	");\n\n"
    "initial begin\n\n")

    for i in d:#i=> list of complex
        C=Complex2R_I(i)
        f.write(f"/*{i}*/\n")
        f.write(f"Xn_vect_real <= {size}'h{List2Hex(d=C[0],INT=INT,DEC=DEC)};\n"
        f"Xn_vect_imag <= {size}'h{List2Hex(d=C[1],INT=INT,DEC=DEC)};\n"
        "#100;\n\n")
                
    f.write("end\n\n"
    "always @(Xn_vect_real,Xk_vect_imag)\n"
    '$monitor("real=%h  imag=%h",Xk_vect_real,Xk_vect_imag);\n\n\n')

    results=np.fft.fft(d)
    f.write(f"//Expected output:\n")
    for i in results:
        f.write(f"/*{i}*/\n")
        C=Complex2R_I(i)
        f.write(f"//real={List2Hex(d=C[0],INT=INT,DEC=DEC)}  "
        f"imag={List2Hex(d=C[1],INT=INT,DEC=DEC)}\n\n\n")



    f.write("endmodule")
    f.close()

