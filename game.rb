class Game
  attr_accessor :on, :player_created, :player_name, :player_char, :menu_instance, :tile_number, :tile_type, :current_tile, :npcs, :spent_tiles, :delays_off

  def initialize
    @menu_instance = nil
    @on = true
    @delays_off = true
    @player_created = false
    @player_name = nil
    @player_char = nil
    @tile_number = 0
    @spent_tiles = 0
    @tile_type = nil
    @current_tile = nil
    generate_npcs
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
    sleep(0.35) unless @menu_instance.dev_mode
    player_char.hit(current_tile.enemy)
  end

  def enemy_attacks
    sleep(0.35) unless @menu_instance.dev_mode
    current_tile.enemy.hit(player_char)
  end

end