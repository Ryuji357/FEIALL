C = 0
D = 0

for contador in range(2, 6):
    if(C==4):
        C+=3
    else:
        C+=2

for contador in range(2, 6):
    if(D==4):
        D+=1
    else:
        D+=2

while(C<4):
    if(D==4):
        D+=1
    else:
        D+=2

while(D<4):
    if(D==4):
        C+=3
    else:
        C+=2

print(C)
print(D)
