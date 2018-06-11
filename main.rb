require 'pry'
require 'pry-byebug'
require 'awesome_print'
require 'colorize'

require_relative 'src/user_interface'
require_relative 'src/game'
require_relative 'src/tile'
require_relative 'src/item'
require_relative 'src/characters'
require_relative 'src/enemies'
require_relative 'src/scoring_system'

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