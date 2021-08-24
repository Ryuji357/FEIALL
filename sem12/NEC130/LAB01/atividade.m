clear all
close all
clc

X = imread ('image.jpg'); %carrega a imagem em X

V = size(X,1); %quantidade de pixels na vertical
H = size(X,2);%quantidade de pixels na horizontal
%relação de aspecto. Valores comuns 16/9 = 0.7778 4/3 = 1.333, 16/10 = 1.6
RA = H/V;
%resolução total = pontos Horizontais x pontos verticais
%Ex: Imagem full HD - 1920 x 1080 pixels ~= 2Mpixels
Res = H*V;

colormap(gray(256)); %define uma variável map com o colormap definido
R = X(:,:,1); %separa o canal R na matriz R
G = X(:,:,2); %separa o canal G na matriz G
B = X(:,:,3); %separa o canal B na matriz B

figure(1, 'name', 'RGB', 'numbertitle', 'off');

subplot(2,2,1);
imshow(X);
title('Original');
axis off;
axis('equal');

subplot(2,2,2);
image(R);
title('canal R');
axis off;
axis('equal');

subplot(2,2,3);
image(G);
title('canal G');
axis off;
axis('equal');

subplot(2,2,4);
image(B);
title('canal B');
axis off;
axis('equal');

%% YCbCr

Y = 0.587*G + 0.299*R + 0.114*B; % Calcula o valor da luminância em função de R,G,B
Cb = 128 + 0.564*(B-Y);% Calcula o valor de Cb em função de R,G,B
Cr = 128 + 0.713*(R-Y);% Calcula o valor de Cr em função de R,G,B

figure(2, 'name', 'YCbCr', 'numbertitle', 'off');

% Set colormap
%colormap(hot(256));
colormap(jet(256));

a = subplot(2,2,1);
imshow(X);
title('Original');
axis off;
axis('equal');

b = subplot(2,2,2);
imagesc(Y);
title('canal de luminância');
axis off;
axis('equal');

c = subplot(2,2,3);
image(Cb);
title('canal de Cb');
axis off;
axis('equal');

d = subplot(2,2,4);
image(Cr);
title('canal de Cr');
axis off;
axis('equal');

linkaxes([a, b, c, d]);

%% Respostas

% Pergunta: A função colormap gera uma matriz de com cores, ao gerar uma figure
%relaciona com os numeros inteiros. Altera-lo gera esquemas de cores diferentes,
%por exemplo: em uma imagem RGB, podemos relacionar os valores de R (red) ao
%colormap, então podemos ver a intensidade da componente R na imagem em um
%padrão de cinza ou qualquer outro esquema de cores disponipinizado para
%facilitar a vizualização.

% Conclusões: O Octave é uma ferramenta poderosa, que pode tambem ser utilizado
%para analise de imagens, nota-se que:
%A função colormap é definida para toda a figure, assim, todos os subplots terão
%que utilizar o mesmo colormap, porém, ao utilizar a função 'imshow', o colormap
%se torna irrelevante.