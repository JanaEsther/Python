def convert_currencies(data):
    total_value = 0
    for key, value in data.items():
        if key == "CZK":
            total_value += value
        elif key == "USD":
            total_value += value * 23.61
        elif key == "EUR":
            total_value += value * 25.44
    return total_value

data = {"CZK": 200, "USD": 100}
print(convert_currencies(data))

print(convert_currencies(data))

data = {"CZK": 200}
value = convert_currencies(data)
assert value == 200, f"""value by měla být 200, ale je {value}"""

data = {"CZK": 200, "USD": 100}
value = convert_currencies(data)
assert value == 2561, f"""value by měla být 2561, ale je {value}"""

data = {"CZK": 200, "USD": 100, "EUR": 10}
value = convert_currencies(data)
assert value == 2815.4, f"""value by měla být 2815.1, ale je {value}"""