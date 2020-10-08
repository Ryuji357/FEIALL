# -*- coding: utf-8 -*-
"""
Created on Wed Oct  7 21:19:39 2020

@author: Ryuji
"""

from hashlib import sha512
import os

def login():
    print('Login hey.')
    input('')
    pass



if __name__ == '__main__':

    opt = None # Valor inicial de opt para o while
    funcoes = {
        '1': login
    }

    while opt != '0':
        print('1 - Novo Cliente')
        print('2 - Apaga Cliente')
        print('3 - Debita')
        print('4 - Deposita')
        print('5 - Saldo')
        print('6 - Extrato')
        print('\n\n0 - Sai\n')

        opt = input('Insira uma opção: ')
        os.system('cls')
        if opt in funcoes:
            funcoes[opt]()
        else:
            input('Opção invalida, pressione <ENTER> para retornar ao menu inicial.')
        os.system('cls')
    input('O programa foi encerrado, pressione <ENTER> para finalizar.')