function b = codifica(bloco)
  b = [];
  b = [b; [0 dec2bin8(bloco(1))]];
  for c=2:64
    if sum(abs(bloco(c:end))) == 0
      % Adiciona byte end of block
      b = [b; [1 [0 0 0 0 0 0 0 0]]];
      break
    else
      b = [b; [0 dec2bin8(bloco(c))]];
    endif
  endfor
endfunction