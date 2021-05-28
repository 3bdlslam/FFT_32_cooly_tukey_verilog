def IOs(f,N,Size):
    f(f"""`timescale 1ns / 1ps

        module FFT
        (input [{Size-1}:0] Xn_vect_real,Xn_vect_imag,
        input clk1,clk2,rst,
        output [{Size-1}:0] Xk_vect_real,Xk_vect_imag);
        """)


