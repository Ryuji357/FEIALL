% Define as funções D e Q
D=@(L)[1, L; 0, 1];
Q=@(F)[1, 0; -1/F, 1];

%X0=[x; xp];

F=2.5;
fodo=[1, 5, 0.2, 0;
2, 1, 0, F;
1, 10, 0.2, 0;
2, 1, 0, -F;
1, 5, 0.2, 0];

beamline=fodo;
nlines=size(beamline,1);
nmat=sum(beamline(:,2))+1;
Racc=zeros(2,2,nmat);
Racc(:,:,1)=eye(2);
spos=zeros(nmat,1);

ic=1; % element counter
for line=1:nlines % loop over input elements
for seg=1:beamline(line,2) % loop over repeat-count
ic=ic+1; % next element
Rcurr=eye(2); % matrix in next element
switch beamline(line,1)
case 1 % drift
Rcurr=D(beamline(line,3));
case 2 % thin quadrupole
Rcurr=Q(beamline(line,4));
otherwise
disp('unsupported code')
end
Racc(:,:,ic)=Rcurr*Racc(:,:,ic-1); % concatenate
spos(ic)=spos(ic-1)+beamline(line,3); % position of element
end
end

x0=[0.001;0]; % 1 mm offset at start
data=zeros(1,nmat); % allocate memory
for k=1:nmat
x=Racc(:,:,k)*x0;
data(k)=x(1); % store the position
end
plot(spos,1e3*data,'k');
xlabel('s [m]'); ylabel(' x [mm]');