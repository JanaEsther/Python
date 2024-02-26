class BankAccount:
    def __init__(self, owner, balance=0):
        self.owner = owner
        self.balance = balance

    def display_balance(self):
        return f"Na účtě máte: {self.balance} Kč."
    def deposit(self,amount):
        self.balance += amount
    def withdraw(self, amount):
        self.balance -= amount


account = BankAccount("John Doe", 1000)
# Má zvýšit atribut balance o 500
account.deposit(500)
# Má snížit atribut balance o 200
account.withdraw(200)
# Na konci by atribut balance objektu account měl mít hodnotu 1300