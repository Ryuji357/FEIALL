% Limpa o console
clear;
clc;

% Carrega o arquivo
load Aula06_ex01.mat;
% X são as coordenadas
% map são as cores


% a)
printf("Atividade a)\n");
printf("A imagem tem dimenções: %dx%d\n", length(X(:, 1)), length(X(1, :)));
printf("O numero de cores possivel é: %d\n", length(map));

% Figure para os itens a e b
figure(1);
colormap(map);

% b)
subplot(1, 2, 1);
image(X);
title("b) Exibindo a imgem corretamente")

% d)
zoom = X(90:160, 20:120);

subplot(1, 2, 2);
image(zoom);
title("d) Zoom no nariz do palhaço")

% c) propriedades brighten
figure(2);
colormap(map);

brighten(0.99);
image(X);
title("BETA = 0.99")

% e)

% Nova figure e colormap
figure(3);
colormap(map);

subplot(2, 2, 1);
image(X);

subplot(2, 2, 2);
image(X');

subplot(2, 2, 3);
image(fliplr(X)');

subplot(2, 2, 4);
image(fliplr(X));