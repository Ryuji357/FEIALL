close all;
clear all;
clc;

% Projeto 1
n = 10;
k = 0;
pe = 0.2;
pk = canal_simetrico(n, k, pe);
disp(pk);

% Projeto 2
p1 = 0.6;
pe0 = 1e-6;
pe1 = 1e-4;
pk = canal_binario(p1, pe0, pe1);
disp(pk);