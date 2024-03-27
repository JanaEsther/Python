
import json

# Otevření souboru words.txt
with open('data/words.txt', mode='r', encoding='utf-8') as f:
    words = f.read().splitlines()

# Vytvoření slovníku
dictionary = {}
for word in words:
    # Přidání slova do slovníku podle prvního písmene
    if word[0] in dictionary:
        dictionary[word[0]].append(word)
    else:
        dictionary[word[0]] = [word]

# Seřazení seznamů slov v slovníku
for key in dictionary:
    dictionary[key].sort()

# Seřazení klíčů ve slovníku
dictionary = dict(sorted(dictionary.items()))

# Zápis slovníku do souboru output.json
with open('output.json',mode= 'w', encoding='utf-8') as f:
    json.dump(dictionary, f, indent=4)

