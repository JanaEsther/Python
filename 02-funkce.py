# 1. Napiš funkci mult, která bude mít dva číselné parametry. Funkce oba parametry vynásobí a vrátí výsledek.

def mult(a, b):
    return a * b

print(mult(10,20))

# 2. Funkce pro převody jednotek
# Převod kilometrů na míle a zpět
# Napište dvě funkce: kilometry_na_mile(kilometry) a mily_na_kilometry(mile), které provedou převod mezi kilometry a mílemi.

# 1mile = 1.609km
# 1km = 0.621 mile

def kilometry_na_mile(kilometry):
    koeficient_mile = 0.621
    return kilometry * koeficient_mile

def mile_na_kilometry(mile):
    koeficient_km = 1.609
    return mile * koeficient_km

# print(kilometry_na_mile(40))
# print(mile_na_kilometry(10))

# Převod metrů na stopy a zpět
# Napište funkce: metry_na_stopy(metry) a stopy_na_metry(stopy), které umožňují převod mezi metry a stopami.

# Převod centimetrů na palce a zpět
# Vytvořte dvě funkce: centimetry_na_palec(centimetry) a palce_na_centimetry(palce), které umožní převod mezi centimetry a palci.

# Převod hmotnosti kilogramů na libry a zpět
# Napište funkce: kilogramy_na_libry(kilogramy) a libry_na_kilogramy(libry), které provedou převod mezi kilogramy a librami.

# Převod objemu litrů na galony a zpět
# Vytvořte dvě funkce: litry_na_galony(litry) a galony_na_litry(galony), které umožní převod mezi litry a galony.

# Převod rychlosti kilometrů za hodinu na míle za hodinu a zpět
# Napište funkce: kmh_na_mph(kmh) a mph_na_kmh(mph), které umožní převod rychlosti mezi kilometry za hodinu a míli za hodinu.

# Převod teploty ze stupňů Celsia na Fahrenheit a zpět
# Vytvořte dvě funkce: celsia_na_fahrenheit(teplota) a fahrenheit_na_celsia(teplota),
# které umožňují převod teploty mezi stupni Celsia a stupni Fahrenheit.

# TODO

## BONUSY

# 3. Rámeček
# Napiš funkci, která jako parametr převezme řetězec a vytiskne jej obalen hvězdičkami.

# Zadej slovo: ahoj
# ********
# * ahoj *
# ********
# Nápověda: 8 * '*' == '********'

# Bonus: Znak, kterým se má text obalit, bude zadán také jako parametr.

def ramecek(retezec):
    print('*' * (len(retezec) + 4))
    print(f"* {retezec.upper()} *")
    print('*' * (len(retezec) + 4))

def ramecek(retezec, znak='*'):
    print(znak * (len(retezec) + 4))
    print(f"{znak} {retezec.upper()} {znak}")
    print(znak * (len(retezec) + 4))

ramecek("ahoj", '$')

# 4. Měsíc narození
# Napiš funkci month_of_birth, která bude mít jeden parametr - rodné číslo.
# Funkce ze zadaného rodného čísla určí měsíc narození, které vrátí jako výstup.
# Nezapomeň, že pro ženy je k měsíci připočtena hodnota 50.

# Příklad: Pro hodnotu 9207054439 vrátí 7. Pro hodnotu 9555125899 vrátí 5.

def month_of_birth(rodne_cislo):
    mesic_jako_string = rodne_cislo[2:4]
    mesic_jako_cislo = int(mesic_jako_string)
    return mesic_jako_cislo % 50

print(month_of_birth('9207054439'))
print(month_of_birth('9555125899'))
