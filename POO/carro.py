# A palavra "class" é usada para criar uma classe.
# Uma classe funciona como um molde para criar objetos
class Carro:

    # Método Construtor
    # Inicializa os atributos do objeto quando ele é criado
    def __init__(self, marca, modelo, ano, velocidade=0):
        self.marca = marca
        self.modelo = modelo
        self.ano = ano
        self.velocidade = velocidade

    # Métodos
    # Método acelerar
    # "aumento" será o valor recebido para aumentar a velocidade.
    def acelerar(self, aumento):
        # self.velocidade = self.velocidade + aumento
        self.velocidade += aumento

        print(f"O carro acelerou para {self.velocidade} km/h")

    # Método frear
    # "reducao" será o valor recebido para diminuir a velocidade.
    def frear(self, reducao):
        # self.velocidade = self.velocidade - reducao
        self.velocidade -= reducao

        print(f"O carro freou para {self.velocidade} km/h")

    # Método exibir_info
    # Exibe no console uma mensagem de cabeçalho informativa
    def exibir_info(self):
        print("=== Informação do Carro ===")


# Criando objetos da Classe Carro

# "carro1" é uma variável que recebe um objeto do tipo Carro
carro1 = Carro("fiat", "Uno Mille", 2013)

# Exibir informações do carro 1 acessando seus atributos
print(f"Marca: {carro1.marca}")
print(f"Modelo: {carro1.modelo}")
print(f"Ano: {carro1.ano}")

# Chamando os métodos para o carro 1
carro1.acelerar(50)
carro1.frear(20)
carro1.exibir_info()

# Pula uma linha no console para organizar a exibição
print()

# "carro2" é uma variável que recebe outro objeto do tipo Carro
carro2 = Carro("Chevrolet", "Chevette", 1973)

# Exibir informações do carro 2 acessando seus atributos
print(f"Marca: {carro2.marca}")
print(f"Modelo: {carro2.modelo}")
print(f"Ano: {carro2.ano}")

# Chamando os métodos para o carro 2
carro2.acelerar(50)
carro2.frear(30)

