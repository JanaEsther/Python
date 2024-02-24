def initial(name):
    words = name.split()
    initials = [word[0] + '.' for word in words]
    return ' '.join(initials)

print(initial("Senta Čermáková")) 
print(initial("Jana Obendraufová")) 
print(initial("Emanuel Grant")) 