import requests
res = requests.get("https://restcountries.com/v3.1/region/europe")
data = res.json()
data_test = data[0]
for item in data:
    if "EUR" in item["currencies"]:
        print(item["translations"]["ces"]["common"])

for item in data:
    if "EUR" not in item["currencies"]:
        print(item["translations"]["ces"]["common"])

for item in data:
    if item["population"] > 20000000:
        print(item["translations"]["ces"]["common"])


