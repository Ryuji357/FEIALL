function [result] = Scaling(im, N)
  if (N == 1)
    result = im;
  elseif (N < 1)
    result = DownScaling(im 1/N);
  elseif (N > 1)
    result = UpScaling(im, N);
  endif
endfunction