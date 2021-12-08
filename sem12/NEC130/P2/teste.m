%clear all
%close all
%clc

ts1 = cputime;
bin1 = [];
for i = 1:64:length(l_coef)
  bin1 = [bin1; codifica2(l_coef(i:i+63))];
endfor
temp = dec2bin(bin1(:, 2) + 256, 9);
bin1f = [
  bin1(:, 1)
  str2num(temp(:, 2))
  str2num(temp(:, 3))
  str2num(temp(:, 4))
  str2num(temp(:, 5))
  str2num(temp(:, 6))
  str2num(temp(:, 7))
  str2num(temp(:, 8))
  str2num(temp(:, 9))
];
te1 = cputime;
disp(te1-ts1);

ts2 = cputime;
bin2 = [];
for i = 1:64:length(l_coef)
  bin2 = [bin2; [0 l_coef(1)]];
  for c=1:63
    if sum(abs(l_coef(i+c:i+63))) == 0
      % Adiciona byte end of block
      bin2 = [bin2; [1 0]];
      break
    else
      bin2 = [bin2; [0 l_coef(i+c)]];
    endif
  endfor
endfor
temp = dec2bin(bin2(:, 2) + 256, 9);
bin2f = [
  bin2(:, 1)
  str2num(temp(:, 2))
  str2num(temp(:, 3))
  str2num(temp(:, 4))
  str2num(temp(:, 5))
  str2num(temp(:, 6))
  str2num(temp(:, 7))
  str2num(temp(:, 8))
  str2num(temp(:, 9))
];
te2 = cputime;
disp(te2-ts2);

%{
bin = [];
for i = 1:64:length(l_coef)
  bin = [bin; codifica(l_coef(i:i+63))];
endfor

%{
ts1 = cputime;
for y = 1:8:l_lin
  for x = 1:8:l_col
    % Aplica a função DCT, divide pela quantizção, então aplica o zigzag
    l_coef(id:id+63) = zigzag(round(dct2(Y(y:y+7, x:x+7))./Q));
    id = id + 64;
    l_coef(id:id+63) = zigzag(round(dct2(Cr_c(y:y+7, x:x+7))./Q));
    id = id + 64;
    l_coef(id:id+63) = zigzag(round(dct2(Cb_c(y:y+7, x:x+7))./Q));
    id = id + 64;
  endfor
endfor
te1 = cputime;
disp(te1-ts1);

ts2 = cputime;
for y = 1:8:l_lin
  for x = 1:8:l_col
    % Aplica a função DCT, divide pela quantizção, então aplica o zigzag
    l_coef(id:id+63) = zigzag(round(udct(Y(y:y+7, x:x+7))./Q));
    id = id + 64;
    l_coef(id:id+63) = zigzag(round(udct(Cr_c(y:y+7, x:x+7))./Q));
    id = id + 64;
    l_coef(id:id+63) = zigzag(round(udct(Cb_c(y:y+7, x:x+7))./Q));
    id = id + 64;
  endfor
endfor
te2 = cputime;
disp(te2-ts2);

%{
ts1 = cputime;
rbin = zeros(l_lin/8*l_col/8*3*64, 8);
ibin = 1;
for id=1:64:length(bin)
  for id2 = 0:63
    cbin = bin(ibin, :);
    rbin(id+id2, :) = cbin(2:9);
    ibin += 1;
    if cbin(1) == 1
      break;
    endif
  endfor
endfor
l_dcoef1 = bin2dec(num2str(rbin(:,2:8))).-128*rbin(:,1);
te1 = cputime;
disp(te1-ts1);

ts2 = cputime;
rbin = zeros(l_lin/8*l_col/8*3*64, 8);
id = 1;
id2 = 1;
t = zeros(64, 8);
for ibin=1:length(bin)
  cbin = bin(ibin, :);
  t(mod(id2-1, 64)+1, :) = cbin(2:9);
  id2 = id2 + 1;
  if cbin(1) == 1
    rbin(id:id+63,:) = t;
    t = zeros(64, 8);
    id = id+64;
    id2 = 1;
  endif
endfor
l_dcoef2 = bin2dec(num2str(rbin(:,2:8))).-128*rbin(:,1);
te2 = cputime;
disp(te2-ts2);

%{
rbin = zeros(l_lin/8*l_col/8*3*64, 8);
id = 1;
id2 = 1;
t = zeros(64, 8);
for ibin=1:length(bin)
  cbin = bin(ibin, :);
  t(mod(id2-1, 64)+1, :) = cbin(2:9);
  id2 = id2 + 1;
  if cbin(1) == 1
    rbin(id:id+63,:) = t;
    t = zeros(64, 8);
    id = id+64;
    id2 = 1;
  endif
endfor
l_dcoef = bin2dec(num2str(rbin(:,2:8))).-128*rbin(:,1);

%{
X1 = imread('image.png');

R1 = im2double(X1(:,:,1), 'indexed')-1;
G1 = im2double(X1(:,:,2), 'indexed')-1;
B1 = im2double(X1(:,:,3), 'indexed')-1;

%Y = 0.587*G + 0.299*R + 0.114*B;
%Cb = 128 + 0.564*(B.-Y);
%Cr = 128 + 0.713*(R.-Y);

Y1 =  0.299*R1 + 0.587*G1 + 0.114*B1;
Cb1 = 128 - 0.168736*R1 - 0.331264*G1 + 0.5*B1;
Cr1 = 128 + 0.5*R1 - 0.418688*G1 - 0.081312*B1;

Y_c1 = round(Y1);
Cr_c1 = round(Cr1);
Cb_c1 = round(Cb1);

Y_f1 = Y_c1;
Cr_f1 = Cr_c1;
Cb_f1 = Cb_c1;

% Converte para RGB
Rf1 = round(Y_f1 + 1.402*(Cr_f1 - 128));
Gf1 = round(Y_f1 - 0.344136*(Cb_f1 - 128) - 0.714136*(Cr_f1 - 128));
Bf1 = round(Y_f1 + 1.772*(Cb_f1 - 128));
Xf1(:,:,1) = uint8(Rf1);
Xf1(:,:,2) = uint8(Gf1);
Xf1(:,:,3) = uint8(Bf1);

figure('name', 'Comparação das imagens.');

a = subplot(1,2,1);
imshow(X1);
title('Original');
axis off;
axis('equal');

b = subplot(1,2,2);
imshow(Xf1);
title('Reconstruido');
axis off;
axis('equal');

linkaxes([a, b]);

%{
% Subamostragem inversa 4:2:0
% Cria matrizes YCrCb
Y_d = zeros(l_lin, l_col);
Cr_d = zeros(l_lin, l_col);
Cb_d = zeros(l_lin, l_col);
id = 1;
for y = 1:8:l_lin
  for x = 1:8:l_col
    % Aplica a função DCT, divide pela quantizção, então aplica o zigzag
    Y_d(y:y+7, x:x+7) = iudct(izigzag(l_dcoef(id:id+63)).*Q);
    id = id + 64;
    Cr_d(y:y+7, x:x+7) = iudct(izigzag(l_dcoef(id:id+63)).*Q);
    id = id + 64;
    Cb_d(y:y+7, x:x+7) = iudct(izigzag(l_dcoef(id:id+63)).*Q);
    id = id + 64;
  endfor
endfor

% Converte para RGB
Rf = Y_d + 1.402*(Cr_d - 128); %separa o canal R na matriz R
Gf = Y_d - 0.344136*(Cb_d - 128) - 0.714136*(Cr_d - 128); %separa o canal G na matriz G
Bf = Y_d + 1.772*(Cb_d - 128); %separa o canal B na matriz B
Xf(:,:,1) = Rf;
Xf(:,:,2) = Gf;
Xf(:,:,3) = Bf;

imwrite(Xf, 'result.jpg');


m = [
1 2 6 7 15 16 28 29
3 5 8 14 17 27 30 43
4 9 13 18 26 31 42 44
10 12 19 25 32 41 45 54
11 20 24 33 40 46 53 55
21 23 34 39 47 52 56 61
22 35 38 48 51 57 60 62
36 37 49 50 58 59 63 64
];

r = zigzag(m);
%}
%{
pkg load signal

simg = [
52 55 61 66 70 61 64 73
63 59 55 90 109 85 69 72
62 59 68 113 144 104 66 73
63 58 71 122 154 106 70 69
67 61 68 104 126 88 68 70
79 65 60 70 77 68 58 75
85 71 64 59 55 61 65 83
87 79 69 68 65 76 78 94
];

dimg = desloca(simg);

a = [dimg]

img_dct = round(dct2(dimg, 8, 8));

%{
X = imread ('image.jpg'); %carrega a imagem em X

% Dados da imagem
l_lin = size(X, 1);
l_col = size(X, 2);

%% Extrai o RGB
R = X(:,:,1); %separa o canal R na matriz R
G = X(:,:,2); %separa o canal G na matriz G
B = X(:,:,3); %separa o canal B na matriz B

%% Calcula YCbCr

Y =  0.299*R + 0.587*G + 0.114*B; % Calcula o valor da luminância em função de R,G,B
Cb = 128 - 0.168736*R - 0.331264*G + 0.5*B;% Calcula o valor de Cb em função de R,G,B
Cr = 128 + 0.5*R - 0.418688*G - 0.081312*B;% Calcula o valor de Cr em função de R,G,B
%{
Y = 0.587*G + 0.299*R + 0.114*B; % Calcula o valor da luminância em função de R,G,B
Cb = 128 + 0.564*(B-Y);% Calcula o valor de Cb em função de R,G,B
Cr = 128 + 0.713*(R-Y);% Calcula o valor de Cr em função de R,G,B
%}

% Subamostragem 4:2:0
Yf = zeros(l_lin, l_col);
Crf = zeros(l_lin, l_col);
Cbf = zeros(l_lin, l_col);
iy = Y(1:2:end, 1:2:end);
icr = Cr(1:2:end, 1:2:end);
icb = Cb(1:2:end, 1:2:end);
for i=1:2
  for j=1:2
    Yf(i:2:end, j:2:end) = iy;
    Crf(i:2:end, j:2:end) = icr;
    Cbf(i:2:end, j:2:end) = icb;
  endfor
endfor

Rf = Y + 1.402*(Crf - 128);
Gf = Y - 0.344136*(Cbf - 128) - 0.714136*(Crf - 128);
Bf = Y + 1.772*(Cbf - 128);
Xf(:,:,1) = Rf;
Xf(:,:,2) = Gf;
Xf(:,:,3) = Bf;

figure('name', 'Comparação das imagens.');

a = subplot(1,2,1);
imagesc(X);
title('Original');
axis off;
axis('equal');

b = subplot(1,2,2);
imagesc(Xf);
title('Reconstruido');
axis off;
axis('equal');

linkaxes([a, b]);

%{
%% Converte para RGB
Rf = Y + 1.402*(Cr - 128); %separa o canal R na matriz R
Gf = Y - 0.344136*(Cb - 128) - 0.714136*(Cr - 128); %separa o canal G na matriz G
Bf = Y + 1.772*(Cb - 128); %separa o canal B na matriz B
Xf(:,:,1) = Rf;
Xf(:,:,2) = Gf;
Xf(:,:,3) = Bf;


figure('name', 'Comparação das imagens.');

a = subplot(1,2,1);
imshow(X);
title('Original');
axis off;
axis('equal');

b = subplot(1,2,2);
imshow(Xf);
title('Reconstruido');
axis off;
axis('equal');

linkaxes([a, b]);


% Set colormap
colormap(jet(256));

figure('name', 'Intensidade dos canais');

a = subplot(2,2,1);
imshow(X);
title('Original');
axis off;
axis('equal');

b = subplot(2,2,2);
imagesc(Y);
title('Canal de luminância');
axis off;
axis('equal');

c = subplot(2,2,3);
image(Cb);
title('Canal de Cb');
axis off;
axis('equal');

d = subplot(2,2,4);
image(Cr);
title('Canal de Cr');
axis off;
axis('equal');

linkaxes([a, b, c, d]); % Sincronia zoom
%}