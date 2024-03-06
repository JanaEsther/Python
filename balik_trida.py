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

package_1 = ValuablePackage("Grimmauldovo náměstí 11", 1.9, "doručen", 5500)
package_2 = RegularPackage("Godrikův důl 47", 1.9, "nedoručen", 0)  # Adjust the value as needed
package_3 = ValuablePackage("Vydrník svatého Drába 13", 1.9, "nedoručen", 5500)


package_list = [package_1, package_2, package_3]
total_value = 0

for package in package_list:
    if isinstance(package, (ValuablePackage)):
        total_value += package.value

print(f"Celková hodnota všech balíků je: {total_value} Kč")

def calculate_total_value(package_list):
    total_value = 0
    for package in package_list:
        if hasattr(package, 'value'):
            total_value += package.value
    return total_value

print(f"Celková hodnota všech balíků je: {total_value} Kč")


total_value = 0
for package in package_list:
    total_value += getattr(package, 'value', 0)

print(f"Celková hodnota všech balíků je: {total_value} Kč")

for package in package_list:
   if isinstance(package ):
       total_value += package.value
print(f"Celková hodnota všech balíků je: {total_value} Kč")



# Example usage:
package_1 = RegularPackage('Thámova 221, Praha 8', 15.5, 'doručen', 5500)
package_2 = RegularPackage('Jirsíkova 25, Kácov', 1.5, 'nedoručen', 10000)
package_3 = ValuablePackage('Na Lysinách 460/28, Praha 4', 10, 'doručen', 2200)



print(package_1.get_info())
print(package_2.get_info())
print(package_3.get_info())

