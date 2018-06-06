require 'pry'
require 'pry-byebug'
require 'awesome_print'
require 'colorize'
require 'io/console'

require_relative 'user_interface'
require_relative 'game'
require_relative 'tile'
require_relative 'item'
require_relative 'characters'
require_relative 'enemies'

def start_game_instance
  play_again = true
  while play_again do
    game = Game.new
    interface = UserInterface.new(game)
    game.menu_instance = interface
    play_again = interface.manager
  end
end

start_game_instance

# Application Build Tests