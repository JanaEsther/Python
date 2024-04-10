import sys

# Otevření souboru pro zápis
with open('balance.txt', 'w', encoding="utf-8") as file:
    # Zápis počátečního zůstatku na účtu
    file.write("10000")  # Například 10 000 Kč
    
with open('balance.txt', encoding="utf-8") as file:
    account_balance = int(file.read())
    print(account_balance)

try:
    
    money_withdraw = int(input("Zadej částku, kterou chceš vybrat:"))
    if money_withdraw <= 0 or money_withdraw > account_balance:
        raise ValueError
    account_balance = account_balance - money_withdraw
    with open('balance.txt', 'w') as file:
        file.write(str(account_balance))
except ValueError:
    print(f"Zadej kladné číslo, které je větší než {account_balance}")
except FileNotFoundError:
    print(f"Soubor '{account_balance}' neexistuje.")
except PermissionError:
    print(f"K otevření souboru '{account_balance}' nemá program dostatečná práva.")
except Exception as err:
    print(f"Obecná chyba při čtení souboru '{account_balance}': {err}")
else:
    print(f"Soubor '{account_balance} byl úspěšně přečten.")


