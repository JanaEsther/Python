item_seznam = ["Čajová konvička s hrnky", 899, True]
item = {"Název": "Čajová konvička s hrnky", "Cena": 899, "Skladem": True}
item["Cena"] = 1090
item["Země původu"] = 'Česká republika'

item["Skladem"] = False
key = "Hmotnost"
item[key] = 0.8
if "Hmotnost" in item:
    print(item["Hmotnost"])
else:
    print("Hmotnost neudána")
print(item)







