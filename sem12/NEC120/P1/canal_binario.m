function [pe] = canal_binario(p1, pe0, pe1)
%{
Projeto 2

Seja um canal de comunica��o bin�ria, onde o s�mbolo 1 � transmitido com
probabilidade p1 (e consequentemente o s�mbolo 0 � transmitido com probabilidade
p0=1-p1). Dado que a probabilidade de detec��o com erro quando o s�mbolo 1 �
transmitido � dada por pe1, e que a probabilidade de detec��o com erro quando o
s�mbolo 0 � transmitido � dada por pe0, elabore a seguinte fun��o em MATLAB ou
Octave que retorna a probabilidade de_erro do canal, pe:

pe = canal_binario(p1, pe0, pe1)

Implemente essa fun��o, teste-a e submeta em um arquivo com o nome
canal_binario.m
%}

p0 = 1 - p1; % Propabilidade do bit 0

pe = p0*pe0 + p1*pe1;

endfunction