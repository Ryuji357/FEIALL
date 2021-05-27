#{
function lambda = servico(sinal, fs)
  global historico = '@';
  raiz = 'roteiro/';
  tecla = detecta_tecla(sinal, fs);
  caminho = [raiz char(tecla) '.txt'];

  if (historico == '@') #Primeira execução
    lambda = ler_arquivo([raiz '_start.txt']);
    historico = [''];
  else
    if (exist([raiz [historico char(tecla)] '.txt']) == 0)
      # Caso o arquivo não exista (Opção invalida)
      lambda = ler_arquivo([raiz '_invalid.txt']);
      if (length(historico) == 0) # Opção invalida no inicio, historico vazio
        lambda = [lambda ler_arquivo([raiz '_start.txt'])];
      else
        lambda = [lambda ler_arquivo([raiz historico '.txt'])];
      endif
    else
      if (lambda == '$')
        historico(end) = [];
      else
        historico = [historico char(tecla)];
      endif
      lambda = ler_arquivo([raiz historico '.txt']);
    endif
  endif
  #disp(historico);
endfunction
#}

function lambda = servico(sinal, fs)
  global historico = '@';
  raiz = 'roteiro/';
  tecla = detecta_tecla(sinal, fs, 0.3);

  if (historico == '@') #Primeira execução
    lambda = ler_arquivo([raiz '_start.txt']);
    historico = [''];
  elseif (historico == '$') #Fim do programa
    lambda = ler_arquivo([raiz '_end.txt']);
  else
    if (exist([raiz [historico char(tecla)] '.txt']) == 0)
      # Caso o arquivo não exista (Opção invalida)
      lambda = ler_arquivo([raiz '_invalid.txt']);
      if (length(historico) == 0) # Opção invalida no inicio, historico vazio
        lambda = [lambda ler_arquivo([raiz '_start.txt'])];
      else
        lambda = [lambda ler_arquivo([raiz historico '.txt'])];
      endif
    else
      tipo = ler_arquivo([raiz historico char(tecla) '.txt'], true);
      if strcmpi(tipo, 'end') #Ultima opcção
        lambda = ler_arquivo([raiz historico char(tecla) '.txt']);
        historico = '$';
      elseif strcmpi(tipo, 'return') #Retorno
        historico(end) = [];
        lambda = ler_arquivo([raiz historico '.txt']);
      else
        historico = [historico char(tecla)];
        lambda = ler_arquivo([raiz historico '.txt']);
      endif
    endif
  endif
  lambda = [char(tecla) '-' char(10) lambda];
endfunction