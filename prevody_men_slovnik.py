def convert_currencies(data):
	total_value = 0
	rates = {
		'CZK': 1,
		'USD': 23.61,
		'EUR': 25.44,
    }
	for currency, amt in data.items():
		rate = rates[currency]
		total_value += amt * rate
	
	return total_value

#Převody měn pomocí slovníku s kurzy

