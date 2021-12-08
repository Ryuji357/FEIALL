function b = decodifica(bloco)
  b = zeros(1, 64);
  for id=1:64
    b(i) = bin2dec8(bloco(i, 2:end));
    if bloco(i, 1) == 1
      break
    endif
  endfor
  
endfunction