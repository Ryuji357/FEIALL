function [pk] = canal_simetrico(n, k, pe)
%{
Projeto 1

Um canal simétrico binário tem probabilidade de_erro pe. Uma sequência de n
dígitos binários é transmitida por esse canal e deseja-se determinar a
probabilidade de receber até k dígitos em erro, dada por pk. Elabore a seguinte
função em MATLAB ou Octave:

pk = canal_simetrico(n, k, pe)

Implemente essa função, teste-a e submeta em um arquivo com o nome
canal_simetrico.m
%}

pk = nchoosek(n, k) * (pe^k) * ((1-pe)^(n-k));

% Função nchoosek(n, k) = fatorial(n)/(fatorial(k) * fatorial(n-k))

endfunction