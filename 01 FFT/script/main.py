from FFT import FFT
from test import FFT_test,complex_mul_test,RandomBinary,Binary2Dec_Hex
import numpy as np
from fxpmath import Fxp

INT=4
DEC=4
N=32


FFT(N=N, INT=INT, DEC=DEC, file_path="FFT.v")


complex_mul_test(d=RandomBinary(N=40,m=INT+DEC,INT=INT, DEC=DEC, Th=1),
                INT=INT,DEC=DEC,
                file_path="complex_mul_test.v")

c=10
d=RandomBinary(N=2*N*c,m=INT+DEC,INT=INT, DEC=DEC, Th=1).reshape([c,N,2])
#[[0,1,2,31],]
FFT_test(d=d,
        N=N,INT=INT,DEC=DEC,
        file_path="FFT_test.v")

