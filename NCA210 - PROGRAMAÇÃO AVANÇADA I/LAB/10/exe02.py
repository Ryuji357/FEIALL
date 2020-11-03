# -*- coding: utf-8 -*-
"""
Created on Wed Oct 28 20:58:54 2020

@author: Ryuji
"""

'''
Escreva um programa para armazenar dados de veículos. 

Inicialmente, crie a classe Motor que contém NumCilindro (int) e Potencia
(int). Inclua um construtor sem argumentos que inicialize os dados com zeros e
um que inicialize os dados com os valores recebidos como argumento. Acrescente
duas funções, uma para a entrada de dados, Get(), e uma que imprima os dados,
Print().

Crie a classe Veiculo que utiliza a classe Motor por composição (todo veículo
tem um motor), e que além do motor contenha o Peso em quilos (int), VelMax em
Km/h (int) e Preço em R$ (float). Inclua um construtor sem argumentos que
inicialize os dados com os valores recebidos como argumento. Acrescente duas
funções, uma para a entrada de dados, Get(), e uma que imprima os dados,
Print().

Crie uma classe CarroPasseio derivada da classe Veículo. Inclua Cor(string) e
Modelo (string). Inclua um construtor sem argumentos que inicialize os dados
com zeros e uma que inicialize os dados com os valores recebidos como
argumentos. Acrescente duas funções, uma pára a entrada de dados, Get(), e uma
que imprima os dados, Print().

Crie uma classe Caminhão derivada da classe Veiculo. Inclua Toneladas (carga
máxima), AlturaMax (int) e Comprimento (int). Inclua um construtor sem
argumentos que inicialize os dados com zeros e um que inicialize com os valores
recebidos como argumento. Acrescente duas funções, uma para a entrada de dados,
Get(), e uma que imprima os dados, Print().

Teste estas classes com 2 caminhões e 2 carros de passeio.
'''

class motor:
    def __init__(self, numcilindro = 0, potencia = 0):
        self.numcilindro = int(numcilindro)
        self.potencia = int(potencia)

    def getDados(self, numcilindro = 0, potencia = 0):
        self.numcilindro = int(numcilindro)
        self.potencia = int(potencia)

    def exibe(self):
        print('Dados do motor:')
        print('Numero de cilindros: {}'.format(self.numcilindro))
        print('Potencia do motor: {} HP'.format(self.potencia))

class veiculo:
    def __init__(self, peso = 0, velmax = 0, preco = 0, motor = motor()):
        self.motor = motor
        self.peso = float(peso)
        self.velmax = float(velmax)
        self.preco = float(preco)

    def getPeso(self, peso = None):
        if peso is not None:
            self.peso = float(peso)

    def getVelmax(self, velmax = None):
        if velmax is not None:
            self.velmax = float(velmax)

    def getPreco(self, preco = None):
        if preco is not None:
            self.preco = float(preco)

    def getMotor(self, motor = None):
        if motor is not None:
            self.motor = motor

    def exibe(self):
        print('Especificações:')
        print('Peso: {:.2f} kg.'.format(self.peso))
        print('Velocidade máxima: {:.2f} km/h.'.format(self.velmax))
        print('Preço: {:.2f} reais.'.format(self.preco))
        self.motor.exibe()

class carropasseio(veiculo):
    def __init__(
        self,
        cor = '',
        modelo = '',
        peso = 0,
        velmax = 0,
        preco = 0,
        motor = motor()
    ):
        self.cor = str(cor)
        self.modelo = str(modelo)
        veiculo.__init__(
            self,
            peso = peso,
            velmax = velmax,
            preco = preco,
            motor = motor
        )

    def getCor(self, cor):
        self.cor = str(cor)

    def getModelo(self, modelo):
        self.modelo = str(modelo)

    def exibe(self):
        print('Dados do veiculo:')
        print('Cor: {}.'.format(self.cor))
        print('Modelo: {}.'.format(self.modelo))
        veiculo.exibe(self)

class caminhao(veiculo):
    def __init__(
        self,
        cargamax = 0.0,
        alturamax = 0,
        comprimento = 0,
        peso = 0,
        velmax = 0,
        preco = 0,
        motor = motor()
    ):
        self.cargamax = float(cargamax)
        self.alturamax = int(alturamax)
        self.comprimento = int(comprimento)
        veiculo.__init__(
            self,
            peso = peso,
            velmax = velmax,
            preco = preco,
            motor = motor
        )

    def getCargamax(self, cargamax):
        self.cargamax = float(cargamax)

    def getAlturamax(self, alturamax):
        self.alturamax = int(alturamax)

    def getComprimento(self, comprimento):
        self.comprimento = int(comprimento)

    def exibe(self):
        print('Dados do veiculo:')
        print('Carga Máxima: {:.1f} tonelados.'.format(self.cargamax))
        print('Altura máxima: {} m.'.format(self.alturamax))
        print('Comprimento: {} m.'.format(self.comprimento))
        veiculo.exibe(self)

carro1 = carropasseio(
    cor = 'Prata',
    modelo = 'Fiat Uno',
    peso = 1057,
    velmax = 157,
    preco = 46590.00,
    motor = motor(3, 75)
)
carro2 = carropasseio(
    cor = 'Vermelho',
    modelo = 'Ferrari Portofino',
    peso = 1664,
    velmax = 320,
    preco = 1281443.00,
    motor = motor(8, 600)
)
cam1 = caminhao(
    cargamax = 23,
    alturamax = 4,
    comprimento = 14,
    peso = 1664,
    velmax = 88,
    preco = 167972.00,
    motor = motor(6, 750)
)
cam2 = caminhao(
    cargamax = 41.5,
    alturamax = 4,
    comprimento = 18,
    peso = 5500,
    velmax = 110,
    preco = 238733.00
)

carro1.exibe()
print()
carro2.exibe()
print()
cam1.exibe()
print()
cam2.exibe()
print()