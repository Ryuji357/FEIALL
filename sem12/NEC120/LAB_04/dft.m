function [pout, f] = dft(sinal)
  N = length(sinal);
  X = zeros(N, 1);
  for k = 0:N-1
    temp = 0
    for n = 0:N-1
      temp = temp + sinal(n+1)*e^(-j*2*pi*k*n/N)
    endfor
    X(k) = 
  endfor
endfunction