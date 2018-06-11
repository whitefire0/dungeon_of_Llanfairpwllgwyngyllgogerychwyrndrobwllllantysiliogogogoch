class ScoringSystem
  attr_accessor :player_name, :player_char, :score, :enemies_defeated, :damage_dealt, :damage_taken, :items_used

  def initalize(game_instance)
    @game_instance = game_instance
    @player_name = game_instance.player_name
    @player_char = game_instance.player_char
    @score = 0
    @enemies_defeated = 0
    @damage_dealt = 0
    @damage_taken = 0
    @items_used = 0
  end

  def score_battle(defeated_enemy, turns_taken)
    # enemy health divided by turns taken
    score += (defeated_enemy.base_health * 10) / turns_taken
    enemies_defeated += 1
  end

  def took_damage(damage)
    @damage_taken += damage
  end

  def dealt_damage(damage)
    @damage_dealt += damage
  end

  def used_item
    items_used += 1
  end

  def 

  def score_tiles(tiles)
    score += tiles * 50
  end

  def final_score
    score -= (items_used * 100)
  end

  def create_report
    report = {
      name: player_name,
      class: player_char.class,
      char_stats: player_char
      score: score,
      enemies_defeated: enemies_defeated,
      damage_dealt: damage_dealt,
      damage_taken: damage_taken,
      items_used: items_used
    }
  end
end