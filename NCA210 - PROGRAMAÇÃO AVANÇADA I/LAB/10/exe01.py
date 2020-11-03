# -*- coding: utf-8 -*-
"""
Created on Wed Oct 28 20:58:53 2020

@author: Ryuji
"""

'''
Uma empresa divide seus funcionários entre Professores e Funcionários.

Crie uma hierarquia de classes para melhor representar estas classes, sendo que:

- Os atributos da classe Funcionário são:
- CPF
- Nome
- Idade
- Salário

- Os atributos da classe Professores são:
- CPF
- Nome
- Idade
- Salário
- Departamento
- Disciplinas lecionadas

Teste as duas classes em um programa principal, criando dois funcionários e
dois professores..
'''

class funcionario:
    def __init__(self, nome, cpf, idade, salario):
        self.nome = nome
        self.cpf = cpf
        self.idade = idade
        self.salario = salario

class professor(funcionario):
    def __init__(self, nome, cpf, idade, salario, departamento, disciplina):
        funcionario.__init__(self, nome, cpf, idade, salario)
        self.departamento = departamento
        self.disciplina = disciplina

prof1 = professor(
    nome = 'Bruno',
    cpf = '673.381.440-44',
    idade = 54,
    salario = 1000.00,
    departamento = '',
    disciplina = ''
)
prof2 = professor(
    nome = 'Andrea',
    cpf = '691.706.350-99',
    idade = 35,
    salario = 2000.00,
    departamento = '',
    disciplina = ''
)
func1 = funcionario(
    nome = 'André',
    cpf = '678.890.450-26',
    idade = 63,
    salario = 3000.00
)
func2 = funcionario(
    nome = 'Rosana',
    cpf = '757.753.330-04',
    idade = 34,
    salario = 4000.00
)

print(prof1.nome)
print(func2.salario)