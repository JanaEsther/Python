class Employee:
    def __init__(self, name, position, holiday_entitlement, probation_period):
        self.name = name
        self.position = position
        self.holiday_entitlement = holiday_entitlement
        self.probation_period = probation_period

    def get_info(self):
        return f"Zaměstnanec {self.name} pracuje na pozici {self.position}."

    def take_holiday(self, days):
        if self.holiday_entitlement >= days:
            self.holiday_entitlement -= days
            return f"Užij si to."
        else:
            return f"Bohužel už máš nárok jen na {self.holiday_entitlement} dní."

    def __str__(self):
        if self.probation_period:
            return f"Je ve zkušební době."
        else:
            return f"Není ve zkušební době."

frantisek = Employee("František Novák", "konstruktér", 25, True)
klara = Employee("Klára Nová", "konstruktérka", 25, False)
print(frantisek.get_info())
print(str(frantisek))
print(klara.get_info())
print(str(klara))
print(frantisek.take_holiday(5))
print(frantisek.take_holiday(15))
print(frantisek.take_holiday(10))
print(klara.take_holiday(10))
print(klara.take_holiday(20))
