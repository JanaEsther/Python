#Instructor solution:
def undelivered_package_count(package_list):
    count = 0
    for item in package_list:
        if item[1] is False:
            count = count + 1
    return count