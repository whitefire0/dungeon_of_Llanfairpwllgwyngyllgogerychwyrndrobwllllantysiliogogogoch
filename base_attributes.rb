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

class Character
  include BaseAttributes
  attr_reader :name, :age, :health, :strength, :constitution, :dexterity, :intelligence, :unique_skills, :is_dead
  attr_writer :health, :is_dead

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
      intelligence: base_range
    }
    self.new(attributes)

  end

  def self.base_range
    (rand * 50 + 15).round
  end

  def hit(enemy)
    modified_strength = fluctuate(self.strength)
    puts "#{self.name} the #{self.class} hit #{enemy.name} the #{enemy.class} for #{modified_strength} damage.".colorize(:red)
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