def initial(name):
    words = name.split()
    initials = [word[:2] + '.' for word in words]
    return ' '.join(initials)
    
print(initial("Senta Čermáková")) 
print(initial("Jana Obendraufová")) 
print(initial("Emanuel Grant")) 

# list compehension , nahrazuje append. Je to rychlejší.