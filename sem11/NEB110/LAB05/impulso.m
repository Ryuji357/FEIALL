function x=impulso(n);
  x=zeros(size(n));
  x(find(n==0))=1;