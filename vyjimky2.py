try:
    vek = input("Zadej věk: ")
    vek = int(vek)
    if vek < 0 and vek > 100:
        raise ValueError
    if vek > 15:
        print("Vítej.")
        
    else:
        print("Vstup je až od 15 let.")
except ValueError:
    print("Je třeba zadat kladné číslo!")