from dataclasses import dataclass

@dataclass
class Employee:
    name: str
    position: str
    holiday_entitlement: int = 25
    probation_period = True
from dataclasses import dataclass

def __str__(self):
            if self.probation_period:
                return f"Je ve zkušební době."
            else:
                return f"Není ve zkušební době."

def get_info(self):
        return f"Zaměstnanec {self.name} pracuje na pozici {self.position}."

def take_holiday(self, days):
    if self.holiday_entitlement >= days:
        self.holiday_entitlement -= days
        return f"Užij si to."
    else: 
        return f"Bohužel už máš nárok jen na {self.holiday_entitlement} dní."

frantisek = Employee("František Novák", "konstruktér", 25, True)
klara = Employee("Klára Nová", "konstruktérka", 25, False)


print(frantisek)
print(klara)



