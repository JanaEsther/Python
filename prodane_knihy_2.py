def sales_of_authors(data):
    sales_authors = {}
    for key, value in data.items():
        author = key.split(":") [0]
        if author in sales_of_authors:
            sales_authors[author] = sales_authors[author] + value
        else:
            sales_authors[author] = value
    return sales_authors

from collections import defaultdict
def vychozi_hodnota():
    return 0
slovnik = defaultdict(vychozi_hodnota)
print(slovnik["test"])