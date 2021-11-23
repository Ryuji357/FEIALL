function h=passa_baixa(deltaf, fc, fs)
  % FIR passa-baixa
  % h=passa_baixa(deltaf, fc, fs)
  % com numero de coeficientes impar
  N=ceil(fs/deltaf);
  if mod(N,2)==0,
    N=N+1; % N impar
  endif
  n=-(N-1)/2:(N-1)/2;
  h=2*(fc/fs) * sinc(2*n*fc/fs);
  win = hamming(numel(h))';  % aplica janela de Hamming
  h = h.*win;
endfunction