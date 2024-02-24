def get_mark(points, bonus=0):
    if points + bonus <= 60:
        mark = 5
    elif points + bonus <= 70:
        mark = 4
    elif points + bonus <= 80:
        mark = 3
    elif points + bonus <= 90:
        mark = 2
    else:
        mark = 1
    return mark

input_points = int(input("Zadej počet bodů v testu:"))
input_bonus = int(input("Zadej počet  bonusových bodů:"))
student_mark = get_mark(input_points, input_bonus)
if student_mark == 5:
    input_points = int(input("Zadej počet bodů z druhého pokusu:"))
    student_mark = get_mark(input_points)
print(f"Známka je {student_mark}")
