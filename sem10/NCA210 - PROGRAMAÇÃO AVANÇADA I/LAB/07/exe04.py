# -*- coding: utf-8 -*-
"""
Created on Wed Sep 23 18:30:36 2020

@author: Ryuji
"""

'''
Python usa o caractere # para marcar o início de um comentário.
O comentário termina no final da linha contendo o caractere #.
Neste exercício, você criará um programa que removerá todos os
comentários de um arquivo de origem do Python. Verifique cada
linha no arquivo para determinar se um caractere # está presente.
Nesse caso, seu programa deve remover todos os caracteres da linha
que comece com # (ignoramos a situação em que o caractere de
comentário ocorre dentro de uma string). Salve o arquivo modificado
usando um novo nome que será inserido pelousuário. O usuário também
informará o nome do arquivo de entrada. 
'''

def formata(cam_in, cam_out):
    # Abre o arquivo origem
    try:
        with open(cam_in, 'r') as arquivo:
            linhas = arquivo.read().splitlines()
    except FileNotFoundError:
        print('Arquivo não existe')
        return

    nlinhas = list()
    for x in linhas:
        if len(x.strip()) == 0 or x.strip()[0] != '#':
            nlinhas.append('{}\n'.format(x))

    # Cria arquivo destino, se existe reescreve
    with open(cam_out, 'w+') as arquivo:
        arquivo.writelines(nlinhas)
        

caminho_in = input('Insira o camimnho do arquivo a ser formatado: ')
caminho_out = input('Insira o caminho do arquivo de saída: ')

formata(caminho_in, caminho_out)