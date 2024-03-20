lines = []

with open("data/auta.txt", encoding="utf-8") as file:
    for line in file:
        slova = line.split(" ")
        line = line.replace(',', '.')
        lines.append(slova)
print(lines)




