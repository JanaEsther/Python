pocty_dni = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

with open("data/kalendar.txt", "w", encoding="utf-8") as output_file:
    for line in pocty_dni:
        output_file.write(str(line, file=output_file))



