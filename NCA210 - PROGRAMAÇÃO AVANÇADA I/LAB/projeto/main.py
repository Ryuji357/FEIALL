# -*- coding: utf-8 -*-
"""
Created on Wed Oct  7 21:19:39 2020

@author: Ryuji
"""

import os
import sys
import csv

from hashlib import sha256
from getpass import getpass

#%% Toolbox
def verifica_cpf(cpf):
    try: # Se der erro, então o input é invalido
        n = cpf[:9] # Numero CPF
        v = cpf[9:] # Digitos verificadores
    
        # Calculo doas digitaos verificadores
        d1 = 0
        d2 = 0
        for x in range(8, -1, -1):
            d = int(cpf[x])
            d1 += (d*(x+1))
            d2 += (d*x)
        d1 = (d1%11)%10
        d2 = ((d2 + d1*9)%11)%10
    
        # Comparação
        if v == '{}{}'.format(d1, d2):
            result = True
        else:
            result = False
    except:
        result = False

    return result

#%% Funções do programa
def criar_db():
    # Função para criar os arquivos para salvar
    contas = open('contas.txt', 'rw+', encoding='utf-8')
    trans = open('transacoes.txt', 'rw+', encoding='utf-8')

    if len(contas.readlines()) > 0:
        contas.write(';'.join([
            'id',
            'nome',
            'cpf',
            'tipo conta',
            'senha'
        ]))

    # Encerrando
    contas.close()
    trans.close()

def busca_conta(cpf):
    pass

def inserir(lista, arquivo):
    # Função para inserir linhas nos arquivos
    try:
        arq = open(arquivo, 'a', newline='')
    except FileNotFoundError:
        input('O arquivo não existe.')
        sair()
    arq_csv = csv.writer(arq, delimiter=';', quotechar='"')
    arq_csv.writerow(lista)

    # Limpando, o del não é muito necessario, mas ta ai.
    del arq_csv
    arq.close()

def login():
    cpf = input('Digite seu CPF: ')
    senha = getpass('Digite a senha: ', '*')
    print(cpf, senha)
    input()

def cad_cliente():
    print('Insira os dados solicitados:')
    nome = input('Nome: ')

    #Valia CPF
    cpf = input('CPF: ')
    while verifica_cpf(cpf) is False:
        cpf = input('CPF invalido, digite novamente:')

    print('Selecione o tipo de conta abaixo:')
    print('1 - Salário')
    print('2 - Comum')
    print('3 - Plus')
    conta = input('Tipo de conta: ')
    
    valor_ini = round(float(input('Valor inicial: ')))
    senha = input('Senha: ')

    c = input('Confirma os dados inseridos acima? [Y/n]')

    if c == 'Y':
        #Salvando os dados.
        inserir([
            nome,
            cpf,
            conta,
            sha256(senha.encode()).hexdigest() # Criptografa a senha
        ], 'contas.txt')
        input('Dados salvos, pressione <ENTER>, para retornar ao menu inicial.')
    else:
        menu()
    
def sair():
    input('O programa foi encerrado, pressione <ENTER> para finalizar.')
    sys.exit()

def menu():
    funcoes = { # Dicionario de funções.
        '0': sair,
        '1': cad_cliente
    }

    while True:
        os.system('cls') # Limpa o console no inicio do loop.
        print('1 - Novo Cliente')
        print('2 - Apaga Cliente')
        print('3 - Debita')
        print('4 - Deposita')
        print('5 - Saldo')
        print('6 - Extrato')
        print('\n\n0 - Sai\n')

        opt = input('Insira uma opção: ')
        os.system('cls') # Limpa o console antes de iniciar qualquer função.
        if opt in funcoes: # Verifica se existe a opção
            funcoes[opt]() # Chama função.
        else:
            input('Opção invalida, pressione <ENTER> para retornar ao menu inicial.')

#%% Auto execute
if __name__ == '__main__':

    #criar_db()

    menu()