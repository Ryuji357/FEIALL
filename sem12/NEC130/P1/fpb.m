function [result] = fpb(img, N)
  R = img(:,:,1); %canal de vermelho
  G = img(:,:,2); %canal de verde
  B = img(:,:,3); %canal de azul

  h = (1/N^2)*ones(N, N);
  % Convolução
  result(:,:,1) = conv2(R, h);
  result(:,:,2) = conv2(G, h);
  result(:,:,3) = conv2(B, h);
endfunction