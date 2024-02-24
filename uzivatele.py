users = [
    {'id': 1, 'name': 'Alice', 'age': 30, 'city': 'New York'},
    {'id': 2, 'name': 'Bob', 'age': 25, 'city': 'Los Angeles'},
    {'id': 3, 'name': 'Charlie', 'age': 35, 'city': 'New York'},
    {'id': 4, 'name': 'Diana', 'age': 28, 'city': 'Miami'}
]

new_york = 0
for item in users:
    if item["city"] == "New York":
        new_york = new_york + 1

print(users[0]["city"])

def count_people_from_city(data, city):
    count = 0
    for user in data:
        if user['city'] == city:
            count += 1
    return count
