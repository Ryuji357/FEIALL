% Aula 01 - exercicio 04

function y = aula01_ex04(a)
  t = linspace(0, 2*pi, 1000);
  y = sin(a*t);
  plot(t, y); title('y'); grid;