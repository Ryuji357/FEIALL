x = [1];
nx = 0:0;
h1 = [1 3 3 2 1];
nh1 = 0:4;
h2 = [1 1];
nh2 = 0:1;

[y1, ny1] = conv1(x, nx, h1, nh1);
[y2, ny2] = conv1(y1, ny1, h2, nh2);
[y, ny] = conv1(y2, ny2, h2, nh2);

subplot(1, 3, 1);
stem(ny1, y1);
grid;
grid minor;
title('x[n]*h1[n]');

subplot(1, 3, 2);
stem(ny2, y2);
grid;
grid minor;
title('x[n]*h1[n]*h2[n]');

subplot(1, 3, 3);
stem(ny, y);
grid;
grid minor;
title('y[n]');