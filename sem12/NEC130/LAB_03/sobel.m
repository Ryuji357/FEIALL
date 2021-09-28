function [result] = sobel(matriz, limiar)
  Bin = zeros (size(matriz,1),size(matriz,2)); 
  Bin(matriz>limiar)=255; 
  Bin(matriz<=limiar)=0;
  %% aplica o filtro do tipo Sobel 
  sobelx = [-1, 0, 1; -2, 0, 2; -1, 0, 1]; %mascara de Sobel em x 
  sobely = [1, 2, 1; 0, 0, 0; -1, -2, -1];%mascara de Sobel em y 
  % aplicando o calculo do gradiente bi-dimensional 
  rx = conv2(Bin,sobelx); 
  ry = conv2(Bin,sobely); 
  % absoluto  
  result = sqrt(rx.^2 + ry.^2); 
endfunction