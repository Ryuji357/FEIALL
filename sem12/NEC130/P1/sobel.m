function [result] = sobel(img, limiar)
  R = img(:,:,1); %canal de vermelho
  G = img(:,:,2); %canal de verde
  B = img(:,:,3); %canal de azul
  Y = 0.587*G+0.299*R+0.114*B; %imagem preto e branco 

  Bin = zeros (size(Y,1),size(Y,2)); 
  Bin(Y>limiar)=255; 
  Bin(Y<=limiar)=0;
  %% aplica o filtro do tipo Sobel 
  sobelx = [-1, 0, 1; -2, 0, 2; -1, 0, 1]; %mascara de Sobel em x 
  sobely = [1, 2, 1; 0, 0, 0; -1, -2, -1];%mascara de Sobel em y 
  % aplicando o calculo do gradiente bi-dimensional 
  rx = conv2(Bin,sobelx); 
  ry = conv2(Bin,sobely); 
  % absoluto  
  result = sqrt(rx.^2 + ry.^2); 
endfunction