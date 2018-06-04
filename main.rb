require 'pry'
require 'pry-byebug'
require 'awesome_print'

require_relative 'user_interface'
require_relative 'game'
require_relative 'tile'
require_relative 'item'
require_relative 'characters'
require_relative 'enemies'

def start_game
  game = Game.new
  game.tile_number = 0
  interface = UserInterface.new(game)
  game.menu_instance = interface
  # binding.pry
  interface.run_menu
end

start_game

# Application Build Tests