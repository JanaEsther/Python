#Vytvoření data
from datetime import datetime, timedelta
print(datetime.now())

apollo_start = datetime(1969, 7, 16, 14, 32)
#parse
apollo_landing = datetime.strptime("21. 7. 1969, 18:54", "%d. %m. %Y, %H:%M")

mission_duration = apollo_landing - apollo_start
print(mission_duration)
print(apollo_start)
print(apollo_start.weekday())#monday is 0
print(apollo_start.isoweekday())

#Formátování
print(apollo_start.strftime("%d. %m. %Y, %H:%M"))

print(apollo_start.strftime("%m/ %d/ %Y"))

orbiter_start = datetime.strptime("10. 2. 2020, 5:03", "%d. %m. %Y, %H:%M")

print(orbiter_start.isoweekday())

time_from_landing = datetime.now() - orbiter_start
print(time_from_landing)

order_time = datetime.strptime("13. 11. 2020, 19:47:00", "%d. %m. %Y, %H:%M:%S")


# Assuming order_processing is in hours:minutes:seconds format
hours, minutes, seconds = map(int, "1:04:05".split(':'))
order_processing = timedelta(hours=hours, minutes=minutes, seconds=seconds)

order_arrival = order_time + order_processing
print(order_arrival)
order_time = datetime.strptime("13. 11. 2020, 19:47:00", "%d. %m. %Y, %H:%M:%S")

from datetime import datetime, timedelta

order = datetime(2019, 11, 13, 19, 47)
delivery = order + timedelta(minutes=8, seconds=35) + timedelta(minutes=30) + timedelta(minutes=25, seconds=30)
print(delivery)









