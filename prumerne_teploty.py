radky = [
    [2001, 7.8],
    [2002, 8.7],
    [2003, 8.2],
    [2004, 7.8],
    [2005, 7.7],
    [2006, 8.2],
    [2007, 9.1],
    [2008, 8.9],
    [2009, 8.4],
    [2010, 7.2]
]

sloupce = [
    [2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010],
    [7.8, 8.7, 8.2, 7.8, 7.7, 8.2, 9.1, 8.9, 8.4, 7.2]
]

# Reprezentace pomocí řádků


# Reprezentace pomocí sloupců
sloupce = [[row[i] for row in radky] for i in range(2)]
print(sloupce)

# Teplota na třetím řádku tabulky
teplota_treti_radek = radky[2][1]
print(teplota_treti_radek)

# Rok na pátém řádku tabulky
rok_paty_radek = radky[4][0]
print(rok_paty_radek)

# Poslední řádek tabulky jako seznam
posledni_radek = radky[-1]

# Tabulka bez prvních dvou řádků
bez_prvnich_dvou = radky[2:]

# Tabulka pouze z prvních dvou řádků
prvni_dva_radky = radky[:2]

# Tabulka obsahující jen řádky 5, 6, 7, 8
radky_5_az_8 = radky[4:8]