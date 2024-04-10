def decor(func):
    def wrap():
        print("*****")
        func()
        print("*****")
    return wrap
def print_text():
    print("Ahoj Jano!")
print_text = decor(print_text)
print_text();