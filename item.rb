class Item
  def initialize
    @item_type = [
      'health_potion', 'strength_potion', 'holy_bomb',
      'scroll_of_gimp', 'scroll_of_lightning', 'unidentified_potion',
      'scroll_of_teleport', 'you_dont_know_javascript'
    ].sample
  end

  def store_item_description

  end

  def determine_unknown_potion_effect

  end
end