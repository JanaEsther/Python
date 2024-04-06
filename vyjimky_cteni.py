names = []

file_name = "names.txt"

try:
    with open(file_name, encoding="utf-8") as file:
        for line in file:
            names.append(line)
except FileNotFoundError:
    print(f"Soubor '{file_name}' neexistuje.")
except PermissionError:
    print(f"K otevření souboru '{file_name}' nemá program dostatečná práva.")
except Exception as err:
    print(f"Obecná chyba při čtení souboru '{file_name}': {err}")
else:
    print(f"Soubor '{file_name} byl úspěšně přečten.")

print(names)

#sys.exit() vraci vyjimku SystemExit ktera se teoreticky da taky osetrit, 
# samotna funkce exit() je drsnejsi a proste to zavre :D 
#jak 10krat, jako priklad ...mame jeden specialni skript co proste musi vypisovat nejaky text na vystup, takze v takovym pripade chytame vsecko a pak mame finally na nejaky format vypisu (ikdyby v tom byli defaultni hodnoty kdyz nastanou chyby)







