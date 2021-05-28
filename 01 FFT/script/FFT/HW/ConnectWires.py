def SortInput(f,ButterFly,Size,Bits):
    for i,n in enumerate(ButterFly):
        k=Size-n*Bits
        f(f"\nassign X0[{i}][0]=Xn_vect_real[{k-1}:{k-Bits}];")
        f(f"\nassign X0[{i}][1]=Xn_vect_imag[{k-1}:{k-Bits}];")
    f('\n')

def GenerateMACBlocks(f,MAC):

    for m in range(MAC):
        f(f"""
            radix_2_fft r2_{m}
            (MAC_in[{m}][0][0],MAC_in [{m}][0][1],
            MAC_in [{m}][1][0],MAC_in [{m}][1][1],
            MAC_in [{m}][2][0],MAC_in [{m}][2][1],
            MAC_out[{m}][0][0],MAC_out[{m}][0][1],
            MAC_out[{m}][1][0],MAC_out[{m}][1][1]);""")
    f('\n')

def ConnectOutputs(f,N,Size,Bits,Layers):
    for n in range(N):
        k=Size-n*Bits
        f(f"""
        assign Xk_vect_real[{k-1}:{k-Bits}]=X_reg[{Layers}][{n}][0];
        assign Xk_vect_imag[{k-1}:{k-Bits}]=X_reg[{Layers}][{n}][1];""")
    f('\n')
