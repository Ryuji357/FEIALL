function lambda = filtro_detecta_faixa(sinal, f, f_d, f_s, sensibilidade)
  lambda = passa_alta(f_d, f, f_s);
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
  # Trecho para arredondar para o numero impar
  n = ceil(fs/deltaf);
  if (rem(n, 2) == 0)
    n = n + 1;
  endif
  x = -((n-1)/2):1:((n-1)/2);
  x(x==0) = 10e-10;

  impulso=zeros(size(x));
  impulso(find(x==0))=1;

  lambda = sin(x*2*pi*fc/fs)./(pi*x);
  lambda = impulso - lambda;
endfunction