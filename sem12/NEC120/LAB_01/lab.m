% simula digitaliza��o de fonte de informa��o em transmissor
% e sua recupera��o no receptor

clear
close all
clc
%fonte
info = 'mensagem';
info_ascii = double(info);
w = 8; % byte
info_bin = dec2bin(info_ascii, w);
[N w] = size(info_bin);
tx = reshape(info_bin', [1 N*w]);
% canal
tx_d = tx - '0';
stem(tx_d, '.')
% receptor
rx = tx;