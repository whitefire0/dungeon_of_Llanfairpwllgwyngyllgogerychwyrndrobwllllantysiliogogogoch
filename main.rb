require 'pry'
require 'pry-byebug'
require 'awesome_print'

require_relative 'characters'
require_relative 'enemies'

class Game
  attr_accessor :on, :player_created, :player_name, :player_char

  def initialize
    @on = true
    @player_created = false
    @player_name = nil
    @player_char = nil
  end
 
  # class << self
  #   attr_accessor :on
  # end

  def create_character_instance(chosen_class)
    class_symbol = nil
    if chosen_class == 'v'
      @player_char = Object.const_get('Viking')
      @player_char.create('Loki')
      puts @player_char.inspect
    end
  end
end

class Tile
end

class UserInterface

  def initialize(game)
    @player_created = false
    @game_instance = game
  end
  
  def run_menu
    counter = 0
    while @game_instance.on do
      if @player_created

      else
        create_player
      end

      counter += 1
      @game_instance.on = false if counter > 10
    end
  end

  def create_player
    puts "Please enter your name, player: \n"
    @game_instance.player_name = gets.chomp
    @player_created = true
    puts "Please choose your character class (v, w, r, c, g):\n"
    chosen_class = gets.chomp
    @game_instance.create_character_instance(chosen_class)
  end
end

game = Game.new
interface = UserInterface.new(game)
interface.run_menu


# Application Build Tests
# loki = Viking.create('Loki')
# gandalf = Wizard.create('Gandalf')
# blake = Rogue.create('Blake')
# john_priestly = Cleric.create('John Priestly')
# mark = Gimp.create('Mark')

# ratlet = SewerRat.create('Ratlet')
# pickle = Goblin.create('Pickle')
# wheezy = Wreath.create('Wheezy')
# berty = Balrog.create('Berty')

# puts "#" * 168
# puts "Attribute checker:"
# puts "#" * 168
# ap loki
# ap gandalf
# ap blake
# ap john_priestly
# ap mark
# puts "#" * 168
# ap ratlet
# ap pickle
# ap wheezy
# ap berty
# puts "\n"
# puts "#" * 168
# puts "Battle mechanics checker:"
# puts "#" * 168
# binding.pry
# loki.hit(berty)
# berty.hit(loki)
# loki.hit(berty)
# berty.hit(loki)
# loki.hit(berty)
# berty.hit(loki)
# loki.hit(berty)
# berty.hit(loki)
# loki.hit(berty)
# berty.hit(loki)
# loki.hit(berty)
# berty.hit(loki)
# loki.hit(berty)
# berty.hit(loki)

# viking = Viking.create('Loki')
# wizard = Wizard.create('Gandalf')
# rogue = Rogue.create('Blake')
# cleric = Cleric.create('John Priestly')
# gimp = Gimp.create('Mark')

# sewer_rat = SewerRat.create('Ratlet')
# goblin = Goblin.create('Pickle')
# wreath = Wreath.create('Wheezy')
# balrog = Balrog.create('Berty')