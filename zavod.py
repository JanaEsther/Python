
import json
with open('data/zavod.json', encoding='utf-8') as file:
    runners = json.load(file)
winner = runners[0]
druhy = runners[1]
winner_time = winner["casy"]["oficialni"]
druhe_kolo = winner["casy"] ["2.kolo"]
print(winner)
print(winner_time)
print(druhe_kolo)
print(druhy)

finishers = []

for runner in runners:
    if runner["casy"]["oficialni"] != "DNF":
     finishers.append(runner)

print(finishers)

if len(finishers) > 1:
    print(finishers[1])



