courses_attendants = {
    "Programování v Pythonu": 30,
    "Python pro web": 25,
    "Programování v Javascriptu": 40,
    "Úvod do datové analýzy": 35,
    "Úvod do testování": 33,
}

#print(sum(courses_attendants.values()))

#for key, value in courses_attendants:
    #print(f"Na kurz {key} je přihlášeno {value} lidí.")

#for key, value in courses_attendants.items():
    #print(f"Na kurz {key} je přihlášeno {value} lidí.")

for nazev in courses_attendants:
    if "Python" in nazev:
        print(nazev)