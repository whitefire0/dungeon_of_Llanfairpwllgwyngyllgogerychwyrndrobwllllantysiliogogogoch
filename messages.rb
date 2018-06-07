module Messages
  def render_message(options)
    case options[:msg]
    when 'attacking nothing'
      puts "You are attacking thin air...there is no enemy. Conserve your energy you dimwit.\n\n".colorize(:red)
    when 'outside dungeon'
      puts "You are still standing outside the dungeon...get on with it!\n\n".colorize(:red)
    when 'get name'
      puts "Please enter your name, player: \n".colorize(:light_black)
    when 'choose class'
      puts "\nPlease choose your character class:
              v = Viking 
              b = Barbarian
              w = Wizard 
              r = Rogue 
              c = Cleric 
              g = Gimp\n".colorize(:light_black)
    when 'welcome player'
      puts "Welcome to the dungeon, #{player_name} the #{player_class}! Untold glory awaits you.\n".colorize(:magenta)
    when 'character stats'
      puts "These are your character stats:\n
        Age: #{player_age}
        Health: #{player_health}
        Strength: #{player_strength}
        Constitution: #{player_constitution}
        Intelligence: #{player_intelligence}
        Dexterity: #{player_dexterity}
        Your unique skill: #{player_unique_skills}\n".colorize(:yellow)
    when 'walk into dungeon'
      puts "It is here that we begin. If you are sure you wish to proceed, you must walk into the dungeon itself...\n".colorize(:light_green)
    when 'step forward'
      puts "You step forward, into the next dungeon area, reaching tile #{@game_instance.tile_number}...".colorize(:light_green)
    when 'tile description'
      puts @game_instance.current_tile.tile_type.tile_description.colorize(:green)
      puts "\n\n"
    when 'enemy appears'
      puts "\nAn enemy has appeared! #{enemy_name} the #{enemy_class} is standing in front of you!\n".colorize(:light_red)
    when 'inspect enemy'
      puts "You take a look closer at the bastard, and see...\n
            Name: #{enemy_name}
            Type: #{enemy_class}
            Age: #{enemy_age}
            Health: #{enemy_health}
            Strength: #{enemy_strength}
            Constitution: #{enemy_constitution}
            Intelligence: #{enemy_intelligence}
            Dexterity: #{enemy_dexterity}
            Unique Skill: #{enemy_unique_skills}\n".colorize(:yellow)
    when 'choose action'
      puts "Player, make your choice:
        w = Walk forward...further into the dungeon
        a = Attack
        r = Rest
        i = Inspect area
        u = Use item
        d = Dance
        e = Retreat
        s = Save and exit
        x = Exit\n".colorize(:light_black)
    when 'hit'
      puts "#{@game_instance.last_attacking_char.name} the #{@game_instance.last_attacking_char.class} hit #{@game_instance.last_defending_char.name} the #{@game_instance.last_defending_char.class} for #{@game_instance.last_damage_dealt} hitpoints".colorize(:red) 
      puts "#{@game_instance.last_defending_char.name} has #{@game_instance.last_defending_char.health} health remaining\n".colorize(:light_red)
    when 'heal'
      puts "#{player_name} the #{player_class} healed for #{@game_instance.healed} hitpoints\n".colorize(:blue)
    when 'no more rests'
      puts "You have no more rests remaining in this area...you must advance!\n".colorize(:red)
    when 'died'
      if @game_instance.player_char.is_dead
        puts "#{player_name} lost all their health points and has died!\n".colorize(:red)
      elsif @game_instance.current_tile.enemy.class == NilClass
        puts "#{@game_instance.previous_enemy.name} lost all their health points and has died!\n".colorize(:red)
      end
    when 'enemy blocking'
      puts "You can't move foward, #{enemy_name} the #{enemy_class} is blocking your path!\n\n".colorize(:red)
    when 'checking area'
      puts "You put on your adventurers spectacles and take a look around the area. It is a #{@game_instance.current_tile.tile_type.class} area, that's for sure.\n".colorize(:blue)
    when 'describe item'
      puts "You discovered an item! The #{@game_instance.current_tile.item.name} triggers a vague memory and you think you remember what it does....#{@game_instance.current_tile.item.description}\n\nYou place it in your fanny pack for safe keeping\n\n".colorize(:cyan)
    when 'no item present'
      puts "There is nothing of value here.".colorize(:light_black)
    when 'select item'
      puts "Inventory:".colorize(:magenta)
      puts "----------------------------------------------------".colorize(:magenta)
      options[:items].each { |item| puts "Name:   #{item.name.colorize(:light_black)}     Menu command: #{item.menu_command.colorize(:magenta)}"}
      puts "----------------------------------------------------".colorize(:magenta)
      puts "\n\nPlease select one of your items by typing in it's command".colorize(:magenta)
    when 'invalid action'
      puts "Invalid action. Please choose again.\n\n".colorize(:light_black)
    when 'item used'
      puts "\n\nYou used your #{options[:item].name}! #{options[:item].effect_message}\n\n".colorize(:blue)
    when 'not now'
      puts "\nYou can't do that right now\n\n".colorize(:light_black)
    when 'play again?'
      puts "You have been defeated! Would you like to play again? (y/n)".colorize(:magenta)
    else
    end
  end
end
