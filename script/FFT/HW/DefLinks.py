def DefineLinks(f,Layers,N,Bits,INT,DEC,MAC,SelSize):

    f(f"""
        wire signed [{INT-1}:-{DEC}] X0 [0:{N-1}][0:1];
        wire signed [{INT-1}:-{DEC}] MAC_out [0:{MAC-1}][0:1][0:1];
        reg  signed [{INT-1}:-{DEC}] MAC_in  [0:{MAC-1}][0:2][0:1];
        reg  signed [{INT-1}:-{DEC}] X_reg [0:{Layers}][0:{N-1}][0:1];
        {f'''reg  [{SelSize-1}:0] Sel;
        reg  signed [{INT-1}:-{DEC}] MAC_out_reg [0:{Layers-1}][0:{N-1}][0:1];'''
         if SelSize!=1 else ""}
        """)