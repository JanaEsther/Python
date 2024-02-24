def convert_to_litres(gallons, imperial=False):
    if imperial == True:
        litres = gallons * 4.564
    else: 
        litres = gallons * 3.785
    return litres
print(convert_to_litres(2))
print(convert_to_litres(25))

