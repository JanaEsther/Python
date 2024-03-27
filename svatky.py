import requests
import sys

svatky = requests.get('https://svatky.adresa.info/json?date=DDMM')
data = svatky.json()

# Získejte číslo dne a číslo měsíce z příkazové řádky
day, month = sys.argv[1], sys.argv[2]

# Sestavte datum ve formátu DDMM
date = day + month

# Základní "endpoint" API
url = 'https://svatky.adresa.info/json'

# Parametry pro GET požadavek
params = {'date': date}

# Pošlete GET požadavek na API
response = requests.get(url, params=params)

# Převeďte odpověď z formátu JSON na Python slovník
data = response.json()

# Vypište jméno, které má v daný den svátek
print(f"Dne {day}.{month}. má svátek {data[0]['name']}.")

