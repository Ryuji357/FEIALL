function h = passa_baixa(deltaf, fc, fs)
  # Trecho para arredondar para o numero impar
  n = ceil(fs/deltaf);
  if (rem(n, 2) == 0)
    n = n + 1;
  endif
  x = -((n-1)/2):1:((n-1)/2);
  x(x==0)=1e-10;
  h = (1/pi)*(sin(x*2*pi*fc/fs)./x);
endfunction