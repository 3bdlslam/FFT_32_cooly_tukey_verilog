def ConnectMACsInput(f,MACInputs,Bits):
    MACIndexs,MACConstants=MACInputs
    SelCounts=MACIndexs.shape[0]
    f(f"\nalways @(posedge clk1) begin")
    for i,s in enumerate(MACIndexs):
        if SelCounts<=1:
            ''
        elif(i==0):
            f('\nif(Sel==0) begin')
        elif(i<SelCounts-1):
            f(f'\nelse if(Sel=={i}) begin')
        else :
            f(f"\nelse begin")
        for j in s:
            f(f"""
                MAC_in[{j[0]}][{j[1]}][{j[2]}]<=X_reg[{j[3]}][{j[4]}][{j[5]}];""")
        f("\nend") if SelCounts>1 else ''
    f('\nend\n')

    f(f"\nalways @(posedge clk1) begin")
    for i,s in enumerate(MACConstants):
        if SelCounts<=1:
            ''
        elif(i==0):
            f('\nif(Sel==0) begin')
        elif(i<SelCounts-1):
            f(f'\nelse if(Sel=={i}) begin')
        else :
            f(f"\nelse begin")
        
        for j in s:
            f(f"""
                MAC_in[{j[0]}][2][{j[1]}]<={j[2]};""")
        f("\nend") if SelCounts>1 else ''
    f('\nend\n')

def ConnectMACsOutput(f, MACIndexs ,Bits):
    SelCounts=MACIndexs.shape[0]
    Reg='MAC_out_reg'
    plus=0
    f(f"\nalways @(posedge clk1) begin")
    for i,s in enumerate(MACIndexs):
        if SelCounts<=1:
            Reg='X_reg'
            plus=1
        elif(i==0):
            f('\nif(Sel==1) begin')
        elif(i<SelCounts-1):
            f(f'\nelse if(Sel=={i+1}) begin')
        else :
            f(f"\nelse begin")
        for j in s:
            f(f"""
                {Reg}[{j[3]+plus}][{j[4]}][{j[5]}]<=MAC_out[{j[0]}][{j[1]}][{j[2]}];""")
        f("\nend")if SelCounts>1 else ''
    f('\nend\n')
   
def ConnectRegs(f,Layers,N,SelCounts):
    clk='clk2'
    if SelCounts<=2:
        Layers=0
        clk='clk1'
    f(f"\nalways @(posedge {clk}) begin")
    for l in range(Layers+1):
        for n in range(N):
            for j in range(2):
                if l==0:
                    f(f"\nX_reg[0][{n}][{j}]<=X0[{n}][{j}];")
                else :
                    f(f"\nX_reg[{l}][{n}][{j}]<=MAC_out_reg[{l-1}][{n}][{j}];")
    f(f"\nend\n")

def ConnectSel(f,SelCounts):

    if SelCounts==2:
        return
    f(f"""
    always @(posedge clk1,posedge rst)
        if(rst||Sel=={SelCounts-2})
            Sel<=0;
        else 
            Sel<=Sel+1;
        """)
    return