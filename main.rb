require 'pry'
require 'pry-byebug'
require 'awesome_print'

require_relative 'characters'
require_relative 'enemies'









game = Game.new
interface = UserInterface.new(game)
game.menu_instance = interface
interface.run_menu


# Application Build Tests