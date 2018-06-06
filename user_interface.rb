require_relative 'messages'

# UserInterface will eventually shield the entire inner application, exposing only accepted commands
class UserInterface
  include Messages
  attr_accessor :delays_off

  def initialize(game)
    @game_instance = game
    @character_chosen = false
    @chosen_action = nil
    @play_again = nil
  end
  
  def run_root_controller
    while @game_instance.on do
      player_creation_if_needed
      get_player_action
      run_player_action

      # return true/false to outer game creation loop in main.rb
      if @play_again
        return true
      else
        return false unless @game_instance.on
      end
    end
  end

  def player_creation_if_needed
    create_player unless @player_created
    select_character_instance unless @character_chosen
    @game_instance.on = true if @player_created && @character_chosen
  end

  def create_player
    unless @game_instance.player_created
      render_message('get name')
      # player_name = gets.chomp
      # *** FOR TESTING ***
      player_name = 'Rick'
      @game_instance.create_player(player_name)
    end
  end

  def select_character_instance
    while player_class == NilClass
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
        @game_instance.set_player_class('Viking')
      when /^b|B/
        @game_instance.set_player_class('Barbarian')
      when /^w|W/
        @game_instance.set_player_class('Wizard')
      when /^r|R/
        @game_instance.set_player_class('Rogue')
      when /^c|C/
        @game_instance.set_player_class('Cleric')
      when /^g|G/
        @game_instance.set_player_class('Gimp')
      else
        puts "Invalid choice, please choose again.".colorize(:light_black)
      end
    end
  end

  def run_player_action
    case @chosen_action
      when "walk"
        walk
      when "attack"
        attack
      when "rest"
        rest
      when "inspect"
        inspect        
      when "hide"
        hide
      when "use item"
        hide
      when "dance"
      when "retreat"
      when "save and exit"
      when "exit"             
      else
    end
  end

  def walk
    if enemy_is_present
      render_message('enemy blocking')
      reset_player_action
    end
    # if tile_unspent
    #   # HACK - find some other way of preventing tile_unspent running if an enemy has already prevented action
    #   unless enemy_is_present
    #     render_message('not now')
    #     reset_player_action
    #   end
    # end
    unless enemy_is_present
      move_forward_and_act
      reset_player_action
    end
  end

  def attack
    if @game_instance.current_tile
      if @game_instance.current_tile.enemy_present
        run_battle_sequence
      else
        render_message('attacking nothing')
      end
    else
      render_message('attacking nothing')
    end
    reset_player_action
  end

  def rest
    if @game_instance.current_tile
      @healed = @game_instance.player_char.rest
    if @healed
      render_message('heal')
    else
      render_message('no more rests')
    end
    else
      render_message('outside dungeon')
    end
    reset_player_action
  end

  def inspect
    if @game_instance.current_tile
      render_message('checking area')
      if@game_instance.current_tile.item_present
        render_message('describe item')
      end
    else
      render_message('outside dungeon')
    end
    reset_player_action
  end

  def hide
    if @game_instance.current_tile
      # code
    else
      render_message('outside dungeon')
    end
    reset_player_action 
  end

  def run_battle_sequence
    @game_instance.battle_mode
    @game_instance.spent_tiles += 1
    exit_game? if @game_instance.player_char.is_dead   
  end

  def move_forward_and_act
    reset_available_rests
    @game_instance.get_new_tile
    present_tile
    get_player_action
  end

  def enemy_is_present
    unless @game_instance.current_tile == nil
      @game_instance.current_tile.enemy_present
    end
  end

  def welcome_player
    render_message('welcome player')
    render_message('character stats')
    @character_chosen = true
    sleep(2) unless dev_mode
    render_message('walk into dungeon')
  end

  def present_tile
    sleep(1) unless dev_mode
    render_message('step forward')
    sleep(1) unless dev_mode
    render_message('tile description')
    sleep(1.5) unless dev_mode
    if @game_instance.current_tile.enemy_present
      render_message('enemy appears')
      sleep(2) unless dev_mode
      render_message('inspect enemy')
    end
  end

  def get_player_action
    # *** FOR TESTING ***
    # @chosen_action = 'attack'
    sleep(1.5) unless dev_mode
    # binding.pry
    while @chosen_action == nil
      render_message('choose action')
      response = gets.chomp
      puts "\n"
      case response
      when /^w|W/
        @chosen_action = 'walk'
      when /^a|A/
        @chosen_action = 'attack'
      when /^r|R/
        @chosen_action = 'rest'
      when /^i|I/
        @chosen_action = 'inspect'
      when /^u|U/
        @chosen_action = 'use'
      when /^d|D/
        @chosen_action = 'dance'
      when /^e|E/
        @chosen_action = 'retreat'
      when /^s|S/
        @chosen_action = 'save and exit'
      when /^x|X/
        @chosen_action = 'exit'
      else
        render_message('invalid action')
      end
    end
  end

  def tile_unspent
    @game_instance.tile_number > @game_instance.spent_tiles
  end

  def reset_player_action
    @chosen_action = nil
  end

  def reset_available_rests
    @game_instance.player_char.rests_remaining = @game_instance.player_char.rests_per_turn
  end

  def exit_game?
    # do we need this nil?
    # @play_again = nil
    while @play_again == nil do
      render_message('play again?')
      response = gets.chomp
      case response
      when /^y|Y/
        @play_again = true
      when /^n|N/
        @play_again = false
      else
        render_message('invalid action')
      end
    end

    @game_instance.on = false if @play_again == false
  end

  def dev_mode
     @game_instance.delays_off
  end

  def player_name
    @game_instance.player_char.name
  end

  def player_class
    @game_instance.player_char.class
  end
  
  def player_age
    @game_instance.player_char.age
  end

  def player_health
    @game_instance.player_char.health
  end

  def player_strength
    @game_instance.player_char.strength
  end

  def player_constitution
    @game_instance.player_char.constitution
  end

  def player_intelligence
    @game_instance.player_char.intelligence
  end

  def player_dexterity
    @game_instance.player_char.dexterity
  end

  def player_unique_skills
    @game_instance.player_char.unique_skills
  end

  def enemy_name
    @game_instance.current_tile.enemy.name
  end

  def enemy_class
    @game_instance.current_tile.enemy.class
  end
  
  def enemy_age
    @game_instance.current_tile.enemy.age
  end

  def enemy_health
    @game_instance.current_tile.enemy.health
  end

  def enemy_strength
    @game_instance.current_tile.enemy.strength
  end

  def enemy_constitution
    @game_instance.current_tile.enemy.constitution
  end

  def enemy_intelligence
    @game_instance.current_tile.enemy.intelligence
  end

  def enemy_dexterity
    @game_instance.current_tile.enemy.dexterity
  end

  def enemy_unique_skills
    @game_instance.current_tile.enemy.unique_skills
  end
end