function lambda = filtro_detecta_faixa(sinal, f_1, f_2, f_d, f_s, sensibilidade)
  h = conv(passa_baixa(f_d, f_2, f_s), passa_alta(f_d, f_1, f_s));
  s_f = conv(sinal, h); #Sinal filtrado
  if (mean(abs(s_f))>=sensibilidade)
    lambda = true;
  else
    lambda = false;
  endif
endfunction

function lambda = passa_baixa(deltaf, fc, fs)
  # Trecho para arredondar para o numero impar
  n = ceil(fs/deltaf);
  if (rem(n, 2) == 0)
    n = n + 1;
  endif

  x = -((n-1)/2):1:((n-1)/2);
  x(x==0) = 10e-10;
  lambda = sin(x*2*pi*fc/fs)./(pi*x);
endfunction

function lambda = passa_alta(deltaf, fc, fs)
  h = passa_baixa(deltaf, fc, fs);

  N = numel(h);
  n=-(N-1)/2:(N-1)/2;
  impulso = zeros(size(n));
  impulso(n==0) = 1;

  lambda = impulso - h;
endfunction