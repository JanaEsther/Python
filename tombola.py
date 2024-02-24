tombola = {
    7: "Láhev kvalitního vína Château Headache",
    15: "Pytel brambor z místního družstva",
    23: "Čokoládový dort",
    47: "Kniha o historii města",
    55: "Šiška salámu",
    67: "Vyhlídkový let balónem",
    79: "Moderní televizor",
    91: "Roční předplatné městského zpravodaje",
    93: "Společenská hra Sázky a dostihy",
}

values = list(tombola.values())
keys = list(tombola.keys())
print(keys)
print(values) 





listek_cislo = int(input("Zadej číslo lístku:"))

if listek_cislo in tombola:
    print("Gratuluji, vyhráváš cenu: " + tombola[listek_cislo])
else:
    print("Bohužel, nic. Hodně štěstí příště.")