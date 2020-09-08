# -*- coding: utf-8 -*-
"""
Created on Tue Sep  8 14:09:23 2020

@author: Ryuji
"""

import csv
import numpy as np
import matplotlib.pyplot as plt
from tkinter import *

def ler_csv(caminho):
    with open('eggs.csv', newline='') as csvfile:
        spamreader = csv.reader(csvfile, delimiter=';', quotechar='"')
        for row in spamreader:
            yield {'teste1': row[0], 'teste2': row[1]}
