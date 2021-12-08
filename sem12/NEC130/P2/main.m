clear all
close all
clc

pkg load signal

str_time = cputime; % Tempo de execução inicial

X_r = imread('image_3.png'); % Carrega a imagem em X

% Dados da imagem
l_lin = size(X_r, 1);
l_col = size(X_r, 2);

x_l = mod(l_lin, 8);
x_c = mod(l_col, 8);

%X = [X_r; zeros(8 - x_l, l_col, 3)];
X = [X_r; repmat(X_r(end, :, :), 8 - x_l, 1)];
l_lin = size(X, 1);
%X = [X zeros(l_lin, 8 - x_c, 3)];
X = [X repmat(X(:, end, :), 1, 8 - x_c)];
l_col = size(X, 2);

% Matriz de quantização
Q = [
16 11 10 16 24 40 51 61
12 12 14 19 26 58 60 55
14 13 16 24 40 57 69 56
14 17 22 29 51 87 80 62
18 22 37 56 68 109 103 77
24 35 55 64 81 104 113 92
49 64 78 87 103 121 120 101
72 92 95 98 112 100 103 99
];

%% Etapa 1
disp('Etapa 1');

% Extrai o RGB
R = im2double(X(:,:,1), 'indexed')-1; %separa o canal R na matriz R
G = im2double(X(:,:,2), 'indexed')-1; %separa o canal G na matriz G
B = im2double(X(:,:,3), 'indexed')-1; %separa o canal B na matriz B

% Converte de RGB para YCbCr
Y =  0.299*R + 0.587*G + 0.114*B; % Calcula o valor da luminância
Cb = 128 - 0.168736*R - 0.331264*G + 0.5*B;% Calcula o valor de Cb
Cr = 128 + 0.5*R - 0.418688*G - 0.081312*B;% Calcula o valor de Cr

% Subamostragem 4:2:0
Cr_a = (
Cr(1:2:end, 1:2:end) +
Cr(2:2:end, 1:2:end) +
Cr(1:2:end, 2:2:end) +
Cr(2:2:end, 2:2:end)
)/4; % Amostra Cr
Cb_a = (
Cb(1:2:end, 1:2:end) +
Cb(2:2:end, 1:2:end) +
Cb(1:2:end, 2:2:end) +
Cb(2:2:end, 2:2:end)
)/4; % Amostra Cb

%Redimencionamento de Cr e Cb
Cr_c = zeros(l_lin, l_col); % Nova matriz Cr
Cb_c = zeros(l_lin, l_col); % Nova matriz Cb
Cr_c(1:end/2, 1:end/2) = Cr_a;
Cb_c(1:end/2, 1:end/2) = Cb_a;

% Variavel de coeficientes
l_coef = zeros(1, l_lin/8*l_col/8*3*64);

% Varre a imagem e separa em blocos de 8
id = 1;
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
  %disp(y/l_lin);
endfor

l_coef = round(l_coef); % Arredonda os valores dos coeficientes

%% Etapa 2
disp('Etapa 2');
% Aplica os algoritmos de converção para cada um dos coeficientes
% A função dec2bin8, converte decimal para binario
%bin = [];
%for i = 1:64:length(l_coef)
%  bin = [bin; codifica(l_coef(i:i+63))];
%endfor

bin_c = [];
for i = 1:64:length(l_coef)
  bin_c = [bin_c; codifica(l_coef(i:i+63))];
endfor
temp = dec2bin(bin_c(:, 2) + 256, 9);
bin = zeros(length(temp), 9);
bin(:, 1) = bin_c(:, 1);
for id=2:9
  bin(:, id) = str2num(temp(:, id));
endfor

%% Etapa 3
disp('Etapa 3');

% Reconstitui o vetor intero para realizar as operações inversas
rbin = zeros(l_lin/8*l_col/8*3*64, 8);
ibin = 1;
for id=1:64:length(rbin)
  for id2 = 0:63
    cbin = bin(ibin, :);
    rbin(id+id2, :) = cbin(2:9);
    ibin += 1;
    if cbin(1) == 1
      break;
    endif
  endfor
endfor
l_dcoef = bin2dec(num2str(rbin(:,2:8))).-128*rbin(:,1);

% Cria matrizes YCrCb
Y_d = zeros(l_lin, l_col);
Cr_d = zeros(l_lin, l_col);
Cb_d = zeros(l_lin, l_col);
id = 1;
for y = 1:8:l_lin
  for x = 1:8:l_col
    % Aplica a função inversa: zigzag, quantização e DCT
    Y_d(y:y+7, x:x+7) = idct2(izigzag(l_dcoef(id:id+63)).*Q);
    id = id + 64;
    Cr_d(y:y+7, x:x+7) = idct2(izigzag(l_dcoef(id:id+63)).*Q);
    id = id + 64;
    Cb_d(y:y+7, x:x+7) = idct2(izigzag(l_dcoef(id:id+63)).*Q);
    id = id + 64;
  endfor
endfor

% Subamostragem inversa 4:2:0
Cr_f = zeros(l_lin, l_col);
Cb_f = zeros(l_lin, l_col);
for id = 0:3
  % Permutação binaria
  b = dec2bin(id, 2);
  b = str2num([b(1); b(2)]) + 1;
  % Percorre quadrados de 4x4 e adiciona pixel
  Cr_f(b(1):2:end, b(2):2:end) = Cr_d(1:end/2, 1:end/2);
  Cb_f(b(1):2:end, b(2):2:end) = Cb_d(1:end/2, 1:end/2);
endfor

% Converte de YCrCb para RGB
Rf = Y_d + 1.402*(Cr_f - 128);
Gf = Y_d - 0.344136*(Cb_f - 128) - 0.714136*(Cr_f - 128);
Bf = Y_d + 1.772*(Cb_f - 128);

% Une RGB em uma variavel
Xf(:,:,1) = uint8(Rf);
Xf(:,:,2) = uint8(Gf);
Xf(:,:,3) = uint8(Bf);

% Redimencionamento
Xf_r = Xf(1:l_lin - 8 + x_l, 1: l_col - 8 + x_c, :);

% Salva imagem reconstruida
imwrite(Xf, 'result.jpg');

% Plotagem
figure('name', 'Comparação das imagens (Com redimencionamento).');

a = subplot(1,2,1);
imagesc((1:l_col)-0.5, (1:l_lin)-0.5, X);
title('Original');
axis off;
axis('equal');

b = subplot(1,2,2);
imagesc((1:l_col)-0.5, (1:l_lin)-0.5, Xf);
title('Reconstruido');
axis off;
axis('equal');

linkaxes([a, b]); % Alinhamento de zoom

figure('name', 'Comparação das imagens.');

a = subplot(1,2,1);
imagesc(X_r);
title('Original');
axis off;
axis('equal');

b = subplot(1,2,2);
imagesc(Xf_r);
title('Reconstruido');
axis off;
axis('equal');

linkaxes([a, b]); % Alinhamento de zoom

end_time = cputime; % Tempo de excução final

%% Relatório de execução
printf('Relatório de execução:\n');
printf('Tempo de execução: %.2f segundos.\n', end_time - str_time);
printf('Tamanho depois da etapa 1: %d bits.\n', length(l_coef)*9);
printf('Tamanho depois da etapa 2: %d bits.\n', length(bin)*9);
printf('Taxa de compressão: %.2f%%.\n', (1-length(bin)/length(l_coef))*100);