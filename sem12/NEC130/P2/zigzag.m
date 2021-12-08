function result = zigzag(matriz)
  a = [
    1
    1
    2
    3
    2
    1
    1
    2
    3
    4
    5
    4
    3
    2
    1
    1
    2
    3
    4
    5
    6
    7
    6
    5
    4
    3
    2
    1
    1
    2
    3
    4
    5
    6
    7
    8
    8
    7
    6
    5
    4
    3
    2
    3
    4
    5
    6
    7
    8
    8
    7
    6
    5
    4
    5
    6
    7
    8
    8
    7
    6
    7
    8
    8
  ];
  b = [
    1
    2
    1
    1
    2
    3
    4
    3
    2
    1
    1
    2
    3
    4
    5
    6
    5
    4
    3
    2
    1
    1
    2
    3
    4
    5
    6
    7
    8
    7
    6
    5
    4
    3
    2
    1
    2
    3
    4
    5
    6
    7
    8
    8
    7
    6
    5
    4
    3
    4
    5
    6
    7
    8
    8
    7
    6
    5
    6
    7
    8
    8
    7
    8
  ];
  result = zeros(1, 64);
  for i = 1:64
    result(i) = matriz(a(i), b(i));
  endfor
  
endfunction

%{
function result = zigzag(matriz)
  % Função zigzag
  % Recebe uma matriz 8x8 e gera um vetor com o metodo zigzag
  temp = [];
  for d=1:15
    di = d - 7;
    a = max(1, di):1:min(8, d); % Gera sequencia
    if mod(d, 2) % Intercala as inverções
      for i=1:length(a)
        temp = [temp matriz(a(end-i+1), a(i))];
      endfor
    else
      for i=1:length(a)
        temp = [temp matriz(a(i), a(end-i+1))];
      endfor
    endif
  endfor
  result = temp;
endfunction
%}