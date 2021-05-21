function h = rejeita_faixa(deltaf, fc1, fc2, fs)
  hpf = passa_faixa(deltaf, fc1, fc2, fs);
  N = numel(hpf);
  n=-(N-1)/2:(N-1)/2;
  delta=zeros(size(n));
  delta(n==0) = 1;
  h = delta - hpf;
endfunction