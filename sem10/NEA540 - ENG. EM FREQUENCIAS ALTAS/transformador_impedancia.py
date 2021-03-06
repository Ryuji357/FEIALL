import math

def fatorial(n):
    if n > 1:
        return n*fatorial(n-1)
    else:
        return 1

class transformador:
    vel_luz = 299792458 # Velocidade da luz

    z_gerador = None
    z_carga = None
    secoes = None

    def __init__(self):
        pass

    def verifica_valor(self):
        if self.z_gerador is not None:
            if self.z_carga is not None:
                if self.secoes is not None:
                    return True

    def l(self, frequencia, er = 1, c = None, f = None):
        if c is None:
            result = self.vel_luz/(frequencia*(er**0.5))
        else:
            result = c/(frequencia*(er**0.5))
        return result

    def calcula_a(self):
        if self.verifica_valor():
            self.a = (1/(2**self.secoes))*((self.z_carga - self.z_gerador)/(self.z_carga + self.z_gerador))
            return self.a

    def c(self, n):
        if self.verifica_valor():
            return (fatorial(self.secoes))/(fatorial(self.secoes-n)*fatorial(n))

    def alpha(self, n):
        # self.calcula_a()
        return self.a*self.c(n)

    def calculo_z(self):
        z = [self.z_gerador]
        for x in range(self.secoes):
            print(self.alpha(x))
            z_temp = (-z[x]*(1 + self.alpha(x)))/(self.alpha(x) - 1)
            z.append(z_temp)
        return z

def calculo_n(f, alpha, zc, zo):
    z = abs((zc-zo)/(zc+zo))
    b = math.log(alpha/(z), 2)
    c = -(1 + math.log(math.cos((2-f*math.pi)/4), 2))
    delta = b**2 - 4*c
    n1 = (-b+(delta**0.5))/2
    n2 = (-b-(delta**0.5))/2
    return n1, n2

def calculo_n2(n, alpha, zc, zo):
    a = abs((2**-n)*(zc-zo)/(zc+zo))
    return 2 - (4/math.pi)*math.acos(0.5*(alpha/a)**n)

zc = 150
zo = 75
f = 0.875 # Df/f0
alpha = 0.06

print(calculo_n(f, alpha, zc, zo))


teste = transformador()
teste.z_gerador = zo
teste.z_carga = zc
teste.secoes = 3


'''
teste = transformador()
teste.z_gerador = 50
teste.z_carga = 100
teste.secoes = 3
'''

print(teste.verifica_valor())
print(teste.calcula_a())
print(teste.calculo_z())
print(teste.l(400e6, er = 2))

