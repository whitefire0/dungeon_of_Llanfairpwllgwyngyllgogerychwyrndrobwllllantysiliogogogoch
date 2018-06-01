require 'pry'
require 'pry-byebug'
require 'awesome_print'

class Game
end

class Character
  def self.create(name)
    age = rand * 60 + 15
    attributes = {
      name: name,
      age: age,
      health: [age * 5, 300].min,
      strength: [age / 2, 10].max,
      constitution: base_range,
      dexterity: base_range,
      intelligence: base_range
    }
    self.new(attributes)
  end

  def self.base_range
    rand * 50 + 15
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
    @constitution = attributes[:constitution]
    @dexterity = attributes[:dexterity]
    @intelligence = attributes[:intelligence]
    roll_attribute_modifiers
    # roll_unique_attributes
  end

  def roll_attribute_modifiers
    @strength *= 1.5
    @health += 200
  end

  def roll_unique_attributes

  end
end

class Wizard < Character
  attr_reader :name, :age, :health, :strength
  def initialize(attributes)
    @name = attributes[:name]
    @age = attributes[:age]
    @health = attributes[:health]
    @strength = attributes[:strength]
    @constitution = attributes[:constitution]
    @dexterity = attributes[:dexterity]
    @intelligence = attributes[:intelligence]
    # roll_unique_attributes
  end

end

class Rogue < Character
  attr_reader :name, :age, :health, :strength
  def initialize(attributes)
    @name = attributes[:name]
    @age = attributes[:age]
    @health = attributes[:health]
    @strength = attributes[:strength]
    @constitution = attributes[:constitution]
    @dexterity = attributes[:dexterity]
    @intelligence = attributes[:intelligence]
    # roll_unique_attributes
  end
end

class Goblin < Enemy
end

class UserInterface
end

loki = Viking.create('loki')
ap loki
