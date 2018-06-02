require_relative 'base_attributes'

class Viking < Character
  attr_reader :name

  def roll_attribute_modifiers
    @health += 200
    @strength = (@strength * 1.5).round
    @constitution = (@constitution * 1.5).round
    @intelligence = (@intelligence * 0.33).round
    @dexterity = (@dexterity * 0.75).round
  end

  def add_unique_skills
    @unique_skills = {
      blocks: 5
    }
  end
end

class Wizard < Character
  attr_reader :name

  def roll_attribute_modifiers
    @health -= 100 unless @health < 125
    @strength = (@strength * 0.5).round
    @constitution = (@constitution * 0.5).round
    @intelligence = (@intelligence * 3).round
    @dexterity = (@dexterity * 1.25).round
  end

  def add_unique_skills
    @unique_skills = {
      cast_fireball: 5
    }
  end
end

class Rogue < Character
  attr_reader :name

  def roll_attribute_modifiers
    @health += 100
    @strength = (@strength * 1.1).round
    @constitution = (@constitution * 1.1).round
    @intelligence = (@intelligence * 0.75).round
    @dexterity = (@dexterity * 1.5).round
  end

  def add_unique_skills
    @unique_skills = {
      hide: 5
    }
  end
end

class Cleric < Character
  attr_reader :name

  def roll_attribute_modifiers
    @health -= 150 unless @health < 125
    @strength = (@strength * 0.6).round
    @constitution = (@constitution * 0.9).round
    @intelligence = (@intelligence * 2).round
    @dexterity = (@dexterity * 1.5).round
  end

  def add_unique_skills
    @unique_skills = {
      pray: 5
    }
  end
end

class Gimp < Character
  attr_reader :name

  def roll_attribute_modifiers
    @health += 1000
    @strength = (@strength * 0.1).round
    @constitution = (@constitution * 3).round
    @intelligence = (@intelligence * 0.25).round
    @dexterity = (@dexterity * 0.5).round
  end

  def add_unique_skills
    @unique_skills = {
      submit: 5
    }
  end
end