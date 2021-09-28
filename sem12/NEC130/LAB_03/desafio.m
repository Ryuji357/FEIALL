clear all
close all
clc

pkg load video;

vb = VideoReader('video.mp4');

v_fpa = VideoWriter('video_fba.avi');
v_fpa.FrameRate = vb.FrameRate;
open(v_fpa);

v_fpb = VideoWriter('video_fbb.avi');
v_fpb.FrameRate = vb.FrameRate;
open(v_fpb);

v_sobel = VideoWriter('video_sobel.avi');
v_sobel.FrameRate = vb.FrameRate;
open(v_sobel);

while (vb.hasFrame())
  img = readFrame(vb);
  R = img(:,:,1); %canal de vermelho
  G = img(:,:,2); %canal de verde
  B = img(:,:,3); %canal de azul
  Y = 0.587*G+0.299*R+0.114*B; %imagem preto e branco 

  % Filtro passa-alta
  writeVideo(v_fpa, juntar(fpa(R, 3), fpa(G, 3), fpa(B, 3)));

  % Filtro passa-baixa
  writeVideo(v_fpb, juntar(fpb(R, 3), fpb(G, 3), fpb(B, 3)));

  % Filtro Sobel
  writeVideo(v_sobel, sobel(Y, 50));
endwhile

% Fechando os arquivos
close(v_fpa);
close(v_fpb);
close(v_sobel);

disp('Concluido.')