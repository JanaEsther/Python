import math

class Faculty:
    def __init__(self, faculty_name, contact_address, coefficient):
        self.faculty_name = faculty_name
        self.contact_address = contact_address 
        self.coefficient = coefficient
    
class Student:
    def __init__(self, name, faculty):
        self.name = name
        self.faculty = faculty
    def __str__(self):
        return f"Jméno: {self.name}, fakulta:{self.faculty.faculty_name}"

    def calculate_payment(self):
       return math.ceil(35000 * self.faculty.coefficient)
    
fakulta_ekonomicka = Faculty("Fakulta ekonomická", "Hradební 95, Praha", 1.2)
fakulta_lekarska = Faculty("Fakulta lékařská", "Palachova 130, Praha", 2.5)
student_1 = Student("Hedvika Novotná", fakulta_ekonomicka)
student_2 = Student("Josef Navrátil", fakulta_ekonomicka)
student_3 = Student("Andrea Malá", fakulta_lekarska)
# Vypíšeme jméno studenta a jeho/její fakultu pomocí metody __str__
print(student_1)

#Kolik má stát poslat?
print(student_1.calculate_payment())

mnozina = {1, 2, 1}
print(len(mnozina))