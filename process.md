
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