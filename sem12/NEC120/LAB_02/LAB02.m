clear;
close all;
clc;

% Fonte
info = 'mensagem importante';
info_ascii = double(info);
w = 8; % byte
info_bin = dec2bin(info_ascii, w);
[N w] = size(info_bin);
tx = reshape(info_bin', [1 N*w]);

% Canal
tx_d = tx - '0';
stem(tx_d, '.');
grid on;
grid minor on;

% Receptor
rx = tx;
%info_bin_rx = repmat('.', [N w]);
info_bin_rx = reshape(rx, [w N]);
info_bin_rx = info_bin_rx';
info_bin_rx = bin2dec(info_bin_rx);
info_ascii_rx = char(info_bin_rx);
info_rx = info_ascii_rx';

fprintf('Info transmitida = ''%s''\n', info);
fprintf('Info recebida = ''%s''\n', info_rx);

% Testes com fprintf
fprintf('Testes com fprintf:\n');
fprintf('Numero de bits transmitidos = %d\n', N*w);
fprintf('pi = %.2f\nbits em um char = %d\n', pi, w);
