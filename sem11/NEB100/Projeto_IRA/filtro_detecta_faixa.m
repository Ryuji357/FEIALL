function lambda = filtro_detecta_faixa(sinal, fl, fh, sensibilidade)
  
endfunction

function lambda = passa_baixa(deltaf, fc, fs)
  # Trecho para arredondar para o numero impar
  n = ceil(fs/deltaf);
  if (rem(n, 2) == 0)
    n = n + 1;
  endif
  x = -((n-1)/2):1:((n-1)/2);
  x(x==0) = 10e-10;
  lambda  = sin(x*2*pi*fc/fs)./(pi*x);
endfunction