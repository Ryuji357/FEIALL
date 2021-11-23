function n=snr(sinal, en_db)
  Es = sinal*sinal'/length(sinal);
  sigma_n = sqrt(Es*10^(-en_db/10));
  n = sinal + sigma_n * randn(1, length(sinal));
endfunction