import requests

response = requests.get('https://api.kodim.cz/python-data/people')
data = response.json()
print(data)
# celkový počet lidí v seznamu
print(len(data))

# všechny klíče - informace
all_keys = data[0].keys()
print(all_keys)

# počet mužů a žen
genders = [person['gender'] for person in data]
males = genders.count('Male')
females = genders.count('Female')
print(f"Počet mužů v seznamu je {males} a počet žen je {females}")