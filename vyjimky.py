

vek = int(input("Zadej věk: "))

if vek > 15:
    print("Vítej")

vek = int(input("Zadej věk: "))
if vek > 15:
    print("Vítej")
    print(vek)
else:
    print("Vstup je až od 15 let.")

try:
    vek = input("Zadej věk: ")
    vek = int(vek)# Zde se pokoušíme o převod
    if vek < 0:
        raise ValueError()
    if vek > 15:
        print("Vítej")
    else:
        print("Představení je až od 15 let.")
except ValueError:  # Zde odchytáváme chybu při převodu
    print("Je třeba zadat číslo!")

    
knihy = ["Problém tří těles", "Temný les", "Vzpomínka na Zemi"]
index = int(input("Zadej index knihy: "))
if index  - len(knihy) <= index < len (knihy):
    print(knihy[index])

zvirata = {'dog': 'pes', 'cat': 'kočka'}
klic = input("Zadej zvíře pro překlad: ")
print(zvirata[klic])

def is_odd(number):
    return number % 2 == 1
assert is_odd(3) == True

# misto nuly 1

