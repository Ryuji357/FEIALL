function [pe] = canal_binario(p1, pe0, pe1)
%{
Projeto 2

Seja um canal de comunicação binária, onde o símbolo 1 é transmitido com
probabilidade p1 (e consequentemente o símbolo 0 é transmitido com probabilidade
p0=1-p1). Dado que a probabilidade de detecção com erro quando o símbolo 1 é
transmitido é dada por pe1, e que a probabilidade de detecção com erro quando o
símbolo 0 é transmitido é dada por pe0, elabore a seguinte função em MATLAB ou
Octave que retorna a probabilidade de_erro do canal, pe:

pe = canal_binario(p1, pe0, pe1)

Implemente essa função, teste-a e submeta em um arquivo com o nome
canal_binario.m
%}

p0 = 1 - p1; % Propabilidade do bit 0

pe = p0*pe0 + p1*pe1;

endfunction