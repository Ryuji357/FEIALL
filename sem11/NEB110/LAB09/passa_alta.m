function h = passa_alta(deltaf, fc, fs)
  h = passa_baixa(deltaf, fc, fs);

  N = numel(h);
  n=-(N-1)/2:(N-1)/2;
  impulso = zeros(size(n));
  impulso(n==0) = 1;

  h = impulso - h;
endfunction