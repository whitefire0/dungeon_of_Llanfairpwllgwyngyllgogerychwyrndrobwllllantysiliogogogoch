class Viking
    def initialize(name, health, age, strength)
        #... set variables
    end
    def self.create_warrior(name)
        age = rand * 20 + 15   # remember, rand gives a random 0 to 1
        health = [age * 5, 120].min
        strength = [age / 2, 10].min
        Viking.new(name, health, age, strength)  # returned
    end
end

> sten = Viking.create_warrior("Sten")

have a character class# that sets default parameter values