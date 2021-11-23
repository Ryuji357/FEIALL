function [result] = DownScaling(im, N)
% Down Scaling método 2
result=0;
for i=1:N
  for j=1:N
    im_dsA = im(i:N:end, j:N:end, 1:3);
    result = (result + im_dsA)/2;
  endfor
endfor
endfunction