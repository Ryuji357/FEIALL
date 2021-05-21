function h = passa_faixa(deltaf, fc1, fc2, fs)
  h = conv(passa_alta(deltaf, fc1, fs), passa_baixa(deltaf, fc2, fs));
endfunction