require_relative 'base_attributes'

class Enemy < Character

  def initialize
    determine_luck
    summon_enemy
  end

  def determine_luck
    @luck_stat = rand(100)
  end

  def summon_enemy
    case @luck_stat
    when < 60
      @enemy = SewerRat.new('Ratlet')
    when > 60 && < 80
      @enemy = Goblin.new('Twat')
    when > 80 && < 95
      @enemy = Wreath.new('Nazgul')
    when > 95 && <= 100
      @enemy = Balrog.new('Beatrice')
    else
    end

  end

end

class SewerRat < Enemy
  def roll_attribute_modifiers
    @health -= 200 unless @health < 30
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