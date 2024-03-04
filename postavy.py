import random
class Character:
    def __init__(self, name, health, strength):
        self.name = name
        self.health = health
        self.strength = strength
    def injury(self, health_points_taken):
        self.health -= health_points_taken
class Wizard(Character):
    def __init__(self, name, health, strength, mana):
        super().__init__(name, health, strength)
        self.mana = mana
    def cast_spell(self, target):
        if self.mana >= 10:
            self.mana -= 10
            target.injury(25)
            print(f"Útočím na postavu {target.name}.")
    def heal(self, target):
        if self.mana >= 5:
            self.mana -= 5
            target.health += 40
            print(f"Léčím postavu {target.name}")
class Archer(Character):
    def __init__(self, name, health, strength, arrow):
        super().__init__(name, health, strength)
        self.arrow = arrow
    def shoot_arrow(self, target):
        if self.arrow >= 1:
            self.arrow -= 1
            injury_points = random.randint(10, 60)
            target.injury(injury_points)
            print(f"Střílím z luku na postavu {target.name}.")
martin = Character("Martin", 80, 20)
jindra = Character("Jindra", 40, 18)
baltazar = Wizard("Baltazar", 100, 15, 20)
robin = Archer("Robin", 100, 22, 15)
baltazar.cast_spell(martin)
baltazar.heal(jindra)
robin.shoot_arrow(baltazar)
print(baltazar.health)
baltazar.heal(baltazar)
print(martin.health)
print(jindra.health)
print(baltazar.health)