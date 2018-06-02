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
  attr_reader :name, :age, :health, :strength

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

  def hit(enemy)
    puts "#{self.name} hit #{enemy.name} for #{self.strength} damage."
    enemy.take_damage(self.strength)
  end

  def take_damage(damage)
    self.health - damage unless self.health < 1
    puts "#{self.name} lost #{damage} health points"
  end
end