class Employee:
   def __init__(self, name, position, holiday_entitlement):
       self.name = name
       self.position = position
       self.holiday_entitlement = holiday_entitlement


class Manager(Employee):
    def __init__(self, name, position, holiday_entitlement, subordinates, car):
        # Volám metodu __init__() mateřské třídy
        super().__init__(name, position, holiday_entitlement)
        self.subordinates = subordinates
        self.car = car

class Salesman(Employee):
    def __init__(self, name, position, holiday_entitlement, car):
        # Volám metodu __init__() mateřské třídy
        super().__init__(name, position, holiday_entitlement)
        self.car = car

#FUNKCE isinstance()
marian = Manager("Marian Přísný", "vedoucí konstrukčního oddělení", 30, 5, "Volvo")
marketa = Manager("Markéta Polková", "teamleader", 25, 12, "Škoda Octavia RS")
frantisek = Employee("František Novák", "konstruktér", 25)

attribute = input("Který atribut tě zajímá ?")



jakub = Salesman("Jakub Čmelák", "business development manager", 25, "Škoda Octavia Scout")
employee_list = [marian, marketa, frantisek, jakub]
expected_people = 0
for item in employee_list:
    if isinstance(item, Manager):
        print(f"Posílám pozvánku pro: {item.name}")
        expected_people += 1
print(f"Očekáváme {expected_people} osob.")

#FUNKCE hasattr()
for item in employee_list:
   if hasattr(item, "car"):
        print(f"Tvoje auto {item.car} má naplánovanou výměnu pneumatik.")

#FUNKCE getattr()
value = getattr(frantisek, attribute,"neznámý atribut")
print(value)
for item in employee_list:
    if isinstance(item, Manager):
        print(f"Posílám pozvánku pro: {item.name}")
        expected_people += 1
print(f"Očekáváme {expected_people} osob.")

#FUNKCE hasattr()
for item in employee_list:
   if hasattr(item, "car"):
        print(f"Tvoje auto {item.car} má naplánovanou výměnu pneumatik.")

#FUNKCE getattr()
value = getattr(frantisek, attribute,"neznámý atribut")
print(value)
for item in employee_list:
    if isinstance(item, Manager):
        print(f"Posílám pozvánku pro: {item.name}")
        expected_people += 1
print(f"Očekáváme {expected_people} osob.")

#FUNKCE hasattr()
for item in employee_list:
   if hasattr(item, "car"):
        print(f"Tvoje auto {item.car} má naplánovanou výměnu pneumatik.")

#FUNKCE getattr()
value = getattr(frantisek, attribute,"neznámý atribut")
print(value)
for item in employee_list:
    if isinstance(item, Manager):
        print(f"Posílám pozvánku pro: {item.name}")
        expected_people += 1
print(f"Očekáváme {expected_people} osob.")

#FUNKCE hasattr()
for item in employee_list:
   if hasattr(item, "car"):
        print(f"Tvoje auto {item.car} má naplánovanou výměnu pneumatik.")

#FUNKCE getattr()
value = getattr(frantisek, attribute,"neznámý atribut")
print(value)
for item in employee_list:
    if isinstance(item, Manager):
        print(f"Posílám pozvánku pro: {item.name}")
        expected_people += 1
print(f"Očekáváme {expected_people} osob.")

#FUNKCE hasattr()
for item in employee_list:
   if hasattr(item, "car"):
        print(f"Tvoje auto {item.car} má naplánovanou výměnu pneumatik.")

#FUNKCE getattr()
value = getattr(frantisek, attribute,"neznámý atribut")
print(value)
for item in employee_list:
    if isinstance(item, Manager):
        print(f"Posílám pozvánku pro: {item.name}")
        expected_people += 1
print(f"Očekáváme {expected_people} osob.")

#FUNKCE hasattr()
for item in employee_list:
   if hasattr(item, "car"):
        print(f"Tvoje auto {item.car} má naplánovanou výměnu pneumatik.")

#FUNKCE getattr()
value = getattr(frantisek, attribute,"neznámý atribut")
print(value)
for item in employee_list:
    if isinstance(item, Manager):
        print(f"Posílám pozvánku pro: {item.name}")
        expected_people += 1
print(f"Očekáváme {expected_people} osob.")

#FUNKCE hasattr()
for item in employee_list:
   if hasattr(item, "car"):
        print(f"Tvoje auto {item.car} má naplánovanou výměnu pneumatik.")

#FUNKCE getattr()
value = getattr(frantisek, attribute,"neznámý atribut")
print(value)
for item in employee_list:
    if isinstance(item, Manager):
        print(f"Posílám pozvánku pro: {item.name}")
        expected_people += 1
print(f"Očekáváme {expected_people} osob.")

#FUNKCE hasattr()
for item in employee_list:
   if hasattr(item, "car"):
        print(f"Tvoje auto {item.car} má naplánovanou výměnu pneumatik.")

#FUNKCE getattr()
value = getattr(frantisek, attribute,"neznámý atribut")
print(value)
for item in employee_list:
    if isinstance(item, Manager):
        print(f"Posílám pozvánku pro: {item.name}")
        expected_people += 1
print(f"Očekáváme {expected_people} osob.")

#FUNKCE hasattr()
for item in employee_list:
   if hasattr(item, "car"):
        print(f"Tvoje auto {item.car} má naplánovanou výměnu pneumatik.")

#FUNKCE getattr()
value = getattr(frantisek, attribute,"neznámý atribut")
print(value)
for item in employee_list:
    if isinstance(item, Manager):
        print(f"Posílám pozvánku pro: {item.name}")
        expected_people += 1
print(f"Očekáváme {expected_people} osob.")

#FUNKCE hasattr()
for item in employee_list:
   if hasattr(item, "car"):
        print(f"Tvoje auto {item.car} má naplánovanou výměnu pneumatik.")

#FUNKCE getattr()
value = getattr(frantisek, attribute,"neznámý atribut")
print(value)
for item in employee_list:
    if isinstance(item, Manager):
        print(f"Posílám pozvánku pro: {item.name}")
        expected_people += 1
print(f"Očekáváme {expected_people} osob.")

#FUNKCE hasattr()
for item in employee_list:
   if hasattr(item, "car"):
        print(f"Tvoje auto {item.car} má naplánovanou výměnu pneumatik.")

#FUNKCE getattr()
value = getattr(frantisek, attribute,"neznámý atribut")
print(value)
for item in employee_list:
    if isinstance(item, Manager):
        print(f"Posílám pozvánku pro: {item.name}")
        expected_people += 1
print(f"Očekáváme {expected_people} osob.")

#FUNKCE hasattr()
for item in employee_list:
   if hasattr(item, "car"):
        print(f"Tvoje auto {item.car} má naplánovanou výměnu pneumatik.")

#FUNKCE getattr()
value = getattr(frantisek, attribute,"neznámý atribut")
print(value)

value = getattr(marketa, attribute,"neznámý atribut")
print(value)

if isinstance(marian, Employee):
    print("marian je objekt třídy Manager nebo jejího předka")
else :
    print(" marian není objekt třídy Manager nebo jejího předka")

if isinstance(frantisek, Manager):
    print("frantisek je objekt třídy Manager nebo jejího předka")
else :
    print("frantisek není objekt třídy Manager nebo jejího předka")