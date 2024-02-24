school_report = {
    "Český jazyk": 1,
    "Anglický jazyk": 1,
    "Matematika": 1,
    "Přírodopis": 2,
    "Dějepis": 1,
    "Fyzika": 2,
    "Hudební výchova": 4,
    "Výtvarná výchova": 2,
    "Tělesná výchova": 3,
    "Chemie": 4,
}

school_report_values = school_report.values()
total_values = sum(school_report.values())
number_values = len(school_report.values())
avg_mark = total_values/number_values
print(avg_mark)

celkem = 0
for znamka in school_report.values():
    celkem +=znamka
prumer = celkem/len(school_report.values())
print(prumer)

for predmet, znamka in school_report.items():
    if znamka == 1:
        print(predmet)