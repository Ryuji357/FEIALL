# -*- coding: utf-8 -*-
"""
Created on Wed Oct 21 20:30:51 2020

@author: Ryuji
"""

'''
Faça um programa para controle de empréstimo de livros, com as classes
Empréstimo, Livro e Pessoa.

- A classe Livro define o nome, autor e editora do livro.
- A classe Empréstimo define o livro emprestado e a data do empréstimo
- A classe Pessoa possui uma lista com os empréstimos realizados.

Crie dois métodos:

- Um para anotar um empréstimo de um livro.
- Uma para imprimir todos os empréstimos de uma pessoa.

Teste o programa, incluindo 5 livros 2 empréstimos e uma pessoa.
'''

class emprestimo:
    livro = object()
    data = str()

    def __init__(self, livro, data):
        self.livro = livro
        self.data = str(data)

    def __str__(self):
        return '{} - {}'.format(self.livro, self.data)

class livro:
    nome = str()
    autor = str()
    editora = str()

    def __init__(self, nome, autor, editora):
        self.nome = str(nome)
        self.autor = str(autor)
        self.editora = str(editora)

    def __str__(self):
        return '"{}", {}'.format(self.nome, self.autor)

class pessoa:
    nome = str()
    lista = list()

    def __init__(self, nome):
        self.nome = str(nome)
        self.lista = list()

    def __str__(self):
        return self.nome

    def empresta(self, empre):
        self.lista.append(empre)

    def listar(self):
        for x in self.lista:
            print(x)

livro1 = livro(
    nome = 'Os miseraveis',
    autor = 'Vitor Hugo',
    editora = 'Recordista'
)
livro2 = livro(
    nome = 'Morte e Vida Severina',
    autor = 'João Cabral de Melo Neto',
    editora = 'Das letras'
)
livro3 = livro(
    nome = 'Eu, robo',
    autor = 'Isaac Asimov',
    editora = '3law'
)
livro4 = livro(
    nome = 'Tinker, Taylor, Soldier, Spy',
    autor = 'John le Carre',
    editora = 'Impor'
)
livro5 = livro(
    nome = 'A Caçada ao Outubro Vermelho',
    autor = 'Tom Clancy',
    editora = 'Suspiria'
)

per1 = pessoa('Del Spooner')
per2 = pessoa('Josisleide')

per1.empresta(emprestimo(livro3, '15/03/2020'))
per1.empresta(emprestimo(livro4, '21/04/2020'))

per2.empresta(emprestimo(livro1, '19/04/2020'))
per2.empresta(emprestimo(livro2, '12/08/2020'))

print('Emprestimos de {}:'.format(per1))
per1.listar()
print()
print('Emprestimos de {}:'.format(per2))
per2.listar()