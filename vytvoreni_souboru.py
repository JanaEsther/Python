
nazev = input("Zadej název souboru:")
text= input("Zadej řádek textu:") 

with open(nazev, mode ="w", encoding="utf-8") as output_file:
        print(text, file=output_file)
