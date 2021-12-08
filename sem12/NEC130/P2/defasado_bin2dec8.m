function result = bin2dec8(matriz)
  result = bin2dec(num2str(matriz(2:8)))-matriz(1)*128;
endfunction