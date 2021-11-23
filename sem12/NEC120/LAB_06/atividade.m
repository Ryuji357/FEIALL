close all;
clear;
clc;

p_e = 0.2;
n = 10;
mean_k_control = n*p_e;

mean_k = 0;
for k = 0:1:n
  p_k = nchoosek(n, k)*(p_e^k)*((1-p_e)^(n-k));
  mean_k = mean_k + k*p_k;
endfor

disp(mean_k_control);
disp(mean_k);