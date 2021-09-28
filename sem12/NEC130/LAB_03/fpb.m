function [result] = fpb(matriz, N)
  h = (1/N^2)*ones(N, N);
  % Convolução
  result = conv2(matriz, h);
endfunction