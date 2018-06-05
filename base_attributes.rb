module BaseAttributes
  def create_base(attributes)
    @name = attributes[:name]
    @age = attributes[:age]
    @health = attributes[:health]
    @strength = attributes[:strength]
    @constitution = attributes[:constitution]
    @dexterity = attributes[:dexterity]
    @intelligence = attributes[:intelligence]
    @rests_per_turn = attributes[:rests_per_turn]
    @rests_remaining = attributes[:rests_remaining]
  end
end

class Character
  include BaseAttributes
  attr_reader :name, :age, :health, :strength, :constitution, :dexterity, :intelligence, :unique_skills, :is_dead, :rests_per_turn, :rests_remaining
  attr_writer :health, :is_dead, :rests_per_turn, :rests_remaining

  def initialize(attributes)
    create_base(attributes)
    roll_attribute_modifiers
    add_unique_skills
  end

  def self.create(name)
    age = (rand * 60 + 15).round
    attributes = {
      name: name,
      age: age,
      health: [age * 2, 300].min,
      strength: [age / 2, 10].max,
      constitution: base_range,
      dexterity: base_range,
      intelligence: base_range,
      rests_per_turn: 1,
      rests_remaining: 1
    }
    self.new(attributes)

  end

  def self.base_range
    (rand * 50 + 15).round
  end

  def hit(enemy)
    modified_strength = fluctuate(self.strength)
    
    enemy.take_damage(modified_strength)
  end

  def take_damage(damage)
    modified_damage = fluctuate(damage)
    self.health -= modified_damage
    if self.health > 0
      puts "#{self.name} lost #{modified_damage} health points, and has #{self.health} points remaining\n".colorize(:red)
    else
      character_dead!
    end
  end

  def rest
    if self.rests_remaining > 0
      heal_up = fluctuate(self.constitution)
      self.health += heal_up
      puts "You have healed for #{heal_up}"
      self.rests_remaining -= 1
    else
      puts "You have no more rests available in this area, you must advance!"
    end
  end

  def character_dead!
    puts "#{self.name} lost all their health points and has died!\n".colorize(:red)
    @is_dead = true
  end

  def fluctuate(num)
    (num * (rand(0.7..1.0))).round
  end

  # def is_enemy_alive?(enemy)
  #   enemy.health > 0
  # end

  # def is_self_alive?
  #   self.health > 0
  # end
end