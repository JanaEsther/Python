sales = {
    "Martin Podloucký: Zkus mě chytit": 4165,
    "Martin Podloucký:Vrah zavolá v deset": 5681,
    "Jirka Pešík: Zločinný steh": 2565,
}

total_sales = 0
for key, value in sales.items():
    total_sales = total_sales + value

print(total_sales)
values = list(sales.values())
total_sales_2 = sum(sales.values())
total_sales_2 = sum(values)

# prodané kusy od Martina Podlouckého

