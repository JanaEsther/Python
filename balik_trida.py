from dataclasses import dataclass

@dataclass
class Package:
    address: str
    weight: float
    state: str

    def get_info(self):
        return f'Balík na adresu {self.address}, má hmotnost {self.weight} je ve stavu {self.state}.'

class RegularPackage(Package):
    def __init__(self, address, weight, state, value):
        super().__init__(address, weight, state)
        self.value = value

    def delivery_price(self):
        if self.weight <= 10:
            price = 129
        elif 10 < self.weight <= 20:
            price = 159
        else:
            price = 359
        return f'Cena balíku je {price} Kč.'

class ValuablePackage(Package):
    def __init__(self, address, weight, state, value):
        super().__init__(address, weight, state)
        self.value = value

    def __str__(self):
        return super().__str__() + f" Balík má hodnotu {self.value} Kč."

    def delivery_price(self):
        base_price = super().delivery_price()
        return base_price + self.value * 0.5

# Example usage:
package_1 = RegularPackage('Thámova 221, Praha 8', 15.5, 'doručen', 500)
package_2 = RegularPackage('Jirsíkova 25, Kácov', 1.5, 'nedoručen', 100)
package_3 = ValuablePackage('Na Lysinách 460/28, Praha 4', 10, 'doručen', 2000)

print(package_1.get_info())
print(package_2.get_info())
print(package_3.get_info())

