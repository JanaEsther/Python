class Package:
    def __init__(self, address, weight, state):
        self.address = address
        self.weight = weight
        self.state = state

    def get_info(self):
        return f'Balík na adresu {self.address}, Praha má hmotnost {self.weight} je ve stavu {self.state}.'

    def __str__(self):
        print(f'Balík na adresu {self.address}, Praha má hmotnost {self.weight} je ve stavu {self.state}.')


def delivery_price(self):
    if self.weight <= 10:
        price = 129
    elif self.weight >= 10 and self.weight <= 20:
        price = 159
    else:
        price = 359

        print(f'Cena balíku je {price} Kč.')

def deliver(self):
    if self.state == 'doručen':
        print(f'Balík již byl {self.state}.') 
    else :
        print("Doručení uloženo.")

package_1 = Package('Thámova 221', 15.5, 'doručen')
package_2 = Package('Jirsíkova 25', 1.5, 'nedoručen')
print(package_1.get_info())
print(package_2.get_info())





