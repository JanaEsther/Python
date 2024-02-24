
passwords = {"Jiří": "tajne-heslo", "Natálie": "jeste-tajnejsi-heslo", "Klára": "nejtajnejsi-heslo"}

#Dotaz uživatele na jméno
jmeno = input("Jaké je Tvoje jméno?")
#Kontrola, zda je jméno v seznamu
if jmeno in passwords:
    heslo = input("Zadej heslo:")

#Kontrola hesla

    if heslo == passwords[jmeno]:
        print("Heslo je správné, smíš vstoupit.")
    else:
        print("Heslo není správné. Zkus to znova.")
        
else:
    print("Nejsi na seznamu, sem nepatříš. Prosím, odejdi.")
