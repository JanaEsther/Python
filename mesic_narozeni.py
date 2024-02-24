def month_of_birth(birth_number):
    birth_number_str = str(birth_number)
    month_str = birth_number_str[2:4]
    month = int(month_str)
    if month > 50:
        month -= 50
    return month

print (month_of_birth(7356040846))
print(month_of_birth(9207054439))  
print(month_of_birth(9555125899))
print (month_of_birth(7301267446)) 
    