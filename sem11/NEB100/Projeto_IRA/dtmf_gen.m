function lambda = dtmf_gen(tecla)
  lista = [
    2 4
    1 1
    2 1
    3 1
    1 2
    2 2
    3 2
    1 3
    2 3
    3 3
    1 4
    3 4
  ];

  fg = [1209 1336 1477 1633];
  fb = [697 770 852 941];

  fs = 8000;
  t = 0:1/fs:0.2;
  
  length(t)

  #lambda = sin(2*pi*fb(lista(tecla + 1, 1)).*t) + sin(2*pi*fg(lista(tecla + 1, 2)).*t);
  lambda = sin(2*pi*697.*t) + sin(2*pi*1477.*t);
endfunction

% Observação
% As teclas vão de 0 a 11, sendo:
# de 0 a 9 numéricas normais
# 10 -> *
# 11 -> #