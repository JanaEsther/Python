item_seznam = ["Čajová konvička s hrnky", 899, True]
item = {"Název": "Čajová konvička s hrnky", "Cena": 899, "Skladem": True}
item["Cena"] = 1090
key = "Země původu"
item[key] = "Francie"
print(item.get("Hmotnost"))# pokud klíč není ve slovníku, tak to neskončí chybou, ale vrátí to "None" - prázdnou hodnotu
print(item)

inzerat = "Firma TechStream hledá Python vývojáře nebo vývojářku na nový projekt, který je zaměřený na sbírání dat o hladině spodních vod."

print(inzerat)

knihy = ["Problém tří těles", "Temný les", "Vzpomínka na Zemi"]
cislo = input("Zadej číslo knihy: ")
cislo = int(cislo)
cislo = cislo - 1

if cislo > len(knihy):
    print(f"Do košíku přidána kniha {knihy[cislo]}.")
else:
    print("Prosím zadejte číslo v rozsahu 1 až 3")