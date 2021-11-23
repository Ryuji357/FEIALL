function [result] = modifica(im, pre, N, t = zeros(0, 0, 3), r = zeros(0, 0, 3), b = zeros(0, 0, 3), l = zeros(0, 0, 3))
  switch(pre)
    case 1
      result = im;
    case 2
      %printf('Aplicando DownScaling\n');
      result = DownScaling(im, floor(1/N));
    case 3
      %printf('Aplicando UpScaling\n');
      result = UpScaling(im, N);
  endswitch
  result = [l result r];
  result = [t; result; b];
endfunction