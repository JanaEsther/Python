import logging

logging.basicConfig(level=logging.DEBUG, filename="app.log", filemode="w", 
                    format="%(asctime)s - %(levelname)s - [%(filename)s:%(lineno)d] %(funcName)s(): %(message)s")

def sum_two_numbers(a,b):
    result = a + b
    logging.info(f"{a} + {b} = {result}") 
    return result

sum_two_numbers(3,5)
sum_two_numbers(9,11)