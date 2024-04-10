import re

zapis = """
Zápisy o provedených vyšetřeních:
Pacient 6407156800 trpěl bolestí zad a byl poslán na vyšetření. 
Pacientka 8655057477 přišla na kontrolu po zranění kotníku.
Do ordinace telefonovala pacientka 7752126712, které byl elektronicky vydán recept na Paralen. 
"""

regularni_vyraz = re.compile(r"\d{9,10}")

vysledky = regularni_vyraz.findall(zapis)
for vysledek in vysledky:
    print(vysledek)
    
zapis = """
Zápisy o provedených vyšetřeních:
Pacient 6407156800 trpěl bolestí zad a byl poslán na vyšetření. 
Pacientka 8655057477 přišla na kontrolu po zranění kotníku.
Do ordinace telefonovala pacientka 7752126712, které byl elektronicky vydán recept na Paralen. 
"""

regularni_vyraz = re.compile(r"\d{9,10}")
anonymniZapis = regularni_vyraz.sub("X" * 9, zapis)
print(anonymniZapis)

