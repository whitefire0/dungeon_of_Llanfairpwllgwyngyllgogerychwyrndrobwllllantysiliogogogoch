git ls-files | xargs cat | wc -l

Todo
  * Refactor some of the UI methods into game itself, so that a console user could run the game with commands entirely

  Refactor Tile so that only Tile knows what kinds of tiles exist. Calling Tile.create makes it randomly initialise one of its subclasses. This decouples it from Game.

  introduce item effects
    inspect wiring between new tile, item and game item detection

    Tile.tile_type recieves new tile
      tile_type.tile_description

      = current_tile.tile_type.tile_description

    Tile.item recieves new item
      Tile.item.mame
      Tile.item.description

      = current_tile.item.description

    Menu coloring
    [:black, :light_black, :red, :light_red, :green, :light_green, :yellow, :light_yellow, :blue, :light_blue, :magenta, :light_magenta, :cyan, :light_cyan, :white, :light_white, :default]

    :default, :bold, :italic, :underline, :blink, :swap, :hide]

      get action: light_black

      all stats: yellow

      hits: light red
      dies: red

      walk: light green

      item find/use: blue

      tile descript: green
      item descrip: light green



  introduce game events

  introduce npc interactions

  (low priority) character/enemy/item balancing via simulator, create game difficulties)

  allow for player actions within battle mode
    heal
    use item
    use special skill
    taunt enemy (on character subclass)
    attempt escape

  get enemy to randomly choose enemy actions within battle mode
    heal
    use special skill
    say something funny

  increase number of enemies
  have tiles dynamically set enemy probabilities

  create winning conditions

  implement scoring system

  on death/victory, write game stats to a log file (as preliminary to storing stats in mysql)
    player name
    character name, type, stats
    tile reached
    enemies defeated
    items used
    events that occurred

  rails console application
    ascii graphic of characters/monsters with stats when they appear?

  integration with Telnet