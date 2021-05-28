from FFT import *

INT=4
DEC=4
N=32
MAC=2
Th=0.2
S=3
FFT_path=f'Results\FFT.v'
Test_FFT_path=f'Results\Test_FFT.v'
FFT_path=r"D:\projects\GithubRepositories\DigitalElectronics\01 FFT\verilog\FFT\FFT.v"
Test_FFT_path=r"D:\projects\GithubRepositories\DigitalElectronics\01 FFT\verilog\FFT\Test_FFT.v"


f=write(FFT_path)
ft=write(Test_FFT_path)



FFT(N,INT,DEC,MAC,f)

Complex_Mul(INT,DEC,f)

Radix_2_FFT(INT,DEC,f)

FFT_test(S,N,INT,DEC,MAC,Th,ft)


