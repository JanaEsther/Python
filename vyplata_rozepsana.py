
vykaz = []
with open('data/vykaz.txt', encoding='utf-8') as file:
   count = 0
   for line in file:
       if count < 12:
        hodiny = int(line.strip())
        vykaz.append(hodiny)
        count += 1
print(vykaz)

with open('data/vykaz.txt', mode='a', encoding='utf-8') as file:
    hodinovka = int(input("Hodinová mzda:"))
    for mesic in vykaz: 
        mesicni_mzda = mesic * hodinovka
        print(mesicni_mzda)










































 
 





















print()






    
    
    
    
    
