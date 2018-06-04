require 'pry'
require 'pry-byebug'
require 'awesome_print'
require 'colorize'

require_relative 'user_interface'
require_relative 'game'
require_relative 'tile'
require_relative 'item'
require_relative 'characters'
require_relative 'enemies'

def start_game
  game = Game.new
  interface = UserInterface.new(game)
  game.menu_instance = interface
  interface.run_menu
end

start_game

# Application Build Tests