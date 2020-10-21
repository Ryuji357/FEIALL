# -*- coding: utf-8 -*-
"""
Created on Wed Oct  7 21:19:39 2020

@author: Ryuji
"""

import os
import sys
import csv
import datetime
import numpy as np

from hashlib import sha256
from getpass import getpass

#%% Toolbox
def verifica_cpf(cpf):
    try: # Se der erro, então o input é invalido
        #n = cpf[:9] # Numero CPF
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

def sair():
    # Função encerra o programa.
    input('O programa foi encerrado, pressione <ENTER> para finalizar.')
    sys.exit()

#%% Buscas
def listar(arquivo, indice, filtro=None):
    # Função genérica para ler csv

    # Cria um dicionario com listas vazias
    result = dict()
    for x in indice:
        result[x] = list()

    try:
        with open(arquivo, 'r', encoding='utf-8') as arquivo:
            linhas = csv.reader(arquivo, delimiter=';', quotechar='"')
            next(linhas) # Pula linha de titulos
            for x in linhas:
                # Se houver algum fitro a id sera filtrada
                if filtro is not None:
                    if x[0] == str(filtro):
                        result[indice[0]].append(int(x[0]))
                        for y in range(1, len(indice)):
                            result[indice[y]].append(x[y])
                else:
                    result[indice[0]].append(int(x[0]))
                    for y in range(1, len(indice)):
                        result[indice[y]].append(x[y])
        return result
    except FileNotFoundError: # Se o arquivo não existe o programa encerra.
        input('O arquivo não existe.')
        sair()
    except:
        return result

def listar_conta():
    indice = [
        'id',
        'nome',
        'cpf',
        'tipo',
        'senha'
    ]
    return listar('contas.csv', indice)

def listar_extrato(idconta):
    indice = [
        'id_conta',
        'data',
        'valor',
        'tarifa'
    ]
    return listar('transacoes.csv', indice, filtro=idconta)

def login():

    listagem = listar_conta()

    cpf = input('Por favor, insira o CPF: ')

    # Procura o CPF na lista
    if not cpf in listagem['cpf']:
        input('Este CPF não esta cadastrado, pressione <ENTER>')
        return None

    # Retorna o indice do CPF inserido
    indice = listagem['cpf'].index(cpf)

    senha = sha256(input('Insira a senha: ').encode()).hexdigest()

    if senha == listagem['senha'][indice]:
        return {
            'id': listagem['id'][indice],
            'nome': listagem['nome'][indice],
            'cpf': listagem['cpf'][indice],
            'tipo': listagem['tipo'][indice]
                }
    else:
        input('Senha invalida, pressione <ENTER>')
        return None

def inserir(lista, arquivo):
    # Função para inserir linhas nos arquivos
    try:
        arq = open(arquivo, 'a', newline='', encoding='utf-8')
    except FileNotFoundError:
        input('O arquivo não existe.')
        sair()
    arq_csv = csv.writer(arq, delimiter=';', quotechar='"')
    arq_csv.writerow(lista)

    # Limpando, o del não é muito necessario, mas ta ai.
    del arq_csv
    arq.close()

#%% Funções do programa
def criar_db():
    # Função para criar os arquivos para salvar
    try:
        contas = open('contas.csv', 'x', encoding='utf-8', newline='')
        contas_csv = csv.writer(contas, delimiter=';', quotechar='"')
        contas_csv.writerow([
            'id',
            'nome',
            'cpf',
            'tipo',
            'senha'
        ])
        del contas_csv
        contas.close()
        print('Arquivo contas criado')
    except FileExistsError:
        print('Arquivo contas existente')

    try:
        trans = open('transacoes.csv', 'x', encoding='utf-8', newline='')
        trans_csv = csv.writer(trans, delimiter=';', quotechar='"')
        trans_csv.writerow([
            'id_conta',
            'data',
            'valor',
            'tarifa',
            'descrição'
        ])
        del trans_csv
        trans.close()
        print('Arquivo transacoes criado')
    except FileExistsError:
        print('Arquivo transacoes existente')

def cad_cliente():
    listagem = listar_conta()
    # print(listagem) # Só para debug
    id_cliente = max(listagem['id'], default=0) + 1 # Nova ID

    print('Insira os dados solicitados:')
    nome = input('Nome: ')

    # Valida CPF
    cpf = input('CPF: ')
    while verifica_cpf(cpf) is False:
        cpf = input('CPF invalido, digite novamente: ')

    # Verifica se CPF ja existe
    if listagem is not None and cpf in listagem['cpf']:
        input('Esse CPF já foi cadastrado, precione <ENTER> para retornar ao menu principal.')
        return # Encerra função

    print('Selecione o tipo de conta abaixo:')
    print('1 - Salário')
    print('2 - Comum')
    print('3 - Plus')
    conta = input('Tipo de conta: ')

    valor_ini = input('Valor inicial: ')
    valor_ini = round(float(0 if valor_ini == '' else valor_ini), 2)
    senha = input('Senha: ')

    c = input('Confirma os dados inseridos acima? [Y/n]: ')

    if c == 'Y':
        #Salvando os dados.
        inserir([
            id_cliente,
            nome,
            cpf,
            conta,
            sha256(senha.encode()).hexdigest() # Criptografa a senha
        ], 'contas.csv')
        transacao(
            idconta = id_cliente,
            valor = valor_ini,
            descricao = 'Saldo inicial',
            tarifa = 0.00
        )
        input('Dados salvos, pressione <ENTER>, para retornar ao menu inicial.')
    else:
        input('Operação cancelada, pressione <ENTER>')
        return # Encerra a função

def del_cliente():
    print('Apaga cliente')
    cpf = input('Por favor, insira o CPF: ')
    confirma = input('TODOS os dados referentes a este CPF serão DELETADOS, deseja proceguir? [Y/n]: ')

    # Confirmação
    if confirma != 'Y':
        input('Operação cancelada. Pressione <ENTER>.')
        return # Encerra a função

    contas = listar_conta()
    trans = listar_extrato(None)

    # Procura o CPF na lista
    if not cpf in contas['cpf']:
        input('Este CPF não esta cadastrado, precione <ENTER>, para retornar ao menu inicial.')
        return None

    # Retorna o indice do CPF inserido
    indice = contas['cpf'].index(cpf)
    idconta = contas['id'][indice] # ID da conta

    # Reescreve os arquivos
    with open('contas.csv', 'w', encoding='utf-8', newline='') as arquivo:
        arq_csv = csv.writer(arquivo, delimiter=';', quotechar='"')
        titulos = list(contas.keys()) # Preguiça caso eu mude alguma coisa
        arq_csv.writerow(titulos)
        for x in range(len(contas['id'])):
            temp = list()
            if contas['id'][x] != idconta: # Retira as linhas
                for y in titulos:
                    temp.append(contas[y][x])
                arq_csv.writerow(temp)

    with open('transacoes.csv', 'w', encoding='utf-8', newline='') as arquivo:
        arq_csv = csv.writer(arquivo, delimiter=';', quotechar='"')
        titulos = list(trans.keys()) # Preguiça caso eu mude alguma coisa
        arq_csv.writerow(titulos)
        for x in range(len(trans['id_conta'])):
            temp = list()
            if trans['id_conta'][x] != idconta:
                for y in titulos: # Roda os titulos altomaticamente
                    temp.append(trans[y][x])
                arq_csv.writerow(temp)

def transacao(idconta, valor, descricao, tarifa):
    # hota e data atuais
    data = datetime.datetime.now()
    data_txt = '{:02d}/{:02d}/{:04d} {:02d}:{:02d}:{:02d}'.format(
        data.day,
        data.month,
        data.year,
        data.hour,
        data.minute,
        data.second
    )

    inserir([
        idconta,
        data_txt,
        valor,
        tarifa,
        descricao
    ], 'transacoes.csv')

def deposito():
    listagem = listar_conta()

    cpf = input('Por favor, insira o CPF: ')

    # Procura o CPF na lista
    if not cpf in listagem['cpf']:
        input('Este CPF não esta cadastrado, pressione <ENTER>')
        return None
    indice = listagem['cpf'].index(cpf)
    id_conta = listagem['id'][indice]

    valor = input('Insira o valor para deposito: ')
    desc = input('Insira um descrição breve (opcional): ')
    valor = round(float(valor.replace(',', '.')), 2)
    transacao(
        idconta = id_conta,
        valor = valor,
        descricao = desc,
        tarifa = '0.00'
    )

def debito():
    dictcont = login()
    if dictcont is not None:
        valor = input('Insira o valor para debito: ')
        desc = input('Insira um descrição breve (opcional): ')
        valor = round(float(valor.replace(',', '.')), 2)

        p_tipo = {
            '1': (0.05, 0.00),
            '2': (0.03, -500.00),
            '3': (0.01, -5000.00)
        }
        vl_debito = round(valor*p_tipo[dictcont['tipo']][0], 2)

        listagem = listar_extrato(dictcont['id'])
        saldo = sum(
            [float(x) for x in listagem['valor']] +
            [-float(x) for x in listagem['tarifa']]
        ) - vl_debito

        if saldo >= p_tipo[dictcont['tipo']][1]:
            transacao(
                idconta = dictcont['id'],
                valor = -valor,
                descricao = desc,
                tarifa = vl_debito
            )
            return # Sai da função
        else:
            input('Seu saldo é insuficiente para essa transação.')
    input('A operação falhou, pressione <ENTER> para retornar ao menu principal.')

def extrato():
    dictcont = login()
    tipo_conta = {
        '1': 'Salário',
        '2': 'Comum',
        '3': 'Plus'
    }
    txt = 'Data: {}  {:=10.2f}  Tarifa: {:3.2f}  Saldo: {:=10.2f}'
    if dictcont is not None:
        print('Nome: {}'.format(dictcont['nome']))
        print('CPF: {}'.format(dictcont['cpf']))
        print('Conta: {}'.format(tipo_conta[dictcont['tipo']]))
        listagem = listar_extrato(dictcont['id'])
        saldo = 0.0
        for x in range(len(listagem['id_conta'])):
            valor = float(listagem['valor'][x]) - float(listagem['tarifa'][x])
            saldo += valor
            print(txt.format(
                listagem['data'][x],
                float(listagem['valor'][x]),
                float(listagem['tarifa'][x]),
                saldo
            ))
        input('Pressione <ENTER>, para retornar ao menu inicial')
    else:
        input('A operação falhou, pressione <ENTER> para retornar ao menu principal.')

def saldo():
    dictcont = login()
    if dictcont is not None:
        listagem = listar_extrato(dictcont['id'])
        saldo = sum(
            [float(x) for x in listagem['valor']] +
            [-float(x) for x in listagem['tarifa']]
        )
        print('Seu saldo é de: {:=10.2f}'.format(saldo))
        input('Pressione <ENTER> para retornar ao menu principal.')
    else:
        input('A operação falhou, pressione <ENTER> para retornar ao menu principal.')

def menu():
    funcoes = { # Dicionario de funções.
        '0': sair,
        '1': cad_cliente,
        '2': del_cliente,
        '3': debito,
        '4': deposito,
        '5': saldo,
        '6': extrato
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

    criar_db()

    menu()