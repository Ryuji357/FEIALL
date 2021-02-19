# -*- coding: utf-8 -*-
"""
Created on Wed Oct 21 20:30:51 2020

@author: Ryuji
"""

'''
Escreva uma classe que implemente um controle de despesas de um indivíduo. Ela
possui uma listas, onde podem ser registradas as despesas da pessoa dia a dia,
anotando o dia, mês e ano da despesa. A classe implementa os seguintes métodos:

- o construtor: Recebe como parâmetro o CPF e cria um objeto para anotar as
despesas de uma pessoa.
- adicionaDespesa: recebe como parâmetro a despesa e o dia, e guarda na lista.
- totalizaMesAno: recebe como parâmetro um mês e um ano especifico e imprime
todos os gastos da pessoa no período e a soma de todas as despesas.

Teste o objeto e os métodos em um programa principal.
'''

class despesa:
    cpf = str()
    lista = list() # [data, descricao, valor]

    def __init__(self, cpf):
        self.cpf = str(cpf).replace('.', '').replace('-', '')
        self.lista = list()

    def adicionaDespesa(self, valor, descricao, data):
        self.lista.append({
            'data': tuple(data.split('/')),
            'descricao': str(descricao),
            'valor': float(valor)
        })

    def totalizaMesAno(self, mes, ano):
        total = 0.0
        print('Data        Descrição             Valor')
        txt = '{}/{}/{}  {:20}  {:7.2f}'
        for x in self.lista:
            if int(x['data'][1]) == int(mes) and int(x['data'][2]) == int(ano):
                print(txt.format(
                    x['data'][0], x['data'][1], x['data'][2],
                    x['descricao'],
                    x['valor']
                ))
                total += x['valor']
        print('Total do mês {}/{}: {:10.2f}'.format(
            x['data'][1], x['data'][2], total
        ))

k1 = despesa(69394561048)
k2 = despesa('323.620.430-37')

k1.adicionaDespesa(300.00, 'Conta de luz', '03/05/2020')
k1.adicionaDespesa(436.00, 'Compras para o mês', '05/05/2020')
k1.adicionaDespesa(15.00, 'Emprestimo para amigo', '15/06/2020')
k2.adicionaDespesa(37.99, 'Necrobarista', '22/07/2020')

k1.totalizaMesAno(5, 2020)
print()
k2.totalizaMesAno('07', '2020')