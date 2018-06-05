class Game
  attr_accessor :on, :player_created, :player_name, :player_char, :menu_instance, :tile_number, :tile_type, :current_tile, :npcs, :spent_tiles, :delays_off, :last_damage_dealt, :last_attacking_char, :last_defending_char

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
      unless @player_char.is_dead
        @last_attacking_char = @player_char
        @last_damage_dealt = player_attacks
        @last_defending_char = @current_tile.enemy
        @menu_instance.render_message('hit')
      end
      unless @current_tile.enemy.is_dead
        @last_attacking_char = @current_tile.enemy
        @last_damage_dealt = enemy_attacks
        @last_defending_char = @player_char
        @menu_instance.render_message('hit')
      end
    end
    if @player_char.health <= 0
      @player_char.character_dead!
    end
    if @current_tile.enemy.health <= 0
      @current_tile.enemy.character_dead!
    end
    @menu_instance.render_message('died')
  end

  def player_attacks
    sleep(0.35) unless @menu_instance.dev_mode
    damage = player_char.hit(current_tile.enemy)
    damage
  end

  def enemy_attacks
    sleep(0.35) unless @menu_instance.dev_mode
    damage = current_tile.enemy.hit(player_char)
    damage
  end

end