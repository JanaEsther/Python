
import math

vykaz = []

with open("data/vykaz.txt", encoding="utf-8") as file:
    for line in file:
        vykaz.append(int(line.strip()))

print(vykaz)

hodinova_mzda = float(input("Zadejte hodinovou mzdu: "))
mzda_za_rok = sum(vykaz) * hodinova_mzda

rocni_mzda= math.ceil(mzda_za_rok)

prumer_za_mesic = math.ceil(rocni_mzda/ 12)

print("Celková mzda za rok:", rocni_mzda)

print("Průměrná mzda za měsíc:", prumer_za_mesic)
