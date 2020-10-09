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

def criar_db():
    contas = open('contas.txt', 'rw+')
    trans = open('transacoes.txt', 'rw+')

    if len(contas.readlines()) > 0:
        contas.write()

def login():
    cpf = input('Digite seu CPF: ')
    senha = getpass('Digite a senha: ', '*')
    print(cpf, senha)
    input()

def cad_cliente():
    print('Insira os dados solicitados:')
    nome = input('Nome: ')
    cpf = input('CPF: ')
    print('Selecione o tipo de conta abaixo:')
    print('1 - Salário')
    print('2 - Comum')
    print('3 - Plus')
    conta = input('Tipo de conta: ')
    valor_ini = input('Valor inicial: ')
    senha = input('Senha: ')
    
def sair():
    input('O programa foi encerrado, pressione <ENTER> para finalizar.')
    sys.exit()

if __name__ == '__main__':

    #criar_db()

    funcoes = { # Dicionario de funções.
        '0': sair,
        '1': login
    }

    while True:
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
        os.system('cls') # Limpa o console antes do loop reiniciar.