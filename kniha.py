class Book:
    def __init__(self, title,pages, price, sold, costs):
        self.title = title
        self.pages = pages
        self.price = price
        self.sold = sold
        self.costs = costs


    def get_info(self):
        return f'Kniha se jmenuje {self.title}, má {self.pages} stran a stojí  {self.price} Kč.'

    def get_time_to_read(self):
        return f'Doba potřebná k přečtení knihy {self.title}, která má {self.pages} stran je {int(self.pages)*4} minut.'

    def profit(self):
        return f'Celkový zisk z knihy {self.title} je {int(self.sold*(self.price/self.costs))} Kč.'



book_1 = Book('Satanské verše', 550, 490, 50000, 80)
book_2 = Book("Zlatý dům", 670, 595, 30000, 100)
print(book_1.get_info())
print(book_1.get_time_to_read())
print(book_1.profit())
print(book_2.get_info())
print(book_2.get_time_to_read())
print(book_2.profit())

