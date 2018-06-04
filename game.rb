class Game
  attr_accessor :on, :player_created, :player_name, :player_char, :menu_instance, :tile_number, :tile_type, :current_tile, :npcs 

  def initialize
    @menu_instance = nil
    @on = true
    @player_created = false
    @player_name = nil
    @player_char = nil
    @tile_number = 0
    @tile_type = nil
    @current_tile = nil
    generate_npcs
  end

  def select_character_instance
    while @player_char.class == NilClass
      puts "\nPlease choose your character class:
              v = Viking 
              b = Barbarian
              w = Wizard 
              r = Rogue 
              c = Cleric 
              g = Gimp\n".colorize(:magenta)
      # chosen_class = gets.chomp
      # *** FOR TESTING ***
      chosen_class = 'v'
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
        puts "Invalid choice, please choose again.".colorize(:light_black)
      end
    end
  end

  def create_character_instance
    @player_char = @player_char.create(@player_name)
    # @player_char.name << " the #{@player_char.class}"
    @menu_instance.welcome_player
  end
    
  def set_player_class(classname)
    @player_char = Object.const_get(classname)
    create_character_instance
  end

  def get_new_tile
    # binding.pry
    @current_tile = Tile.new
    @tile_number += 1
  end

  def generate_npcs
    @npcs = {
      @npc_viking => Viking.create('Gimli'),
      @npc_wizard => Wizard.create('Gandalf'),
      @npc_rogue => Rogue.create('Blake'),
      @npc_cleric => Cleric.create('Archbishop of Canterbury'),
      @npc_gimp => Gimp.create('Theresa May'),
      @npc_sewer_rat => SewerRat.create('Shredder'),
      @npc_goblin => Goblin.create('Smegel'),
      @npc_wreath => Wreath.create('Casper'),
      @npc_balrog => Balrog.create('Berty')
    }
  end

  def battle_mode
    while @player_char.health > 0 && @current_tile.enemy.health > 0 do
      player_attacks unless @player_char.is_dead
      enemy_attacks unless @current_tile.enemy.is_dead
    end
  end

  def player_attacks
    player_char.hit(current_tile.enemy)
  end

  def enemy_attacks
    current_tile.enemy.hit(player_char)
  end

end