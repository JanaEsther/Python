import unittest
from selenium import webdriver
from selenium.webdriver.common.by import By
import time

class CzechitasPortalTest (unittest.TestCase):
    def setUp(self):
        self.driver = webdriver.Edge()

    def test_failed_login(self):
        driver = self.driver
        # Otevři adresu https://moje.czechitas.cz/cs/prihlasit
        driver.get("https://moje.czechitas.cz/cs/prihlasit")
        # Ověřím, že titulek stránky je Moje Czechitas
        self.assertEqual("Moje Czechitas", driver.title)
        # Najdi prvek stránky, kde je name=login
        username_box = driver.find_element(by=By.NAME, value="login")
        password_box = driver.find_element(by=By.NAME, value="password")
        button = driver.find_element(by=By.NAME, value="_submit")
        # Zapiš text j.obendraufova@h2o-logic.cz
        username_box.send_keys("j.obendraufova@h2o-logic.cz")
        password_box.send_keys("spatneheslo")
        button.click()
        self.assertIn("Přihlášení k účtu", driver.page_source)


def test_success_login(self):
        driver = self.driver
        # Otevři adresu https://moje.czechitas.cz/cs/prihlasit
        driver.get("https://moje.czechitas.cz/cs/prihlasit")
        # Najdi prvek stránky, kde je name=login
        username_box = driver.find_element(by=By.NAME, value="login")
        password_box = driver.find_element(by=By.NAME, value="password")
        button = driver.find_element(by=By.NAME, value="_submit")
        # Zapiš text j.obendraufova@h2o-logic.cz
        username_box.send_keys("j.obendraufova@h2o-logic.cz")
        password_box.send_keys("t4a5m6i7b8a9r")
        button.click()
        self.assertIn("Vítej Czechitas", driver.page_source)
        
unittest.main()