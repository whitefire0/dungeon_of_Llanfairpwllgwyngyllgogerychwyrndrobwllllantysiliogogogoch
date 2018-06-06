git ls-files | xargs cat | wc -l

create character
generate tile
present tile to player
  give player opportunity to heal
  give player opportunity to inspect tile
  give player opportunity to use inventory items
  if enemy then switch to attack event
    simulate battle
      at each turn, give player opportunity to attack or use special skill
    if player dead, end game
    if enemy dead, calculate score based on enemy difficulty and number of moves
    generate new tile
  repeat until dungeon complete (initially 10 tiles), or character dies
on completion or death, log game details in a local text file

create a simulator that runs the game automatically and compiles stats on wins/losses to check for character/enemy/event balancing


Items
Option 1
  Game instance is aware if an item exists in the current tile
  Tile messages item to access the item method
  The item method exerts some effect on the Game/Character instance
    In order for item to do this...I think Item needs to have the game_instance injected into it
  Game messages UserInterface which informs the user

Option 2
  Game instance is aware if an item exists in the current tile
  Game uses item type to call a Game method that exerts effect on Game/Character instance
  Game messages UserInterface which informs the user

Option 3
  Game instance is aware if an item exists in the current tile
  Game messages the item to call its relevant method
  The item updates messages Character, which in turn messages Game to update game_instance

OPTION 3

Todo
  Refactor some of the UI methods into game itself, so that a console user could run the game with commands entirely

  inspect wiring between new tile, item and game item detection





Railsify
  - output box
  - input box
  - graphic of monsters with stats when they appear

  OR

  - console rails app
  - old school telnet 