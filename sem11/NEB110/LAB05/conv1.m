function [y, ny] = conv1(x, nx, h, nh)
  y = conv(x, h);
  ny = nx(1)+nh(1):nx(end)+nh(end);