def delivered_package_count(package_list):
    delivered = 0
    for item in package_list:
        if item[1] == True:  
            delivered = delivered + 1 
    return delivered

packages = [["Sladkovského 37, Plzeň", True]]
count = delivered_package_count(packages)
assert count == 1, f"count is {count}, but should be 1"
print(count)


packages = [["Sladkovského 37, Plzeň", True], ["K Vrtilce 55, Praha", False]]
count = delivered_package_count(packages)
assert count == 1, f"count is {count}, but should be 1"
print(count)

