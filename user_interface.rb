# UserInterface will eventually shield the entire inner application, exposing only accepted commands
class UserInterface
  def initialize(game)
    @game_instance = game
    @player_created = false
    @character_chosen = false
    @chosen_action = nil
  end
  
  def run_menu
    create_player unless @player_created
    @game_instance.select_character_instance unless @character_chosen

    while @game_instance.on do
      @game_instance.get_new_tile
      present_tile
      get_player_action
      puts @chosen_action


      puts "Menu powering down..."
      @game_instance.on = false
    end
  end

  def create_player
    unless @player_created
      puts "Please enter your name, player: \n"
      @game_instance.player_name = gets.chomp
      @player_created = true
    end
  end

  def welcome_player
    puts "Welcome to the dungeon, #{@game_instance.player_name}! Untold glory awaits you."
    @character_chosen = true
  end

  def present_tile
    puts @game_instance.current_tile.tile_type
    if @game_instance.current_tile.enemy_present
      puts "An enemy has appeared! #{@game_instance.current_tile.enemy.name} is standing in front of you."
    end
  end

  def get_player_action
    while @chosen_action == nil
    puts "Player, make your choice: (a, r, i, h)"
    response = gets.chomp
    case response
    when /^a|A/
      @chosen_action = 'attack'
    when /^r|R/
      @chosen_action = 'rest'
    when /^i|I/
      @chosen_action = 'inspect'
    when /^h|H/
      @chosen_action = 'hide'
    else
      puts "Invalid action. Please choose again."
    end
  end
end