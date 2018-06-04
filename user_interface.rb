# UserInterface will eventually shield the entire inner application, exposing only accepted commands
class UserInterface
  def initialize(game)
    @game_instance = game
    @player_created = false
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
    @game_instance.select_character_instance unless @character_chosen
    @game_instance.on = true if @player_created && @character_chosen
  end

  def run_player_action
    case @chosen_action
      when "walk"
        unless @game_instance.tile_number > @game_instance.spent_tiles
          move_forward_and_act
        end
      when "attack"
        if @game_instance.current_tile.enemy
          run_battle_sequence
        else
          render_message('attacking nothing')
        end
      when "rest"
        @game_instance.player_char.rest
        reset_player_action
      when "inspect"
        # code
      when "hide"
        # code
      else
    end
  end

  def run_battle_sequence
    @game_instance.battle_mode
    reset_player_action
    @game_instance.spent_tiles += 1
    exit_game? if @game_instance.player_char.is_dead
  end

  def move_forward_and_act
    reset_available_rests
    @game_instance.get_new_tile
    present_tile
    get_player_action
  end

  def create_player
    unless @player_created
      render_message('get name')
      # @game_instance.player_name = gets.chomp
      # *** FOR TESTING ***
      @game_instance.player_name = 'Rick'
      @player_created = true
    end
  end

  def welcome_player
    render_message('welcome player')
    # binding.pry
    render_message('character stats')
    @character_chosen = true
    sleep(2)
    render_message('walk into dungeon')
  end

  def present_tile
    sleep(1)
    render_message('step forward')
    sleep(1)
    render_message('tile description')
    sleep(1.5)
    if @game_instance.current_tile.enemy_present
      render_message('enemy appears')
      sleep(2)
      render_message('inspect enemy')
    end
  end

  def get_player_action
    # *** FOR TESTING ***
    # @chosen_action = 'attack'
    sleep(2)
    while @chosen_action == nil
      render_message('choose action')
      response = gets.chomp
      case response
      when /^w|W/
        @chosen_action = 'walk'
      when /^a|A/
        @chosen_action = 'attack'
      when /^r|R/
        @chosen_action = 'rest'
      when /^i|I/
        @chosen_action = 'inspect'
      else
        render_message('invalid action')
      end
    end
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

  def render_message(msg)
    case msg
    when 'attacking nothing'
      puts "You are attacking thin air...there is no enemy. Conserve your energy you dimwit."
    when 'get name'
      puts "Please enter your name, player: \n".colorize(:magenta)
    when 'welcome player'
      puts "Welcome to the dungeon, #{@game_instance.player_name} the #{@game_instance.player_char.class}! Untold glory awaits you.\n".colorize(:magenta)
    when 'character stats'
      puts "These are your character stats:\n
        Age: #{@game_instance.player_char.age}
        Health: #{@game_instance.player_char.health}
        Strength: #{@game_instance.player_char.strength}
        Constitution: #{@game_instance.player_char.constitution}
        Intelligence: #{@game_instance.player_char.intelligence}
        Dexterity: #{@game_instance.player_char.dexterity}
        Your unique skill: #{@game_instance.player_char.unique_skills.first}\n".colorize(:blue)
    when 'walk into dungeon'
      puts "It is here that we begin. If you are sure you wish to proceed, you must walk into the dungeon itself...\n".colorize(:light_green)
    when 'step forward'
      puts "You step forward, into the next dungeon area, reaching tile #{@game_instance.tile_number}...".colorize(:light_green)
    when 'tile description'
      puts @game_instance.current_tile.tile_description.colorize(:green)
    when 'enemy appears'
      puts "\nAn enemy has appeared! #{@game_instance.current_tile.enemy.name} the #{@game_instance.current_tile.enemy.class} is standing in front of you!\n".colorize(:light_red)
    when 'inspect enemy'
      puts "You take a look closer at the bastard, and see...\n
            Name: #{@game_instance.current_tile.enemy.name}
            Type: #{@game_instance.current_tile.enemy.class}
            Age: #{@game_instance.current_tile.enemy.age}
            Health: #{@game_instance.current_tile.enemy.health}
            Strength: #{@game_instance.current_tile.enemy.strength}
            Constitution: #{@game_instance.current_tile.enemy.constitution}
            Intelligence: #{@game_instance.current_tile.enemy.intelligence}
            Dexterity: #{@game_instance.current_tile.enemy.dexterity}
            Unique Skill: #{@game_instance.current_tile.enemy.unique_skills}\n".colorize(:yellow)
    when 'choose action'
      puts "Player, make your choice:
        w = Walk forward...further into the dungeon
        a = Attack
        r = Rest
        i = Inspect area\n".colorize(:magenta)
    when 'invalid action'
      puts "Invalid action. Please choose again.".colorize(:light_black)
    when 'play again?'
      puts "You have been defeated! Would you like to play again? (y/n)"
    else
    end
  end
end