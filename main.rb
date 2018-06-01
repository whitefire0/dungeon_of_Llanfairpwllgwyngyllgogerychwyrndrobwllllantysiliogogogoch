class Game
end

class Character

  # class factory method to create the generic char attributes
  def self.create(name)
    # create integer between 16 - 75
    age = rand * 60 + 15
    attributes = {
      name: name,
      age: age,
      health: [age * 5, 200].min,
      strength: [age / 2, 10].min,
    }
    self.new(attributes)
  end

end

class Enemy
end

class Viking < Character
  attr_reader :name, :age, :health, :strength
  def initialize(attributes)
    @name = attributes[:name]
    @age = attributes[:age]
    @health = attributes[:health]
    @strength = attributes[:strength]
  end
end

class Goblin < Enemy
end

class UserInterface
end

loki = Viking.create('loki')
p loki
