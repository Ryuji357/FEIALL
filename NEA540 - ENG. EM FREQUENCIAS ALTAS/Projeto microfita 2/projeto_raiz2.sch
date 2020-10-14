<QucsStudio Schematic 3.3.2>
<Properties>
View=0,9,1534,651,1,39,0
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
GND * 1 180 240 0 0 0 0
Pac P1 1 180 170 18 -26 0 0 "1" 1 "50 Ω" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0 "SUBCLICK" 0
SUBST Subst1 1 210 340 -30 24 0 0 "3.48" 1 "0.168mm" 1 "70µm" 1 "0.0031" 1 "1.72e-08" 1 "0µm" 1 "Metal" 1 "Hammerstad" 0 "Kirschning" 0
.SP SP1 1 340 300 0 63 0 0 "lin" 1 "0.1 GHz" 1 "1 GHz" 1 "1000" 1 "no" 0 "1" 0 "2" 0 "none" 0
Eqn Eqn1 1 510 320 0 8 0 0 "REF_COEF= abs( S[1,1])=" 1 "ROE=(1 + REF_COEF ) / ( 1 - REF_COEF )=" 1 "yes" 0
GND * 1 440 250 0 0 0 0
R R1 1 440 180 15 -26 0 1 "30 Ω" 1 "26.85" 0 "0" 0 "0" 0 "26.85" 0 "US" 0 "SMD0603" 0
MLIN MS1 1 310 100 -26 15 0 0 "Subst1" 1 "0.506098mm" 1 "372.175mm" 1 "26.85" 0
</Components>
<Wires>
180 200 180 240 "" 0 0 0 ""
180 100 180 140 "" 0 0 0 ""
180 100 280 100 "" 0 0 0 ""
340 100 440 100 "" 0 0 0 ""
440 210 440 250 "" 0 0 0 ""
440 100 440 150 "" 0 0 0 ""
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
