#function h = passa_alta(deltaf, fc, fs)
#  h = passa_baixa(deltaf, fc, fs);

#  N = numel(h);
#  n=-(N-1)/2:(N-1)/2;
#  impulso = zeros(size(n));
#  impulso(n==0) = 1;

#  h = impulso - h;
#endfunction

function h = passa_alta(deltaf, fc, fs)
  # Trecho para arredondar para o numero impar
  n = ceil(fs/deltaf);
  if (rem(n, 2) == 0)
    n = n + 1;
  endif
  x = -((n-1)/2):1:((n-1)/2);
  x(x==0) = 10e-10;

  impulso = zeros(size(x));
  impulso(x==0) = 1;
  

  h = impulso - sin(x*2*pi*fc/fs)./(pi*x);
endfunction
