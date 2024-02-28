class Employee:
    def __init__(self, name, position, holiday_entitlement, probation_period):
        self.name = name
        self.position = position
        self.holiday_entitlement = holiday_entitlement
        self.probation_period = probation_period

def __str__(self):
        if self.probation_period == True:
            return f"Je ve zkušební době."
        else:
            return f"Není ve zkušební době."

frantisek =Employee ("František Novák", "konstruktér", 25, True)
klara = Employee("Klára Nová", "konstruktérka", 25, False)


print(frantisek.__str__())
print(klara.__str__())



