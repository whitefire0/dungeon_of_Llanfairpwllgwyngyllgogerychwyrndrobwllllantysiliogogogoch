
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



git ls-files | xargs cat | wc -l


For Dan:
  really not a fan of nested if/else/unless statements. Is this a code smell if they are only 2 layers deep?

  UserInterface and Game are TIGHTLY woven together (they contain a reference to the instance of each other and call upon it to access state data the other contains). Is this this a bad thing in this use case?

Testing root_controller actions




Railsify
  - output box
  - input box
  - graphic of monsters with stats when they appear