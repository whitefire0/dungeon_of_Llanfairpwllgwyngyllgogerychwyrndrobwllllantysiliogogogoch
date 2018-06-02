require 'pry'
require 'pry-byebug'
require 'awesome_print'

require_relative 'characters'
require_relative 'enemies'

class Game
end

class Tile
end

class UserInterface
end

# Application Build Tests
loki = Viking.create('Loki')
gandalf = Wizard.create('Gandalf')
blake = Rogue.create('Blake')
john_priestly = Cleric.create('John Priestly')
mark = Gimp.create('Mark')

ratlet = SewerRat.create('Ratlet')
pickle = Goblin.create('Pickle')
wheezy = Wreath.create('Wheezy')
berty = Balrog.create('Berty')

ap loki
ap gandalf
ap blake
ap john_priestly
ap mark

ap ratlet
ap pickle
ap wheezy
ap berty
