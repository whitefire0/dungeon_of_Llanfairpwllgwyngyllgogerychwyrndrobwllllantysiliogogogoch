class Item
  attr_accessor :item_type, :description, :name

  def initialize
  end

  def self.create
    klass_name = [
      HealthPotion, StrengthPotion, ConstitutionPotion,
      IntelligencePotion, DexterityPotion
    ].sample

    klasses_to_implement = [
      PotionOfLuck,
      TheBloodOfChrist, ScrollOfSpectralSwords,
      PotionOfPrematureDementia, MarbleOfDarkMatter,
      HolyBomb, ScrollOfGimp, ScrollOfLightning, 
      UnidentifiedPotion, ScrollOfTeleport, YouDontKnowJavaScript, 
      RaspberryPi, InvincibilityPotion
    ]

    # *** FOR TESTING ***
    # klass_name = HealthPotion

    klass_name.new
  end

  def apply_to
    #  for overriding in subclasses
    raise NotImplementedError
  end

  def effect_game
    #  for overriding in subclasses
    raise NotImplementedError
  end
  
end

class HealthPotion < Item
  attr_accessor :description, :name, :menu_command, :effect_message

  def initialize
    @name = "health potion"
    @description = "Through an eclectic combination of sorcery and nano-technology, this potion completely restores the players health. Plus it also tastes like Fanta. This is some Gandalf shit for real."
    @menu_command = "hp"
    @effect_message = "Your health was completely restored."
    @game_effect = false
  end

  def apply_to(character)
    character.health += character.base_health
  end
end

class StrengthPotion < Item
  attr_accessor :description, :name, :menu_command, :effect_message

  def initialize
    @name = "strength potion"
    @description = "Constituted from the man milk of Zeus, this potion will reliably increase your strength by a factor of two - for the rest of your existence. Salty."
    @menu_command = "sp"
    @effect_message = "Your strength was permanently multiplied by 2"
    @game_effect = false
  end

  def apply_to(character)
    character.strength *= 2
  end
end

class ConstitutionPotion < Item
  attr_accessor :description, :name, :menu_command, :effect_message

  def initialize
    @name = "constitution potion"
    @description = "This isn't a potion at all, but apparently a vial of what might be pubic hair. Luckily for you, complete consumption will give you twice the constitution you had previously. There isn't a person in the universe who knows why this works, but it does and has a proven track record of turning even dadbods into jacked, tanned and juicy as fuck gym bros. It's international chest day - every day."
    @menu_command = "cp"
    @effect_message = "Your constitution was permanently multiplied by 2"
    @game_effect = false
  end

  def apply_to(character)
    character.constitution *= 2
  end
end

class IntelligencePotion < Item
  attr_accessor :description, :name, :menu_command, :effect_message

  def initialize
    @name = "intelligence potion"
    @description = "Liquified brain of an ancient wizard. High in Omega 3 fatty acids and rumored to be capable of doubling your intelligence. A side effect of such a surge in IQ, is the ability to work out how to telepathic send a message to the Telnet server that creates you another login containing access to the legendary SwagLord. Surveys unsure if those that started these rumours actually drank the potion, but if they did, its more likely to be true. At least that\s what we think and we drank the potion."
    @menu_command = "ip"
    @effect_message = "Your intelligence was permanently multipled by 2"
    @game_effect = false
  end

  def apply_to(character)
    character.constitution *= 2
  end
end

class DexterityPotion < Item
  attr_accessor :description, :name, :menu_command, :effect_message

  def initialize
    @name = "dexterity potion"
    @description = "A dangerous combination of sodium hypochlorite and ammonia. The bottle is partially dissolved, but the label promises that the elixir will permanent destroy most of your cartilige, effectively making you double jointed. This would increase your speed of movement by 2, and limbo championships will be yours for the taking. If you survive. Is there cartilige in the mouth, throat or stomach? You can't remember"
    @menu_command = "dp"
    @effect_message = "Your dexterity was permanently multiplied by 2"
    @game_effect = false
  end

  def apply_to(character)
    character.dexterity *= 2
  end
end

class PotionOfLuck < Item
  attr_accessor :description, :name, :menu_command, :effect_message

  def initialize
    @name = "potion of luck"
    @description = "Dramatically increases your luck for a period of time. The only catch is you need to be lucky enough for it to work."
    @menu_command = ""
    @effect_message = ""
    @game_effect = false
  end

  def apply_to(character)
  end
end

class TheBloodOfChrist < Item
  attr_accessor :description, :name, :menu_command, :effect_message

  def initialize
    @name = "blood of christ"
    @description = "Do you know the Lord and Saviour, Jesus Christ? You will if you can stomach 4 pints of slightly brown looking blood. And then you will terrify anything born of the underworld...even the legendary Balrog..."
    @menu_command = "boc"
    @effect_message = "You have been granted immunity to the Balrog. For one encounter. Oh come on, you didn't think I would make it that easy, did you? Check your unique skills."
    @game_effect = false
  end

  def apply_to(character)
    character.unique_skills.merge({balrog_immunity: 1})
  end
end

class ScrollOfSpectralSwords < Item
  attr_accessor :description, :name, :menu_command, :effect_message

  def initialize
    @name = "scroll of spectral swords"
    @description = "Upon chanting these ancient words, a whirlwind of ghostly swords will spiral around your body, unleashing a severe beating for any thing close by. The terms and conditions and the bottom state that there is a small chance the swords will end up pointing at you. Instructions unclear."
    @menu_command = ""
    @effect_message = ""
    @game_effect = false
  end

  def apply_to(character)
  end
end

class PotionOfPrematureDementia < Item
  attr_accessor :description, :name, :menu_command, :effect_message

  def initialize
    @name = "potion of premature dementia"
    @description = "The wizard who created this potion tested it upon himself, in the process forgetting its actually intended effect. He went on to exhibit strange powers and even stranger behaviour."
    @menu_command = "popd"
    @effect_message = "You suddenly have forgotten every moment of your existence up to this point. Yup - you knew it would be stupid to use it, didn't you. You did it anyway."
    @game_effect = false
  end

  def apply_to(character)
    character.intelligence = 1
  end
end

class MarbleOfDarkMatter < Item
  attr_accessor :description, :name, :menu_command, :effect_message

  def initialize
    @name = "a marble of dark matter"
    @description = "You remember hearing something about this little black ball down the pub. Contained within is the essence of Void itself. If squeezed too hard, it is rumoured to suddenly collapse space time around it, causing anything within this plane of existence to cease existing. If you use this item, your character and any progress you have ever made will be permanently deleted. For your stupidity, your IP address will be banned from ever playing the game again. This is not a joke. Really."
    @menu_command = ""
    @effect_message = ""
    @game_effect = false
  end

  def apply_to(character)
  end
end

class HolyBomb < Item
  attr_accessor :description, :name, :menu_command, :effect_message

  def initialize
    @name = "holy bomb"
    @description = "Unleashes the forces of Heaven in a pleasantly angelic sounding blast of the divine accordian. Depending on the mood of the One True God (David Attenborough), this sound will either smite your enemies into the underworld, or make them invincible."
    @menu_command = ""
    @effect_message = ""
    @game_effect = false
  end

  def apply_to(character)
  end
end

class ScrollOfGimp < Item
  attr_accessor :description, :name, :menu_command, :effect_message

  def initialize
    @name = "scroll of gimp"
    @description = "Turns your enemy into a useless gimp. At least, that's what it looks like the label says. The description ink has partially been dissolved by KY Jelly"
    @menu_command = "sog"
    @effect_message = "You have been transmogrified into a gimp."
    @game_effect = false
  end

  def apply_to(character)
    character = Gimp.create('Spank me')
  end
end

class ScrollOfLightning < Item
  attr_accessor :description, :name, :menu_command, :effect_message

  def initialize
    @name = "scroll of lightning"
    @description = "This doesn't work because you are underground, and you can't make lightning underground. Soz."
    @menu_command = "sol"
    @effect_message = "This doesn't work because you are underground, and you can't make lightning underground. Soz"
    @game_effect = false
  end

  def apply_to(character)
  end
end

class UnidentifiedPotion < Item
  attr_accessor :description, :name, :menu_command, :effect_message

  def initialize
    @name = "unidentified potion"
    @description = "What do you want to know? It's unidentified. You can either drink it, or call Samaritans on 116 123 (UK), 116 123 (ROI)"
    @menu_command = ""
    @effect_message = ""
    @game_effect = false
  end

  def apply_to(character)
  end

  # def effect_game
  #   random = rand(50)
  #   random.times do
  #     self.get_new_tile
  #   end
  #   # have menu update player as to new tile number
  # end
end

class ScrollOfTeleport < Item
  attr_accessor :description, :name, :menu_command, :effect_message

  def initialize
    @name = "scroll of teleport"
    @description = "Summons random quantum forces to move you forwards. Or backwards."
    @menu_command = ""
    @effect_message = ""
    @game_effect = false
  end

  def apply_to(character)
  end
end

class YouDontKnowJavaScript < Item
  attr_accessor :description, :name, :menu_command, :effect_message

  def initialize
    @name = "you don\'t know javascript"
    @description = "A fucking terrible book made only to make the author look cleverer than you. You might not know javascript, but Kyle does. Oh, if you also find the Raspberry Pi lying around here somewhere, you might be able to use this book to hack the Matrix, contact Morpheus and get the fuck out of here. It will take a while though. And you might die if you just sit here. Your call man."
    @menu_command = ""
    @effect_message = ""
    @game_effect = false
  end

  def apply_to(character)
  end
end

class RaspberryPi < Item
  attr_accessor :description, :name, :menu_command, :effect_message

  def initialize
    @name = "raspberry pi"
    @description = "If you overclock your pi and bake it, will it taste delicious? We can't tell you. On the back is a sticker that looks like a red pill."
    @menu_command = ""
    @effect_message = ""
    @game_effect = false
  end

  def apply_to(character)
  end
end

class InvincibilityPotion < Item
  attr_accessor :description, :name, :menu_command, :effect_message

  def initialize
    @name = "invincibility potion"
    @description = "1g of the finest columbian cocaina. Will make you feel totally boss."
    @menu_command = ""
    @effect_message = ""
    @game_effect = false
  end

  def apply_to(character)
  end
end

