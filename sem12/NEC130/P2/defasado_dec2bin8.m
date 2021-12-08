function result = dec2bin8(numero)
  % Função para converter decimais em uma matriz de 8 binarios
  % Comporta valores entre -128 a 127 sendo o primeiro bit o flag
  % Bit flag 0: Positivo
  % Bit flag 1: Negativo
  n = numero + 256; % Adiciona 
  b = dec2bin(n, 9);
  temp = [
    str2num(b(2))
    str2num(b(3))
    str2num(b(4))
    str2num(b(5))
    str2num(b(6))
    str2num(b(7))
    str2num(b(8))
    str2num(b(9))
  ];
  result = temp';
endfunction  