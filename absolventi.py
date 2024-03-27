

import json
with open('data/absolventi.json', encoding='utf-8') as file:
    absolvents = json.load(file)
print(absolvents)
# Vypíšeme jestli absolvent na začátku seznamu měl vyznamení
print(absolvents[0]["vyznamenani"])


import json

hours = {'po': 8, 'ut': 7, 'st': 6, 'ct': 7, 'pa': 8}
with open('hodiny.json', mode='w', encoding='utf-8') as file:
    json.dump(hours, file) # dump - vypsat do souboru 


data = {"řeřicha": "Česká Třebová"}

with open("rericha.json", mode="w", encoding="utf-8") as output_file:
    json.dump(data, output_file, ensure_ascii=False, indent=4)  # soubor obsahuje {"\u0159e\u0159icha": "\u010cesk\u00e1 T\u0159ebov\u00e1"}




