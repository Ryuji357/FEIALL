function lambda = servico(sinal, fs)
  global historico = '@';
  raiz = 'roteiro/';
  tecla = detecta_tecla(sinal, fs);
  caminho = [raiz char(tecla) '.txt'];

  if (historico == '@') #Primeira execução
    lambda = fileread([raiz '_start.txt']);
    historico = [''];
  else
    if (exist([raiz [historico char(tecla)] '.txt']) == 0)
      # Caso o arquivo não exista (Opção invalida)
      lambda = fileread([raiz '_invalid.txt']);
      if (length(historico) == 0) # Opção invalida no inicio, historico vazio
        lambda = [lambda fileread([raiz '_start.txt'])];
      else
        lambda = [lambda fileread([raiz historico '.txt'])];
      endif
    else
      lambda = fileread(caminho);
      if (lambda == '$')
        historico(end) = [];
      else
        historico = [historico char(tecla)];
      endif
      lambda = fileread([raiz historico '.txt']);
    endif
  endif
  disp(historico);
endfunction