book_sales = {
    "Liu Cixin: Problém tří těles": 300,
    "Liu Cixin: Temný les": 250,
    "Liu Cixin: Vzpomínka na zemi": 200,
    "J.K. Rowling: Harry Potter a Kámen mudrců": 500,
    "J.K. Rowling: Harry Potter a Tajemná komnata": 450,
    "J.K. Rowling: Harry Potter a Vězeň z Azkabanu": 400,
}

def sales_of_authors(data):
    sales_authors = {}
    for key, value in data.items():
        author = key.split(":") [0]
        if author in sales_of_authors:
            sales_authors[author] = sales_authors[author] + value
        else:
            sales_authors[author] = value
    return sales_authors

print(sales_of_authors(book_sales))

sales = sales_of_authors(book_sales, "Liu Cixin")
assert sales == 750, f"""Funkce by měla vrátit 750, ale vrací {sales}"""

sales = sales_of_authors(book_sales, "J.K. Rowling")
assert sales == 1350, f"""Funkce by měla vrátit 1350, ale vrací {sales}"""

sales = sales_of_authors(book_sales, "George Orwell")
assert sales == 0, f"""Funkce by měla vrátit 0, ale vrací {sales}"""



