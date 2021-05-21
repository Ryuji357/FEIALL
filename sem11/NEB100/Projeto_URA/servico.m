function lambda = servico(sinal, fs)
  fh = [
    1209
    1336
    1477
    1633
  ];
  fl = [
    697
    700
    852
    941
  ];

  i1 = 1;
  for f1 = fh
    disp(f1-50);
    disp(f1+50);
    r1(i1) = filtro_detecta_faixa(sinal, f1-50, f1+50, 50, fs, 0.1);
  endfor

  i2 = 1;
  for f2 = fl
    disp(f2-50);
    disp(f2+50);
    r2(i2) = filtro_detecta_faixa(sinal, f2-50, f2+50, 50, fs, 0.1);
  endfor

  lambda = strcat(erase(int2str(r1), ' '), ' ', erase(int2str(r2), ' '));
endfunction