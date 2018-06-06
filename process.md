git ls-files | xargs cat | wc -l

Todo
  Refactor some of the UI methods into game itself, so that a console user could run the game with commands entirely

  introduce item effects
    inspect wiring between new tile, item and game item detection

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