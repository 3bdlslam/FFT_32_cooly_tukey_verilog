
Q
Command: %s
53*	vivadotcl2 
place_design2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7z0202default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7z0202default:defaultZ17-349h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
place_design2default:defaultZ4-22h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
U

Starting %s Task
103*constraints2
Placer2default:defaultZ18-103h px? 
}
BMultithreading enabled for place_design using a maximum of %s CPUs12*	placeflow2
22default:defaultZ30-611h px? 
v

Phase %s%s
101*constraints2
1 2default:default2)
Placer Initialization2default:defaultZ18-101h px? 
?

Phase %s%s
101*constraints2
1.1 2default:default29
%Placer Initialization Netlist Sorting2default:defaultZ18-101h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0052default:default2
1527.5432default:default2
0.0002default:defaultZ17-268h px? 
Z
EPhase 1.1 Placer Initialization Netlist Sorting | Checksum: 0e9777ec
*commonh px? 
?

%s
*constraints2s
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.043 . Memory (MB): peak = 1527.543 ; gain = 0.0002default:defaulth px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0042default:default2
1527.5432default:default2
0.0002default:defaultZ17-268h px? 
?

Phase %s%s
101*constraints2
1.2 2default:default2F
2IO Placement/ Clock Placement/ Build Placer Device2default:defaultZ18-101h px? 
?
?IO Placement failed due to overutilization. This design contains %s I/O ports
 while the target %s, contains only %s available user I/O. The target device has %s usable I/O pins of which %s are already occupied by user-locked I/Os.
 To rectify this issue:
 1. Ensure you are targeting the correct device and package.  Select a larger device or different package if necessary.
 2. Check the top-level ports of the design to ensure the correct number of ports are specified.
 3. Consider design changes to reduce the number of I/Os necessary.
415*place2
10262default:default22
 device: 7z020 package: clg4002default:default2
2552default:default2
2552default:default2
02default:defaultZ30-415h px? 
?
?%s: no pin(s)/port(s)/net(s) specified as objects, only virtual clock '%s' will be created. If you don't want this, please specify pin(s)/ports(s)/net(s) as objects to the command.
483*constraints2 
create_clock2default:default2 
VIRTUAL_clk22default:default2w
aD:/projects/projects/Verilog/VLSI4_fft32/FFT_16MAC_1REG/FFT_16MAC_1REG.srcs/constrs_1/new/top.xdc2default:default2
32default:default8@Z18-483h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
?
Instance %s (%s) is not placed
68*place2/
Xk_vect_imag_OBUF[0]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[100]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[101]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[102]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[103]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[104]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[105]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[106]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[107]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[108]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[109]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place20
Xk_vect_imag_OBUF[10]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[110]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[111]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[112]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[113]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[114]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[115]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[116]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[117]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[118]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[119]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place20
Xk_vect_imag_OBUF[11]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[120]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[121]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[122]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[123]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[124]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[125]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[126]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[127]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[128]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[129]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place20
Xk_vect_imag_OBUF[12]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[130]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[131]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[132]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[133]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[134]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[135]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[136]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[137]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[138]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[139]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place20
Xk_vect_imag_OBUF[13]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[140]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[141]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[142]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[143]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[144]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[145]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[146]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[147]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[148]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[149]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place20
Xk_vect_imag_OBUF[14]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[150]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[151]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[152]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[153]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[154]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[155]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[156]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[157]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[158]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[159]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place20
Xk_vect_imag_OBUF[15]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[160]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[161]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[162]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[163]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[164]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[165]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[166]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[167]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[168]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[169]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place20
Xk_vect_imag_OBUF[16]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[170]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[171]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[172]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[173]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[174]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[175]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[176]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[177]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[178]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[179]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place20
Xk_vect_imag_OBUF[17]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[180]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[181]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[182]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[183]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[184]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[185]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[186]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[187]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[188]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place21
Xk_vect_imag_OBUF[189]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
Instance %s (%s) is not placed
68*place20
Xk_vect_imag_OBUF[18]_inst2default:default2
OBUF2default:default8Z30-68h px? 
?
?Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
Place 30-682default:default2
1002default:defaultZ17-14h px? 
g
RPhase 1.2 IO Placement/ Clock Placement/ Build Placer Device | Checksum: 01a1bb9a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:05 ; elapsed = 00:00:04 . Memory (MB): peak = 1527.543 ; gain = 0.0002default:defaulth px? 
H
3Phase 1 Placer Initialization | Checksum: 01a1bb9a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:05 ; elapsed = 00:00:04 . Memory (MB): peak = 1527.543 ; gain = 0.0002default:defaulth px? 
?
?Placer failed with error: '%s'
Please review all ERROR and WARNING messages during placement to understand the cause for failure.
1*	placeflow2*
IO Clock Placer failed2default:defaultZ30-99h px? 
=
(Ending Placer Task | Checksum: 01a1bb9a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:05 ; elapsed = 00:00:04 . Memory (MB): peak = 1527.543 ; gain = 0.0002default:defaulth px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
472default:default2
02default:default2
02default:default2
1032default:defaultZ4-41h px? 
N

%s failed
30*	vivadotcl2 
place_design2default:defaultZ4-43h px? 
m
Command failed: %s
69*common28
$Placer could not place all instances2default:defaultZ17-69h px? 
?
Exiting %s at %s...
206*common2
Vivado2default:default2,
Thu Jun  3 13:47:21 20212default:defaultZ17-206h px? 


End Record