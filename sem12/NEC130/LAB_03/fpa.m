function [result] = fpa(matriz, N)
  h = (-1/N^2)*ones(N, N);
  i = ceil(N/2);
  h(i, i) = N^2-1;
  % Convolução
  result = conv2(matriz, h);
endfunction