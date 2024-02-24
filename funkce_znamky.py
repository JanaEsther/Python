def get_mark(points):
    if points <= 60:
        mark = 5
    elif points <= 70:
        mark = 4
    elif points <= 80:
        mark = 3
    elif points <= 90:
        mark = 2
    else:
        mark = 1
    return mark

input_points = int(input("Zadej počet bodů v testu:"))
def new_func(get_mark, input_points):

    student_mark = get_mark(input_points)
    if student_mark == 5:
        input_points = int(input("Zadej počet bodů z druhého pokusu:"))
        student_mark = get_mark(input_points)
    print(f"Známka je {student_mark}")

new_func(get_mark, input_points)
