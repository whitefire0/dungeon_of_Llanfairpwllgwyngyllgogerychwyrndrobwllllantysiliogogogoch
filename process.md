
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

on completion, generate a simulator that runs the game automatically and compiles stats on wins/losses to check for character/enemy/event balancing



git ls-files | xargs cat | wc -l


For Dan:
  really not a fan of nested if/else/unless statements. Is this a code smell if they are only 2 layers deep?

  UserInterface and Game are TIGHTLY woven together (they contain a reference to the instance of each other and call upon it to access state data the other contains). Is this this a bad thing in this use case?

Refactoring
  getting Character to have smaller methods that return values and use those as the messages back to the Game, which in turn messages UserInterface

Testing root_controller actions

  case 1
    w, encounter enemy
    a, attack enemy, enemy dies
    w, encounter enemy
    a, !menu asks for input again!
    a, attack enemy, enemy dies
    w, encounter enemy
    a, !menu asks for input again!
    a, attacks enemy, enemy dies

    w, encounter enemy
    a, attack enemy, enemy dies
    w, !menu asks for input again!
    w, 'you can't do that right now'
    a, attack enemy, enemy dies
    w, encounter enemy

    BUG: after an enemy dies, the menu asks for action. it doesn't respond correctly to the first input, but does to the second. Provided it accepts an action, the next one works (ie resting)






Railsify
  - output box
  - input box
  - graphic of monsters with stats when they appear