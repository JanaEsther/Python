def calculate_tax(gross_wage, children=0, student=False):
    return max(0, gross_wage * 0.15 - children * 2000 - 500 * student)
