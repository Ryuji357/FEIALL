function [result] = UpScaling(im, N)
% Up Scaling método 1
l_lin = size(im, 1)*N;
l_col = size(im, 2)*N;
im_us1 = zeros(l_lin, l_col, 3);
for i=1:N
  for j=1:N
    result(i:N:end, j:N:end, 1:3) = im;
  endfor
endfor
endfunction