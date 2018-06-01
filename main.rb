require 'pry'
require 'pry-byebug'
require 'awesome_print'

module BaseAttributes

  def create_base(attributes)
    @name = attributes[:name]
    @age = attributes[:age]
    @health = attributes[:health]
    @strength = attributes[:strength]
    @constitution = attributes[:constitution]
    @dexterity = attributes[:dexterity]
    @intelligence = attributes[:intelligence]
  end

end


class Game
end


class Character

  include BaseAttributes

  def self.create(name)
    age = (rand * 60 + 15).round
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
    (rand * 50 + 15).round
  end

end


class Enemy
end


class Viking < Character

  attr_reader :name

  def initialize(attributes)
    create_base(attributes)
    roll_attribute_modifiers
    roll_unique_attributes
  end

  def roll_attribute_modifiers
    @health += 200
    @strength = (@strength * 1.5).round
    @constitution = (@constitution * 1.5).round
    @intelligence = (@intelligence * 0.33).round
    @dexterity = (@dexterity * 0.75).round
  end

  def roll_unique_attributes

  end

end


class Wizard < Character

  attr_reader :name

  def initialize(attributes)
    create_base(attributes)
    roll_attribute_modifiers
    roll_unique_attributes
  end

  def roll_attribute_modifiers
    @health -= 100
    @strength = (@strength * 0.5).round
    @constitution = (@constitution * 0.5).round
    @intelligence = (@intelligence * 3).round
    @dexterity = (@dexterity * 1.25).round
  end

  def roll_unique_attributes

  end

end


class Rogue < Character

  attr_reader :name

  def initialize(attributes)
    create_base(attributes)
    roll_attribute_modifiers
    roll_unique_attributes
  end

  def roll_attribute_modifiers
    @health += 100
    @strength = (@strength * 1.1).round
    @constitution = (@constitution * 1.1).round
    @intelligence = (@intelligence * 0.75).round
    @dexterity = (@dexterity * 1.5).round
  end

  def roll_unique_attributes

  end

end


class Goblin < Enemy
end


class UserInterface
end


loki = Viking.create('Loki')
gandalf = Wizard.create('Gandalf')
blake = Rogue.create('Blake')
ap loki
ap gandalf
ap blake
