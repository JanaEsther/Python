class Ticket:
    def __init__(self, basic_price, seat_number):
        self.basic_price = basic_price
        self.seat_number = seat_number

class TrainTicket(Ticket):
    def __init__(self, basic_price, seat_number, fare_class):
        super().__init__(basic_price, seat_number)
        self.fare_class = fare_class

    def get_price(self):
        if self.fare_class == "business":
            business_price = int(self.basic_price * 1.3)
            return f"Cena jízdenky je {business_price} Kč."
        elif self.fare_class == "economy":
            economy_price = self.basic_price
            return f"Cena jízdenky je {economy_price} Kč."

class PlaneTicket(TrainTicket):
    def __init__(self, basic_price, seat_number, fare_class, checkout_luggages):
       super().__init__(basic_price, seat_number, fare_class)
       self.checkout_luggages = checkout_luggages


    def get_price(self):
        if self.fare_class == "business":
            business_price = int(self.basic_price * 1.5 + 2000 *self.checkout_luggages)
            return f"Cena jízdenky je {business_price} Kč."
        elif self.fare_class == "economy":
            economy_price = self.basic_price + 2000 * self.checkout_luggages
            return f"Cena jízdenky je {economy_price} Kč."

train_ticket1 = TrainTicket(150, 10, "economy")
train_ticket2 = TrainTicket(150, 2, "business")
plane_ticket1 = PlaneTicket(6000, 15,"economy", 1)
plane_ticket2 = PlaneTicket(6000, 5,"business", 1)
print(train_ticket1.get_price())
print(train_ticket2.get_price())
print(plane_ticket1.get_price())
print(plane_ticket2.get_price())


