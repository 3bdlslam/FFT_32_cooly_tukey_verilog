from FFT import *

INT=4
DEC=4
N=32
MAC=16
Th=0.1

S=10


FFT_path=f'Results\FFT.v'
Test_FFT_path=f'Results\Test_FFT.v'

f=write(FFT_path)
ft=write(Test_FFT_path)



FFT(N,INT,DEC,MAC,f)

Complex_Mul(INT,DEC,f)

Radix_2_FFT(INT,DEC,f)

FFT_test(S,N,INT,DEC,MAC,Th,ft)


