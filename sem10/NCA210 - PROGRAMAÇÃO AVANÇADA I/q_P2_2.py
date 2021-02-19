import csv, math

def leituraCorrente(caminho):
    r_base = 75/100

    with open(caminho, 'r') as arquivo:
        for x in arquivo.read().splitlines():
            print('{:0.0f} A'.format(float(x.replace('mV', ''))/r_base))

leituraCorrente("medidasShunt.txt")
