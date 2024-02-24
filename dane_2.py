def calculate_tax(gross_wage, interests=0, blood_donation=False):
   return gross_wage * 0.15 - interests -  blood_donation * 500

tax = calculate_tax(50000)
assert tax == 7500, f"Daň by měla být 7500, ale je {tax}"

tax = calculate_tax(50000, 1000)
assert tax == 6500, f"Daň by měla být 6500, ale je {tax}"

tax = calculate_tax(50000, blood_donation=True)
assert tax == 7000, f"Daň by měla být 7000, ale je {tax}"

tax = calculate_tax(50000, 2000, blood_donation=True)
assert tax == 5000, f"Daň by měla být 5000, ale je {tax}"
