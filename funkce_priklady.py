
#Příklady

def mult (a, b):
    return a * b
value = mult(3,8)
print(value)

def kilometry_na_mile(kilometry):
    return kilometry *0.621371
value = round(kilometry_na_mile(10),1)
print(value)

def mile_na_kilometry(mile):
    return mile *1.60934
value = round(mile_na_kilometry(25),1)
print(value)

def metry_na_stopy(metry):
    return metry *3.28084
value = round(metry_na_stopy(100),1)
print(value)

def stopy_na_metry(stopy):
    return stopy * 0.3048
value = round(stopy_na_metry(20),1)
print(value)

def centimetry_na_palec(centimetry):
    return centimetry * 0.393701
value = round(centimetry_na_palec(20),1)
print(value)

def palce_na_centimetry(palce):
    return palce * 2.54
value = round(palce_na_centimetry(10),1)
print(value)

def kilogramy_na_libry(kilogramy):
    return kilogramy * 2.20462
value = round(kilogramy_na_libry(2),1)
print(value)

def libry_na_kilogramy(libry):
    return libry * 0.453592
value = round(libry_na_kilogramy(20),1)
print(value)

def litry_na_galony(litry):
    return litry * 0.264172
value = round( litry_na_galony(50),1)
print(value)

def galony_na_litry(galony):
    return galony * 3.78541
value = round(galony_na_litry(100),1)
print(value)

def kmh_na_mph(kmh):
    return kmh * 0.621371
value = round(kmh_na_mph(120),1)
print(value)

def mph_na_kmh(mph):
    return mph * 1.60934
value = round(mph_na_kmh(50),1)
print(value)

def celsia_na_fahrenheit(teplota):
    return teplota * 1.8 + 32
value = round(celsia_na_fahrenheit(37),1)
print(value)

def fahrenheit_na_celsia(fahrenheit):
    return (fahrenheit - 32)/1.8
value = round() 