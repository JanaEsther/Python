def initial(name):
    words = name.split()
    letters = []
    for items in words:
        letters.append(items[0]) 
    text = ".".join(letters)
    return text + "."


print(initial("Senta Čermáková"))   
print(initial("Emanuel Grant")) 
print(initial("Jana Obendraufová")) 