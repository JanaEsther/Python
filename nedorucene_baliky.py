#Napiš funkci, která zjistí počet nedoručených balíků

#Vytvořte funkci s názvem package_count(), která přijme seznam balíků jako vstupní argument. 
#Každý balík je v seznamu reprezentován jako vnořený seznam obsahující adresu a pravdivostní hodnotu 
#(True nebo False), která říká, pokud byl již balík doručen (True znamená, že byl doručen). 
#Zjisti počet nedoručených balíků.




def undelivered_package_count(package_list):
    undelivered_packages = 0
    for package in undelivered_packages:
        if package[1] == False:
            undelivered_packages += 1
    return undelivered_packages

