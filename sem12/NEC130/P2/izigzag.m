function result = izigzag(seq)
  % Função inverso zigzag
  % Recebe um vetor e gera uma matriz 8X8
  temp = zeros(8, 8);
  indice = 1;
  for d=1:15
    di = d - 7;
    a = max(1, di):1:min(8, d); % Gera sequencia
    if mod(d, 2) % Intercala as inverções
      for i=1:length(a)
        temp(a(end-i+1), a(i)) = seq(indice);
        indice += 1;
      endfor
    else
      for i=1:length(a)
        temp(a(i), a(end-i+1)) = seq(indice);
        indice += 1;
      endfor
    endif
  endfor
  result = temp;
endfunction