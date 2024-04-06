#Požádej uživatele o zadání data narození ve formátu RRRR-MM-DD.

#Nejprve ověř pomocí podmínek, že je zadáno správné datum - tj. v datu jsou dvě pomlčky a po rozdělení na jednotlivé části obsahuje každá z částí číslo. Stále je ale možné, že je zadáno nesmyslné datum. Například je možné zadat datum 31. dubna nebo 29. února pro nepřestupný rok. Proto přidej modul datetime a pomocí metody fromisoformat() vyzkoušej převod na typ datetime. Ošetři ValueError, která může být způsobena výše uvedenými případy.

from datetime import datetime

datum_narozeni = input("Zadej datum ve formátu 'RRRR-MM-DD': ")
print(repr(datum_narozeni))
datum_narozeni = datetime.fromisoformat('datum_narozeni')

try:
    datum_narozeni = datetime.fromisoformat('datum_narozeni')
    print("Datum narození je platné.")
except ValueError:
    print("Zadané datum narození není platné. Zkus to prosím znovu.")


