function lambda = detecta_tecla(sinal, fs)
  fh = [
    1209
    1336
    1477
    1633
  ];
  fl = [
    697
    770
    852
    941
  ];
  tecla1 = [
    '10001000'
    '01001000'
    '00101000'
    '10000100'
    '01000100'
    '00100100'
    '10000010'
    '01000010'
    '00100010'
    '01000001'
    '00011000'
    '00010010'
    '00011000'
    '00010100'
    '00010010'
    '00010001'
  ];
  tecla2 = [
    '1'
    '2'
    '3'
    '4'
    '5'
    '6'
    '7'
    '8'
    '9'
    '0'
    '*'
    '#'
    'A'
    'B'
    'C'
    'D'
  ];

  codigo = [''];
  for f = fh',
    codigo = [codigo int2str(filtro_detecta_faixa(sinal, f-50, f+50, 50, fs, 0.1))];
  endfor

  for f = fl'
    codigo = [codigo int2str(filtro_detecta_faixa(sinal, f-50, f+50, 50, fs, 0.1))];
  endfor

  disp(tecla1==codigo);
  lambda = tecla2(tecla1==codigo);
endfunction

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