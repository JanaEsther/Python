numbers = [7728, 88, 958621, 5941, 959847272, 3944, 80, 521, 57035, 3967894]

#Vypište seznam čísel každé na nový řádek zarovnané vpravo na délku nejdelšího čísla.

numbers = [7728, 88, 958621, 5941, 959847272, 3944, 80, 521, 57035, 3967894]

def format_number(number, length, fill_char=' '):
    return str(number).rjust(length, fill_char)

numbers = [7728, 88, 958621, 5941, 959847272, 3944, 80, 521, 57035, 3967894]
max_length = len(str(max(numbers)))

for number in numbers:
    print(format_number(number, max_length))