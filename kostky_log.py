
import random
import logging
from datetime import datetime


logging.basicConfig(level=logging.DEBUG, filename="game.log", filemode="a", encoding="utf-8",
                    format="%(asctime)s - %(levelname)s - [%(filename)s:%(lineno)d] %(funcName)s(): %(message)s")


def hra():

    logging.debug('Hra začíná.')

sazka = input("Zadej částku, kterou vsadíš:")
volba = input(" Sázíš na sudý(s) nebo lichý(l) součet?")

logging.debug(f"Výše sázky {sazka},{volba} součet.")

hod1 = random.randint(1, 6)
hod2 = random.randint(1, 6)
hod3 = random.randint(1, 6)

soucet = hod1+ hod2 + hod3
vyhra = int(sazka) * 2

if soucet % 2 == 0 and volba == 's' or soucet % 2 != 0 and volba == 'l':
    print(f"Gratuluji. Vyhráváte {vyhra}.")
    logging.info(f"Uživatel vyhrál {vyhra}.")
else:
    print("Bohužel, nevyhráváte nic.")
    logging.info("Uživatel nevyhrál.")
     
logging.debug("Hra skončila.")
    
hra()


