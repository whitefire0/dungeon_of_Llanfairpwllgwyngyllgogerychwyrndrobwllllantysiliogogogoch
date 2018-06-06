class Character
	attr_accessor :strength
end

class Item
	attr_accessor :strength_modifier
	
	def apply_to(character)
		character.strength = character.strength + self.strength_modifier
	end
end

def Game
	def move
		... # do the moving to new tile stuff		
		tile.item.apply_to(character) if tile.item?
	end
end


class Item
	def apply_to(character)
		# Does nothing
	end
end

class StrengthPotion < Item
	attr_accessor :potency
	
	def apply_to(character)
		character.strength += self.potency
	end
end