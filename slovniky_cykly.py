sales = {
    "Zkus mě chytit": 4165,
    "Vrah zavolá v deset": 5681,
    "Zločinný steh": 2565,
}


#print(sales)

#vypsat názvy knih bez počtů: cyklus

for key in sales:
    print(key[17:25])



for book in sales:
    print(book)



for book in sales:
    print(f"Knihy{book} bylo prodáno {sales[book]} kusů. ")

for key, value in sales.items():
    print(f"Knihy {key} bylo prodáno {value} kusů. ")

for value in sales.values():
    print(f"Knihy  X bylo prodáno {value} kusů. ")

values = list(sales.values())
keys = list(sales.keys())
print(values[1])
print(keys[1])

print(keys[:3])
print(values[:3])
print(values)
sum(sales.values())

total_sales = 0
for key, value in sales.items():
    total_sales = total_sales + value
print(total_sales)


total_sales_2 = sum(values)
print(total_sales_2)

#Přidání nové knihy
#sales["Noc, která mě zabila "] = 0

# Zvýšení počtu prodaných kusů

#sales["Vrah zavolá v deset."] +=100
#print(sales)

sales = {
    "Martin Podloucký: Zkus mě chytit": 4165,
    "Martin Podloucký: Vrah zavolá v deset": 5681,
    "Jirka Pešík: Zločinný steh": 2565,
}
total_sales = 0
# Prodané kusy od Martin Podlouckého
for key, value in sales.items():
    if "Martin Podloucký" in key:
        total_sales = total_sales + value
print(total_sales)

for key, value in sales.items():
    if "Jirka Pešík" in key:
        total_sales = total_sales + value
print(total_sales)