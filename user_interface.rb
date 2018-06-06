require_relative 'game_state_abbreviations'
require_relative 'messages'

# UserInterface will eventually shield the entire inner application, exposing only accepted commands
class UserInterface
  include GameStateAbbreviations
  include Messages
  attr_accessor :delays_off

  def initialize(game)
    @game_instance = game
    @play_again = nil
  end
  
  def manager
    while @game_instance.on do
      game_setup
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

  def game_setup
    get_player_name unless @game_instance.player_created
    create_character unless @game_instance.character_chosen
    @game_instance.on = true if @game_instance.player_created && @game_instance.character_chosen
  end

  def get_player_name
      render_message('get name')
      # player_name = gets.chomp
      # *** FOR TESTING ***
      player_name = 'Rick'
      @game_instance.create_player(player_name)
  end

  def create_character
    while player_class == NilClass
      render_message('choose class')
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
    welcome_player
    render_message('walk into dungeon')
  end

  def run_player_action
    case @game_instance.chosen_action
      when "walk"
        @game_instance.walk
      when "attack"
        @game_instance.attack
      when "rest"
        @game_instance.rest
      when "inspect"
        @game_instance.inspect        
      when "hide"
        @game_instance.hide
      when "use item"
        @game_instance.hide
      when "dance"
      when "retreat"
      when "save and exit"
      when "exit"             
      else
    end
  end

  

  def welcome_player
    render_message('welcome player')
    render_message('character stats')
    sleep(2) unless dev_mode
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
    while @game_instance.chosen_action == nil
      render_message('choose action')
      response = gets.chomp
      puts "\n"
      case response
      when /^w|W/
        @game_instance.chosen_action = 'walk'
      when /^a|A/
        @game_instance.chosen_action = 'attack'
      when /^r|R/
        @game_instance.chosen_action = 'rest'
      when /^i|I/
        @game_instance.chosen_action = 'inspect'
      when /^u|U/
        @game_instance.chosen_action = 'use'
      when /^d|D/
        @game_instance.chosen_action = 'dance'
      when /^e|E/
        @game_instance.chosen_action = 'retreat'
      when /^s|S/
        @game_instance.chosen_action = 'save and exit'
      when /^x|X/
        @game_instance.chosen_action = 'exit'
      else
        render_message('invalid action')
      end
    end
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
end