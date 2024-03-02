class Item:
    def __init__(self, name, rating):
        self.name = name
        self.rating = rating

class Movie(Item):
    def __init__(self, name, rating, length):
        super().__init__(name, rating)
        self.length = length
    def total_length(self):
        return self.length
        

class Series(Item):
    def __init__(self, name, rating, episodes, episode_length):
        super().__init__(name, rating)
        self.episodes = episodes
        self.episode_length = episode_length
    def total_length(self):
        return self.episodes * self.episode_length

star_trek = Series("Star Trek: Strange New Worlds", 4.7, 20, 53)
star_trek_length = star_trek.total_length()
assert star_trek_length == 1060, f"hodnota star_trek_length by měla být 1060, ale je {star_trek_length}"

fugitive = Movie("The Fugitive", 4.8, 130)
fugitive_length = fugitive.total_length()
assert fugitive_length == 130, f"hodnota fugitive_length by měla být 1060, ale je {fugitive_length}"
        