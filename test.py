class Employee:
    def __init__(self, name, position, holiday_entitlement):
        self.name = name
        self.position = position
        self.holiday_entitlement = holiday_entitlement
frantisek = Employee("František Novák", "konstruktér", 25)
attr_name = "name"
print(getattr(frantisek, attr_name, "Unknown Attribute"))









