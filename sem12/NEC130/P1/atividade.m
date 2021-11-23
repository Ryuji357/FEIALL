clear all;
close all;
clc;

pkg load video;

vb = VideoReader('video.mp4');
result = VideoWriter('result.avi');
result.FrameRate = vb.FrameRate;
%vb.Height = r_alt
%vb.Width = r_lar
open(result);

v_alt = vb.Height;
v_lar = vb.Width;

printf("Resolução do video:  %dx%d\n", v_lar, v_alt);
printf('Digite a resolução.\n');
r_lar = input('Digite a largura: ');
r_alt = input('Digite a altura: ');
opcao = input('Selecione uma opção: ');

palt = r_alt/v_alt;
plar = r_lar/v_lar;

if (palt > plar)
  N = plar;
else
  N = palt;
endif

if N == 1
  pre = 1;
elseif N < 1
  pre = 2;
  N = 1/floor(1/N);
else
  pre = 3;
  N = floor(N);
endif

printf('Aplicando a proporção: ');
disp(N);

dalt = abs(r_alt - v_alt*N);
dlar = abs(r_lar - v_lar*N);

t = zeros(floor(dalt/2), r_lar, 3);
r = zeros(v_alt*N, floor(dlar/2), 3);
b = zeros(ceil(dalt/2), r_lar, 3);
l = zeros(v_alt*N, ceil(dlar/2), 3);

switch(opcao)
  case 0
    disp('Opção: Sem filtro');
    while (vb.hasFrame())
      img = readFrame(vb);
      writeVideo(result, modifica(img, pre, N, t, r, b, l));
    endwhile
  case 1
    disp('Opção: Filtro passa-baixas');
    while (vb.hasFrame())
      img = readFrame(vb);
      writeVideo(result, modifica(fpb(img, 3), pre, N, t, r, b, l));
    endwhile
  case 2
    disp('Opção Filtro Sobel');
    while (vb.hasFrame())
      img = readFrame(vb);
      writeVideo(result, modifica(sobel(img, 50), pre, N, t, r, b, l));
    endwhile
  otherwise
    disp('Opção invalida');
endswitch

disp('Concluido.');
close(result);