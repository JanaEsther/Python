# 1. Balik podruhe
# Vrať se k návrhu software pro zásilkovou společnost.

# U třídy Package přejmenuj metodu get_info() na __str__() a vyzkoušej,
# jestli nyní stačí k získání informací o balíku funkce print().

# Přidej metodu deliver(). Půjde o obdobu tlačítka, které řidič nebo řidička zmáčkne
# při doručení balíku a zaznamená tak jeho doručení. Metoda nejprve zkontroluje,
# zda balík náhodou již není ve stavu doručen. Pokud ano, metoda vrátí zprávu "Balík již byl doručen".
# Tím bude řidič (řidička) informován(a) o tom, že se pravděpodobně spletl(a) a snaží se zaznamenat
# doručení u špatného balíku. Pokud balík není ve stavu doručen, změň jeho stav právě na doručen a vrať zprávu
# "Doručení uloženo".

# Vyzkoušej metodu deliver(). Co se stane, pokud ji u jednoho balíku zavoláš dvakrát?


class Package:
    def __init__(self, address, weight, state):
        self.address = address
        self.weight = weight
        self.state = state

    def __str__(self):
        return f"Adresa: {self.address} ({self.weight} Kg) - {self.state}"

    def delivery_price(self):
        if self.weight < 10:
            cena = 129
        elif self.weight < 20:
            cena = 159
        else:
            cena = 359
        return cena

    # def deliver(self):
    #     if self.state == 'dorucen':
    #         return 'Balik jiz byl dorucen'
    #     else:
    #         self.state = 'dorucen'
    #         return 'Doruceni ulozeno'

    def deliver(self):
        if self.state == 'nedoruceno':
            self.state = 'doruceno'
            return 'Balik dorucen.'
        else:
            return f'Balik na adresu {self.address} jiz byl dorucen.'

balik_A = Package('A', 10, 'doruceno')
balik_B = Package('B', 10, 'nedoruceno')

print(balik_A)
print(balik_B)
print(balik_A.deliver())
print(balik_B.deliver())

