names = ['Roman', 'Jana', 'Radek', 'Petra', 'Vlasta']

with open("data/soubor1.txt", "w", encoding="utf-8") as output_file:
    for line in names:
        print(line, file=output_file)