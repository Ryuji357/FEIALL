clear;
close all;
clc;

pkg load communications;

% Fonte
info = 'mensagem importante';
info_ascii = double(info);
w = 8; % byte
info_bin = de2bi(info_ascii, w);
[N w] = size(info_bin);
tx = reshape(info_bin, [1 N*w]);

% Canal
stem(tx, '.');
grid on;
grid minor on;

% Receptor
info_bin_rx = reshape(tx, [N w]);
info_bin_rx = bi2de(info_bin_rx);
info_ascii_rx = char(info_bin_rx');

fprintf('Info transmitida = ''%s''\n', info);
fprintf('Info recebida = ''%s''\n', info_ascii_rx);