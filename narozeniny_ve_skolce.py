import csv
from collections import defaultdict
from datetime import datetime

# Načtení dat ze souboru kids.csv
with open('data/kids.csv', mode ='r', encoding='utf-8' ) as f:
    reader = csv.reader(f)
    data = list(reader)

# Vytvoření slovníku pro třídy a měsíce narození
classes = defaultdict(lambda: defaultdict(list))

# Projití dat a naplnění slovníku
for row in data:
    name, class_name, birthdate = row
birth_month = datetime.strptime(birthdate, '%d. %m. %Y').month
classes[class_name][birth_month].append(name)

# Vytvoření výstupních souborů pro každou třídu
for class_name, birth_months in classes.items():
    with open(f'{class_name}.txt', 'w') as f:
        for month, names in sorted(birth_months.items()):
            f.write(f'Month: {month}\n')
            for name in sorted(names):
                f.write(f'  {name}\n')
