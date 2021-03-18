%Item A
n=-5:5;
x = 2*impulso(n-2)-impulso(n-4);
stem(n, x, '.')

% Item B
n=0:30;
x = n.*(degrau(n)-degrau(n-10))+140*exp(-0.3*n).*degrau(n-10);
stem(n, x, '.');