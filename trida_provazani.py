class Employee:
   def __init__(self, name, position, holiday_entitlement, manager=None):
       self.name = name
       self.position = position
       self.holiday_entitlement = holiday_entitlement
       self.manager = manager

def __str__(self):
    return f"Zaměstnanec {self.name} pracuje na pozici {self.position}, přímým nadřízeným je {self.manager.name}"


class Manager(Employee):
    def __init__(self, name, position, holiday_entitlement, subordinates, car):
        # Volám metodu __init__() mateřské třídy
        super().__init__(name, position, holiday_entitlement)
        self.subordinates = subordinates
        self.car = car

marian = Manager("Marian Přísný", "vedoucí konstrukčního oddělení", 25, 2, "Škoda Octavia")
klara = Employee("Klára Nová", "konstruktérka", 25, marian)
frantisek = Employee("František Novák", "konstruktér", 25, marian)
