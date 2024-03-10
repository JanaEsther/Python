
class Item:
    def __init__(self, title, price):
        self.title = title
        self.price = price 

class Book(Item):
    def __init__(self, title, price, pages, sold, costs):
        super().__init__(title, price)
        self.pages = pages
        self.sold = sold
        self.costs = costs
    
    def get_info(self):
        return f'Kniha se jmenuje {self.title}, má {self.pages} stran a stojí  {self.price} Kč.'
    
    def get_time_to_read_1(self):
        pass

    def get_time_to_read(self):
        return f'Doba potřebná k přečtení knihy {self.title}, která má {self.pages} stran je {int(self.pages)*4} minut.'
    
    def get_time_to_read(self):
        return self.pages * 4

    
    def rating(self, profit):
        if profit < 50_000:
            return "propadák"
        elif profit > 50_000 and profit <= 500_000:
            return "průměr"
        else:
            return "bestseller"

class AudioBook(Item):
    def __init__(self, title, price, duration_in_hours, narrator):
        super().__init__(title, price)
        self.duration_in_hours = duration_in_hours
        self.narrator = narrator

    def get_time_to_read(self):
        return self.duration_in_hours

    def profit(self):
        return f'Celkový zisk z knihy {self.title} je {int(self.sold*(self.price/self.costs))} Kč.'


book1 = AudioBook("Problém tří těles", 299, 14.4, "Zbyšek Horák")
book2 = Book("Kadet Hornblower", 399, 242, 20000, 650 )
total_time = book1.get_time_to_read() + book2.get_time_to_read()
total_price = book1.price + book2.price
print(total_time)
print(total_price)

favourite_narrator = "Zbyšek Horák"
item_1 = AudioBook("Problém tří těles", 299, 14.4, "Zbyšek Horák")
item_2 = Book("Kadet Hornblower", 399, 242)
item_3 = AudioBook("Odysseus", 389, 13.7, "Lukáš Hlavica")

all_items = [item_1, item_2, item_3]
for item in all_items:
    if isinstance(item, AudioBook) and item.narrator == "Zbyšek Horák":
        print(item.title)

for item in all_items:
     if hasattr(item, "narrator")  and item.narrator == favourite_narrator:
        print(item.title)

for item in all_items:
    if getattr(item, "narrator", None) == favourite_narrator:
       print(item.title)

book_1 = Book('Satanské verše', 550, 490, 50000, 80)
book_2 = Book("Zlatý dům", 670, 595, 30000, 100)

print(book_1.get_info())
print(book_1.get_time_to_read())
print(book_2.get_info())
print(book_2.get_time_to_read())






