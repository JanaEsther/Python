import requests
import json

res = requests.get("https://wad.datausa.io/api/data?PUMS%20Occupation=151252&drilldowns=Gender&measure=Total%20Population,Total%20Population%20MOE%20Appx,Record%20Count&Record%20Count%3E=5")
data = res.json()
with open("data.json", "w", encoding="utf-8"() )as file:
     json.dump (data, file)
print(data["data"])

data_d = data["data"]

# Cyklus, který projde data a vypíše total population
for d in data_d:
    print( f'{d["Year"]}, {d["Gender"]}, {d["Total Population"]}')
