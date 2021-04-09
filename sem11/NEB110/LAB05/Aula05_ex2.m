n = -3:100;

% Item A
x = impulso(n);
y = zeros(size(n));
for naux = find(n==0):length(n),
  y(naux) = x(naux)+5*x(naux-1)+x(naux-3)+0.5*(naux-1)-0.8*y(naux-2);
endfor
%subplot(2, 1, 1);
stem(n, y, '.');
grid;

% Item B
x = degrau(n);
y = zeros(size(n));
for naux = find(n==0):length(n),
  y(naux) = x(naux)+5*x(naux-1)+x(naux-3)+0.5*(naux-1)-0.8*y(naux-2);
endfor
%subplot(2, 1, 2);
stem(n, y, '.');
grid;