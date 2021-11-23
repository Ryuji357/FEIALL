function [pk] = canal_simetrico(n, k, pe)
%{
Projeto 1

Um canal sim�trico bin�rio tem probabilidade de_erro pe. Uma sequ�ncia de n
d�gitos bin�rios � transmitida por esse canal e deseja-se determinar a
probabilidade de receber at� k d�gitos em erro, dada por pk. Elabore a seguinte
fun��o em MATLAB ou Octave:

pk = canal_simetrico(n, k, pe)

Implemente essa fun��o, teste-a e submeta em um arquivo com o nome
canal_simetrico.m
%}

pk = nchoosek(n, k) * (pe^k) * ((1-pe)^(n-k));

% Fun��o nchoosek(n, k) = fatorial(n)/(fatorial(k) * fatorial(n-k))

endfunction