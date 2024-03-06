import employee
# Do závorek píšeme, od jaké třídy dědíme
class Manager(employee.Employee):
    def __init__(self, name, position, holiday_entitlement, subordinates, car):
        # Volám metodu __init__() mateřské třídy
        super().__init__(name, position, holiday_entitlement)
        self.subordinates = subordinates
        self.car = car

    #dunder method - doube under = "dvojité podtržítko"
    def get_info(self):
        return f"Zaměstnanec {self.name} pracuje na pozici {self.position}."

    def __str__(self):
        # Volám metodu __str__() mateřské třídy a k výsledku přidávám další řetězec
        return super().__str__() + f" Má {self.subordinates} podřízených."

manager = Manager("Marian Přísný", "vedoucí konstrukčního oddělení", 30, 5, "Volvo")
manager.take_holiday(10)
print(manager)