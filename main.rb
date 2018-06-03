require 'pry'
require 'pry-byebug'
require 'awesome_print'

require_relative 'characters'
require_relative 'enemies'

class Game
  attr_accessor :on, :player_created, :player_name, :player_char, :menu_instance

  def initialize
    @menu_instance = nil
    @on = true
    @player_created = false
    @player_name = nil
    @player_char = nil
  end

  # WHYYY
  # main.rb:21:in `instance_variable_set': `menu_interface' is not allowed as an instance variable name (NameError)
  # def inject_dependency(var_name, object_name)
  #   var_name = var_name.to_sym
  #   instance_variable_set(var_name, object_name)
  # end

  def create_character_instance(chosen_class)
    case chosen_class
    when /^v|V/
      set_player_class('Viking')
    when /^b|B/
      set_player_class('Barbarian')
    when /^w|W/
      set_player_class('Wizard')
    when /^r|R/
      set_player_class('Rogue')
    when /^c|C/
      set_player_class('Cleric')
    when /^g|G/
      set_player_class('Gimp')
    else
      puts "Invalid choice, please choose again."
      @menu_instance.create_player
    end

    if @player_char
      # HACK: prevent recreation of character if already established from second+ call of create_player i.e. if user entered incorrect character type first time (limit print statement to once due to create_player and create_character_instance calling each other creating repeated stack frames)
      # FIX: two loops calling each other - try inner method conditional looping
      unless @player_char.instance_variables
        binding.pry
        @player_char = @player_char.create(@player_name)
        @player_char.name << " the #{@player_char.class}"
      end

    end
  end

  def set_player_class(classname)
    @player_char = Object.const_get(classname)
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
    unless @player_created
      puts "Please enter your name, player: \n"
      @game_instance.player_name = gets.chomp
      @player_created = true
    end
    puts "\nPlease choose your character class (v, b,w, r, c, g):\n"
    chosen_class = gets.chomp
    @game_instance.create_character_instance(chosen_class)

    # HACK: limit print statement to once due to create_player and create_character_instance calling each other creating repeated stack frames
    print_num = 0
    if print_num == 0
      puts "Welcome to the dungeon, #{@game_instance.player_name}! Untold glory awaits you."
      print_num =+ 1
    end
  end
end

game = Game.new
interface = UserInterface.new(game)
game.menu_instance = interface
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