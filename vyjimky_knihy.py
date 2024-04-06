
#Nejprve otestuj a pak proveď



try:
    knihy = ["Problém tří těles", "Temný les", "Vzpomínka na Zemi"]
    index = int(input("Zadej index knihy: "))
    print(knihy[index])
except IndexError:
    print("Zadaný index je mimo rozsah seznamu knih.")
except ValueError:
    print("Zadaný vstup není číslo.")

