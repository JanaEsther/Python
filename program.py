employee_1 = {
    "name": "Jan Novák", 
    "position": "konstruktér", 
    "holiday_entitlement": 25
    }


employee_2 = {
    "name": "Klára Nová", 
    "position": "konstruktérka",
    "holiday_entitlement": 25
    }

employee_2["holiday_entitlement"] = employee_2["holiday_entitlement"] - 10
print(employee_2["holiday_entitlement"])

#třída employee
class Employee:
    def __init__(self, name, position, holiday_entitlement):
        self.name = name
        self.position = position
        self.holiday_entitlement = holiday_entitlement

    def get_info(self):
        return f'Zaměstnanec {self.name} pracuje jako {self.position}.' 

    def take_holiday(self,days):
        if self.holiday_entitlement >= days:
            self.holiday_entitlement -= days
            return 'Užij si to!'
        else:
            return f'Nemáš nárok, zbývá Ti jen {self.holiday_entitlement} dní.'


employee_1 = Employee('František', 'konstruktér', '25')
employee_2 = Employee("Klára Nová", "konstruktérka", 25)



# dunder method
def _str_(self):
        return f'Zaměstnanec {self.name} pracuje jako {self.position}.'