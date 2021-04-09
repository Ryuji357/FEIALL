clf;
clear;
clc;

a = [1 2 3];
na = 0:2;
b = [9 8 7 10];
nb = 0:3;
c = [1 2 3];
nc = -4:-2;
d = [9 8 7 10];
nd = 1:4;

[y1, ny1] = conv1(a, na, b, nb);
[y2, ny2] = conv1(c, nc, d, nd);

subplot(2, 3, 1)
stem(na, a)
title('a[n]')
subplot(2, 3, 2)
stem(nb, b)
title('b[n]')
subplot(2, 3, 3)
stem(ny1, y1)
title('y1[n] = a[n] * b[n]')

subplot(2, 3, 4)
stem(nc, c)
title('c[n]')
subplot(2, 3, 5)
stem(nd, d)
title('d[n]')
subplot(2, 3, 6)
stem(ny2, y2)
title('y2[n] = c[n] * d[n]')