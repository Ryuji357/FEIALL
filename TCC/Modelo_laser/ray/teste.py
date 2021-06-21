import math

class foton:
    posicao = (0, 0)
    vetor = (0, 0)
    velocidade = 1 # Simulação (não condizente com a realidade)

    def set_vetor(self, angulo):
        self.vetor = (math.cos(angulo), math.sin(angulo))

    def movimento(self):
        
    
