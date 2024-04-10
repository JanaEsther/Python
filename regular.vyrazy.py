import re 

regularni_vyraz = re.compile(r"\d{9,10}")
retezec = "7356040846"
result = regularni_vyraz.fullmatch(retezec)
if result:
    print("Rodné číslo je v pořádku.")
else:
    print("Rodné číslo má chybný formát.")

import re

regularni_vyraz = re.compile(r"\w+@\w+\.cz")
email = input("Zadej e-mail: ")
hledani = regularni_vyraz.fullmatch(email)
if hledani:
    print("E-mail je v pořádku!")
else:
    print("Nesprávný e-mail!")

















#"^(\d{0,6}-)?\d{6,10}/\d{4}$"
#"^([12][012]\d{0,6}-)?\d{6,10}/\d{4}$"
#"d{0,6}/[12][0-2]{3}"
#"\d[ABCEHJKLMPSTUZ][A-Z0-9] [0-9]{4}"
#"^(\+420) ?\d{3} ?\d{3} ?\{3}$"
#"^(?(\+420) ?)?\d{3} ?\d{3} ?\{3}$"



