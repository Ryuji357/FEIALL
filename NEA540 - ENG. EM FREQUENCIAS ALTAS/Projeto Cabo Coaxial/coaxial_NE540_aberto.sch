<QucsStudio Schematic 3.3.2>
<Properties>
View=0,-16,1047,626,1,3,0
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
Pac P1 1 70 180 18 -26 0 0 "1" 1 "50 Ω" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0 "SUBCLICK" 0
GND * 1 70 250 0 0 0 0
GND * 1 340 260 0 0 0 0
GND * 1 660 260 0 0 0 0
R R2 1 660 130 15 -26 0 1 "30 Ω" 1 "26.85" 0 "0" 0 "0" 0 "26.85" 0 "european" 0 "SMD0603" 0
R R1 1 340 220 15 -26 0 1 "10000 Ω" 1 "26.85" 0 "0" 0 "0" 0 "26.85" 0 "US" 0 "SMD0603" 0
COAX BELDEN_2 1 340 130 16 -26 0 1 "2.3026" 1 "1.72e-8" 0 "1" 0 "9.7287 mm" 0 "2.7432 mm" 0 "180.12 mm" 1 "2e-4" 0 "26.85" 0
Eqn Eqn1 1 300 360 0 8 0 0 "REF_COEF= abs( S[1,1])=" 1 "ROE=(1 + REF_COEF ) / ( 1 - REF_COEF )=" 1 "yes" 0
COAX BELDEN_1 1 510 60 -26 16 0 0 "2.3026" 1 "1.72e-8" 0 "1" 0 "9.7287 mm" 0 "2.7432 mm" 0 "3017.34 mm" 1 "2e-4" 0 "26.85" 0
C C1 1 660 210 17 -26 0 1 "4 pF" 1 "0" 0 "" 0 "neutral" 0 "SMD0603" 0
.SP SP1 1 80 330 0 79 0 0 "lin" 1 "0.1 GHz" 1 "1 GHz" 1 "1000" 1 "no" 0 "1" 0 "2" 0 "none" 0
</Components>
<Wires>
70 210 70 250 "" 0 0 0 ""
70 60 70 150 "" 0 0 0 ""
70 60 340 60 "" 0 0 0 ""
340 250 340 260 "" 0 0 0 ""
340 60 340 100 "" 0 0 0 ""
340 160 340 190 "" 0 0 0 ""
340 60 480 60 "" 0 0 0 ""
540 60 660 60 "" 0 0 0 ""
660 60 660 100 "" 0 0 0 ""
660 160 660 180 "" 0 0 0 ""
660 240 660 260 "" 0 0 0 ""
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
