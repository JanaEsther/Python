venecky = [1, 2, 4, 1, 6, 0, 1]
#Poslední tři čísla na pomocí záporného indexu
print(venecky[-3:])
#Chci upravit číslona pozici tři
#venecky[3] = 2
#venecky[2] = 10
print(venecky)

delka = len(venecky)
print(delka)

soucet_venecku = sum(venecky)
print(soucet_venecku)

nejmensi_prvek = min(venecky)
print(nejmensi_prvek)
print(max(venecky))

print(sorted(venecky))

#řetězce
jmeno = "Jana Obendraufová"
print(jmeno[:3])
print(jmeno[2:5])
print(len(jmeno))

inzerat = "Na této pracovní pozici budete využívat Java a SQL"
if "Python" in inzerat:
    print("Je to pro mě!")
else:
    print("Není tam Python.")
    
#Příklady

pohyby = [1200, -250, -800, 540, 721, -613, -222]

#Vypište v pořadí třetí pohyb z uvedeného seznamu.
print(pohyby[2])
#Vypište všechny pohyby kromě prvních dvou.
print(pohyby[-5:])
#Vypište kolik je všech pohybů dohromady.
print(len(pohyby))
#Pomocí volání vhodných funkcí vypište nejvyšší a nejnižší pohyb.
print(max(pohyby))
print(min(pohyby))
#Spočítejte celkový přírůstek na účtu za dané období. Pozor, že přírůstek může vyjít i záporný.
print(sum(pohyby))

#prumer
s= [1200, -250, -800, 540, 721, -613, -222, 750, 500]
prumer = sum(s)/(len(s))
print(prumer)

#rozpeti

rozpeti = max(s) - (min(s))
print(rozpeti)

s
#stred
s [(len(s)-1)//2]

#stred 2
s[len(s)//2-1] if len(s)%2==0 else s[len(s)//2]

#Metody
inzerat = "Na této pracovní pozici budete využívat PYTHON a SQL"
print(inzerat.upper())
print(inzerat.lower())
if "PYTHON" in inzerat:
    print("Je to pro mě!")
else:
    print("Není tam Python.")

#Metoda - strip - odstraní mezery   
jmeno = "Jana "
print(len(jmeno))
jmeno = jmeno.strip()
print(len(jmeno))

#Metoda split - rozdělí řetězec na seznam
retezec = 'po ut st čt pá so ne'
seznam = retezec.split()
print(seznam)

retezec = 'po,ut,st,čt,pá,so,ne'
seznam = retezec.split(',')
print(seznam)
print('3.12,4.1,9.6,-127,0'.split(','))
print('3.12,4.1,9.6,-127,0'.split('.'))

#Metoda join
jmena =['Triska', 'Benda', 'Vesely', 'Novotna', 'Nowak']
jmena_na_plakat= ','.join(jmena)
print(jmena_na_plakat)

#Metoda replace - nahradí všude
text = "Kurz vede lektor Marek."
text = text.replace('Marek', 'Pavel')
print(text)

#Uložte si do proměnné jmeno svoje jméno. 
# Pomocí volání vhodných metod jej převeďte nejdříve na malá písmena a poté na velká písmena.

jmeno = 'Jana'
print(jmeno.upper())
print(jmeno.lower())



#Mějme seznam celých čísel zadaných jako text
hodnoty = ['12', '1', '7', '-11']
print(hodnoty)

#Potřebujeme k třetímu číslu v seznamu přičíst 4, aby výsledek vypadal takto:
hodnoty[2] = str(int(hodnoty[2]) + 4)
print(hodnoty)

#K poslednímu číslu v seznamu chceme přičíst 0.25 tak, aby výsledek vypadal takto
hodnoty[-1] = str(float(hodnoty[-1]) + 0.25)
print(hodnoty)

hodnoty = '12.1 1.68 7.45 -11.51'
seznam = hodnoty.split('.')

#K poslednímu číslu v seznamu chceme přičíst 0.25 tak, aby výsledek vypadal takto

#stack overflow 
#Moduly
#ceil - zaokrouhlí nahoru
import math
cislo = 2.4566
zaokrouhlene_cislo = math.ceil(cislo)
print(zaokrouhlene_cislo)
#floor
zaokrouhlene_cislo = math.floor(cislo)
print(zaokrouhlene_cislo)
