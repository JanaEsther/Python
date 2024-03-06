
class Package:
    def __init__(self, address, weight, state, value, driver):
        self.address = address
        self.weight = weight
        self.state = state
        self.value = value
        self.driver = driver
    
    def send_message(self):
        return f"Dnes budeme doručovat váš balík. V případě potřeby kontaktujte řidiče na čísle: {self.phone_number}"


class ValuablePackage(Package):
    def __init__(self, address, weight, state, value, driver): 
        super().__init__(address, weight, state, value,driver)
        self.value = value

class Driver():
    def __init__(self, name, phone_number):
        self.name = name
        self.phone_number = phone_number
        
jirka = Driver("Jirka", 420736856145)

package_1 = Package('Thámova 221, Praha 8', 15.5, 'doručen', 5500, jirka)  








