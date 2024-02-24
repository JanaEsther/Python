

def decor(func):
    # Dekorační funkce, která obaluje původní funkci
    def wrap(*args, **kwargs):
        # Vstup od uživatele - zadání textu
        text = input("Zadej text: ")

        # Automatické přidání znaku před a za textem
        decorated_text = '*' + text + '*'

        # Vytvoření řetězce hvězdiček o délce textu
        stars = '*' * len(decorated_text)

        # Tisk hvězdiček před voláním původní funkce
        print(stars)

        # Volání původní funkce s dekorovaným textem jako argumentem

        func(decorated_text, *args, **kwargs)

        # Tisk hvězdiček po volání původní funkce

        print(stars)
    return wrap


# Použití dekorátoru @decor pro funkci print_text

@decor

def print_text(text):

    # Tisk textu

    print(text)

# Volání dekorované funkce

print_text()

