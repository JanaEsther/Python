
num1 = int(input("Zadej první číslo:\n"))
num2 = int(input("Zadej druhé číslo:\n"))

try:
   print (num1 / num2)
   print("Výpočet proběhl v pořádku")


except ZeroDivisionError:
   print("Použijte k dělení jiné číslo než je nula.")





