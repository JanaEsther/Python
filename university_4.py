import math

class Faculty:
    def __init__(self, faculty_name, contact_address):
        self.faculty_name = faculty_name
        self.contact_address = contact_address
        self.students = []
    def add_student(self, student):
        if isinstance(student, Student):
            self.students.append(student)
        else:
            print("Metodě add_student musí být dán objekt třídy Student.")

    print("Metodě add_student musí být dán objekt třídy Student.")

    def get_students(self):
        for item in self.students:
            print(item)
class Student:
    def __init__(self, name, faculty, average_mark):
        self.name = name
        self.faculty = faculty
        self.average_mark = average_mark

    def __str__(self):
        return self.name

fakulta_ekonomicka = Faculty("Fakulta ekonomická", "Hradební 95, Praha")
fakulta_lekarska = Faculty("Fakulta lékařská", "Palachova 130, Praha")
student_1 = Student("Hedvika Novotná", fakulta_ekonomicka, 1.1)
student_2 = Student("Josef Navrátil", fakulta_ekonomicka, None)
student_3 = Student("Andrea Malá", fakulta_lekarska, 1.5)
fakulta_ekonomicka.add_student(student_1)
fakulta_ekonomicka.add_student(student_2)
fakulta_lekarska.add_student(student_3)
print(getattr(student_1, "contact_address", "Adresa neznámá"))
print(student_2.average_mark)





#vazba 1 ku n student má 1 fakultu ake fakulta má více studentů






























