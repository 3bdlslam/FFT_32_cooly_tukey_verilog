from .SW import *
from .HW import *
from numpy import *
from fxpmath import Fxp

def Complex_Mul(INT,DEC,f):
    f(f"""`timescale 1ns / 1ps
        
        module complex_mul
        (input signed  [{INT-1}:-{DEC}] in1r,in1j,in2r,in2j,
        output signed  [{INT-1}:-{DEC}] outr,outj);

        wire signed [{2*INT-1}:-{2*DEC}] real_ =(in1r*in2r)-(in1j*in2j);
        wire signed [{2*INT-1}:-{2*DEC}] img_  =(in1j*in2r)+(in1r*in2j);

        assign outr  =real_[{INT-1}:-{DEC}];
        assign outj  =img_ [{INT-1}:-{DEC}];

        endmodule
        """)
    
def Radix_2_FFT(INT,DEC,f):
    Bits=INT+DEC

    f(f"""`timescale 1ns / 1ps

        module radix_2_fft
        (input signed [{INT-1}:-{DEC}] X1_real,X1_imag,X2_real,X2_imag,const_real,const_imag,
        output signed [{INT-1}:-{DEC}] Y1_real,Y1_imag,Y2_real,Y2_imag);

        wire signed   [{INT-1}:-{DEC}] mul_real,mul_imag;

        complex_mul mul(X2_real,X2_imag,const_real,const_imag,mul_real,mul_imag);

        assign Y1_real = X1_real + mul_real;
        assign Y1_imag = X1_imag + mul_imag;
        assign Y2_real = X1_real - mul_real;
        assign Y2_imag = X1_imag - mul_imag;

        endmodule
        """)

def FFT(N,INT,DEC,MAC,f):
    #<-- Consts -->#
    Bits=INT+DEC
    Layers=int(log2(N))
    Size=N*Bits
    ButterFly=butterfly(N)
    MACIndexs=MAC_Indexes(N,MAC)
    MACConstants=MAC_Constants(N,MAC,INT,DEC)
    SelCounts=int(N*Layers/2/MAC)+1
    SelSize=int(ceil(log2(SelCounts)))
    TotSize=N*Layers
    #<-- HW -->#

    # Define Inputs and Outputs
    IOs(f,N,Size)

    # Define wires and regs
    DefineLinks(f,Layers,N,Bits,INT,DEC,MAC,SelSize)

    # Sort input using ButterFly
    SortInput(f,ButterFly,Size,Bits)

    # Generate MAC Blocks
    GenerateMACBlocks(f,MAC)

    # Connect MACs Inputs and Outputs
    ConnectMACsInput (f,[MACIndexs,MACConstants],Bits)
    ConnectMACsOutput(f,MACIndexs,Bits)

    # Connect Registers
    ConnectRegs(f,Layers,N,SelCounts)

    # Connect Selection line
    ConnectSel(f,SelCounts)

    #Connect Outputs
    ConnectOutputs(f,N,Size,Bits,Layers)

    f('\nendmodule\n')


def FFT_test(S,N,INT,DEC,MAC,Th,f):
    Layers=int(log2(N))
    Bits=INT+DEC
    Size=N*Bits
    SelCounts=int(N*Layers/2/MAC)+1
    if SelCounts==2:
        SelCounts=1
    HexReal,HexImag,DecComplex=RandomBinary(S,N,INT,DEC,Th)


    # Define
    f(f"""`timescale 1ns / 1ps

        module Test_FFT;

        // Inputs
        reg [{Size-1}:0] Xn_vect_real;
        reg [{Size-1}:0] Xn_vect_imag;
        reg clk1,clk2,rst;
        // Outputs
        wire [{Size-1}:0] Xk_vect_real;
        wire [{Size-1}:0] Xk_vect_imag;

        // Instantiate the Unit Under Test (UUT)
        FFT uut (
        .Xn_vect_real(Xn_vect_real),
        .Xn_vect_imag(Xn_vect_imag),
        .Xk_vect_real(Xk_vect_real),
        .Xk_vect_imag(Xk_vect_imag),
        .clk1(clk1),.clk2(clk2),.rst(rst)
        );
        """)

    # init
    f(f"""
        initial begin;
            clk1<=0;
            clk2<=1;
            rst<=0;
            #1 rst<=1;
            #1 rst<=0;
        end
        """)
    
    # clk
    f(f'''
        always begin; #{5/SelCounts}; clk1<=~clk1;
        end
        always begin; #5; clk2<=~clk2;
        end
        ''')

        
    
    # initalize the input
    f('''
        initial begin;
        ''')
    for i,val in enumerate(DecComplex):
        results=np.fft.fft(val)
        real,imag=Dec2Hex(results,Bits,DEC,Size)
        real=real.split('h')[1].replace('_', '')
        imag=imag.split('h')[1].replace('_', '')
        f(f"""
            #10;
            Xn_vect_real=  {HexReal[i]};
            Xn_vect_imag=  {HexImag[i]};""")

    f('\nend\n')
    
    # Monitor The Output
    f(f"""
        always @(posedge clk2) 
            $monitor("real=%h  imag=%h\\n\\n",Xk_vect_real,Xk_vect_imag);""")

    '''f(f"""
        always @(posedge clk2) 
            $monitor("input:\\neal=%h  imag=%h",Xn_vect_real,Xn_vect_imag);""")
    '''

    '''f(f"""
        always @(uut.Sel) 
            $monitor("Select:%h",uut.Sel);""")'''

    '''f(f"""
        always @(posedge clk1,clk2) 
            $monitor("clk1:%h , clk2:%h",clk1,clk2);""")'''

    f('\nendmodule\n')

    f('\n/*\nExpected Output:\n')
    for i,val in enumerate(DecComplex):
        #f(f'\n{val}')
        results=np.fft.fft(val)
        real,imag=Dec2Hex(results,Bits,DEC,Size)
        real=real.split('h')[1].replace('_', '')
        imag=imag.split('h')[1].replace('_', '')
        f(f"""
            real={real}  imag={imag}
            
            """)
    f('\n*/\n')




