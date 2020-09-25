<QucsStudio Schematic 3.3.2>
<Properties>
View=0,29,1568,676,1,0,0
Grid=10,10,1
DataSet=*.dat
DataDisplay=*.dpl
OpenDisplay=1
showFrame=0
FrameText0=Title
FrameText1=Drawn By:
FrameText2=Date:
FrameText3=Revision:
</Properties>
<Symbol>
</Symbol>
<Components>
Pac P1 1 140 180 18 -26 0 0 "1" 1 "50 Ω" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0 "SUBCLICK" 0
GND * 1 140 270 0 0 0 0
GND * 1 820 290 0 0 0 0
Eqn Eqn1 1 90 410 0 8 0 0 "y=1=" 1 "REF_COEF= abs( S[1,1])=" 1 "ROE=(1 + REF_COEF ) / ( 1 - REF_COEF )=" 1 "yes" 0
SUBST RO4003C 1 730 420 -30 24 0 0 "3.38" 1 "0.813 mm" 1 "35 µm" 1 "0.0021" 1 "1.72e-8" 1 "0 µm" 0 "Metal" 1 "Hammerstad" 0 "Kirschning" 0
MOPEN MS3 1 430 320 -169 -26 0 3 "RO4003C" 1 "1.83894 mm" 1 "Kirschning" 0
L L1 1 820 240 10 -26 0 1 "0.557 nH" 1 "0" 0 "" 0 "SELF-WE-PD3S" 0
R R1 1 820 160 15 -26 0 1 "5 Ω" 1 "26.85" 0 "0" 0 "0" 0 "26.85" 0 "european" 0 "SMD0603" 0
.SP SP1 1 490 380 0 79 0 0 "lin" 1 "0.01 GHz" 1 "2 GHz" 1 "599" 1 "no" 0 "1" 0 "2" 0 "none" 0
MLIN MS1 1 630 120 -26 15 0 0 "RO4003C" 1 "1.83894 mm" 1 "6.88892 mm" 1 "26.85" 0
MLIN MS2 1 430 200 15 -26 0 1 "RO4003C" 1 "1.83894 mm" 1 "55.0084 mm" 1 "26.85" 0
</Components>
<Wires>
140 210 140 270 "" 0 0 0 ""
140 120 140 150 "" 0 0 0 ""
140 120 430 120 "" 0 0 0 ""
430 230 430 290 "" 0 0 0 ""
430 120 430 170 "" 0 0 0 ""
430 120 600 120 "" 0 0 0 ""
820 270 820 290 "" 0 0 0 ""
820 120 820 130 "" 0 0 0 ""
660 120 820 120 "" 0 0 0 ""
820 190 820 210 "" 0 0 0 ""
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
