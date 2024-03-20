lines = []

with open("data/praha.txt", encoding="utf-8") as file:
    for line in file:
        slova = line.split(" ")
        lines.append(slova)
print(lines)

delka = 0
for line in lines:
    delka += len(line)
print(delka)
