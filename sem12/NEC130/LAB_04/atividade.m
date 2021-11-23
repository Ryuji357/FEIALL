im = imread('image.jpg');

N = 1.5;

% UpScaling método 1
l_lin = size(im, 1)*N;
l_col = size(im, 2)*N;
im_us1 = zeros(l_lin, l_col, 3);
for i=1:N
  for j=1:N
    im_us1(i:N:end, j:N:end, 1:3) = im;
  endfor
endfor

figure('name', 'UpScaling1');

sp1 = subplot(2, 1, 1);
imshow(uint8(im));
title('Original');

sp2 = subplot(2, 1, 2);
imshow(uint8(im_us1));
title('Método');

% DownScaling método 2
im_ds2=0;
for i=1:N
  for j=1:N
    im_dsA = im(i:N:end, j:N:end, 1:3);
    im_ds2 = (im_ds2 + im_dsA)/2;
  endfor
endfor

figure('name', 'DownScaling2');

sp1 = subplot(2, 1, 1);
imshow(uint8(im));
title('Original');

sp2 = subplot(2, 1, 2);
imshow(uint8(im_ds2));
title('Método');

%linkaxes([sp1, sp2], 'xy');