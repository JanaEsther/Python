with open('data/mereni.txt', encoding='utf-8') as file:
    text = file.read()

print(text)

lines = []

with open('data/mereni.txt', encoding ='utf-8') as file:
    for line in file:
        lines.append(line)

print(lines)

output = []

with open('data/mereni.txt', encoding='utf-8') as file:
    for line in file:
        day, temp = line.split('\t')
        output.append([day, float(temp)])

print(output)










