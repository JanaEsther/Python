cisla =[5,2,8, 10,15,1,9]
# Je tam 15?

je_tam_15 = False
for cislo in cisla:
    if cislo == 15:
        print("Je tam.")
        je_tam_15 = True
if not je_tam_15:
    print("NenÍ tam.")
    
# Výpočetní složitost řeší pokud by tam bylo čísel 12, jestli to bude trvat 2x dlouho.Tady ano.
# Vypočetní složitost je nejhorší 0(n) lineární složitost
# binární strom - pro každé číslo můžeme mít dva následoníky, doleva jsou čísla, která jsou menší a vpravo větší

# hashovací funkce

#ŘAZENÍ

cisla =[5,2,8, 10,15,1,9]
# cisla = 
#BUBBLE SORT - porovnává čísla vedle sebe, pokud číslo nalevo je větší tal čísla vymění, složitost je O(n**2)- DVA CYKLY V SOB2
# po prvním projití
#maximalní  počet průchodů je n2
cisla =[2,5,8, 10,1,9,15]


cisla =[5,2,8, 10,15,1,9]
n = len(cisla)
for j in range(n - 1): 
    for i in range(n - 1):
        print(f"j = {j}, i ={i}")
        if cisla[i] > cisla[ i+1]:
        #Prohodim cisla na pozicich i a  i+1
            cisla[i], cisla[i+1] = cisla[i+1], cisla[i]
            print(cisla)


# Nejlepsi je quick sort 
# Travelling Salesman Problem - najit nejkratsi cestu anejet nikam dvakrat, aby soucet cisel(vzdalenosti je nejmensi)
import math
print(math.factorial(7))
print(math.factorial(10))
#algoritmus hrube sily - vyzkousim vsechny mozne varianty
#brute force password