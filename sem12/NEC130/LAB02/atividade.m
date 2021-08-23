clear all
close all
clc

pkg load video;

v = VideoWriter('result.avi');
v.FrameRate=10;
open(v);

for i=1:100
  #im = imread(['scene', num2str(i), '.jpg']);
  im = rand(1080, 1920, 3)*255;
  im(1:300, 1:300, 1:3) = 0;
  writeVideo(v, im);
endfor

close(v);