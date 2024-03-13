from faker import Faker
fake = Faker('cs_CZ')

print(fake.address())
print(fake.city())
print(fake.country())
print( fake.city_with_postcode())

for i in range(10):
    print(fake.state())
    
Faker.seed(0)
for _ in range(5):
    fake.street_address()







