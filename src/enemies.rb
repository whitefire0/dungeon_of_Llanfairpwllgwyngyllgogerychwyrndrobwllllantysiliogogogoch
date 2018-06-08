require_relative 'base_attributes'

class Enemy < Character
  def self.generate_from_probability(p)
    enemy = nil
    case
    when p < 60 
      enemy = SewerRat.create('Ratlet')
    when p >= 60 && p <= 80
      enemy = Goblin.create('Arse Itch')
    when p > 80 && p <= 90
      enemy = Wreath.create('Nazgul')
    when p > 90 && p <= 100
      enemy = Balrog.create('Beatrice')
    end
    enemy
  end
end

class SewerRat < Enemy
  def roll_attribute_modifiers
    # BUG-01: Sewer rat health goes into minus - needs base adjustment or class adjustment
    # @health -= 200 unless @health < 30 && @health < 0
    @health = 45
    @strength = (@strength * 0.1).round
    @constitution = (@constitution * 0.1).round
    @intelligence = (@intelligence * 0.1).round
    @dexterity = (@dexterity * 2).round
  end

  def add_unique_skills
    @unique_skills = {
      die_of_disease: 1
    }
  end
end

class Goblin < Enemy
  def roll_attribute_modifiers
    @strength = (@strength * 1).round
    @constitution = (@constitution * 1).round
    @intelligence = (@intelligence * 0.25).round
    @dexterity = (@dexterity * 1).round
  end

  def add_unique_skills
    @unique_skills = {
      blocks: 5
    }
  end
end

class Wreath < Enemy
  def roll_attribute_modifiers
    @health += 200
    @strength = (@strength * 1.5).round
    @constitution = (@constitution * 1.5).round
    @intelligence = (@intelligence * 1.5).round
    @dexterity = (@dexterity * 2).round
  end

  def add_unique_skills
    @unique_skills = {
      drain: 5
    }
  end
end

class Balrog < Enemy
  def roll_attribute_modifiers
    @health += 2000
    @strength = (@strength * 4).round
    @constitution = (@constitution * 4).round
    @intelligence = (@intelligence * 1.25).round
    @dexterity = (@dexterity * 0.5).round
  end

  def add_unique_skills
    @unique_skills = {
      hellfire: 5
    }
  end
end