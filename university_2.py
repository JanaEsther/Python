

class Faculty:
    def __init__(self, faculty_name, contact_address):
        self.faculty_name = faculty_name
        self.contact_address = contact_address
        self.students = []
    def add_student(self, student):
        self.students.append(student)
    def get_students(self):
        for item in self.students:
            print(item)
class Student:
    def __init__(self, name, faculty):
        self.name = name
        self.faculty = faculty
    def __str__(self):
        return self.name
fakulta_ekonomicka = Faculty("Fakulta ekonomická", "Hradební 95, Praha")
fakulta_lekarska = Faculty("Fakulta lékařská", "Palachova 130, Praha")
student_1 = Student("Hedvika Novotná", fakulta_ekonomicka)
student_2 = Student("Josef Navrátil", fakulta_ekonomicka)
student_3 = Student("Andrea Malá", fakulta_lekarska)
fakulta_ekonomicka.add_student(student_1)
fakulta_ekonomicka.add_student(student_2)
fakulta_lekarska.add_student(student_3)
fakulta_ekonomicka.get_students()
fakulta_lekarska.get_students()

#vazba 1 ku n student má 1 fakultu ake fakulta má více studentů






























