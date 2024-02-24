item_seznam = ["Čajová konvička s hrnky", 899, True]
item = {"Název": "Čajová konvička s hrnky", "Cena": 899, "Skladem": True}
item["Cena"] = 1090
key = "Země původu"
item[key] = "Francie"
print(item.get("Hmotnost"))# pokud klíč není ve slovníku, tak to neskončí chybou, ale vrátí to "None" - prázdnou hodnotu
print(item)