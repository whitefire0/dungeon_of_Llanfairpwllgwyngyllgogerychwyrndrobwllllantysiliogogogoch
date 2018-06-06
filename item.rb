class Item
  def initialize
    @item_type = [
      'health potion', 'strength potion', 'constituition potion',
      'intelligence potion', 'dexterity potion', 'potion of luck',
      'the blood of christ', 'scroll of spectral swords',
      'potion of premature dementia', 'a marble of dark matter',
      'holy bomb', 'scroll of gimp', 'scroll of lightning', 
      'unidentified potion', 'scroll of teleport', 'you dont know javascript', 'invincibility potion'
    ].sample
  end

  def store_item_description
    case @item type
    when 'health potion'
      @item_description = "Through an eclectic combination of sorcery and nano-technology, this potion completely restores the players health. Plus it also takes like Fanta. This is some Gandalf shit for real."
    when 'strength potion'
      @item_description = "Constituted from the man milk of Zeus, this potion will reliably increase your strength by a factor of two - for the rest of your existence. Salty."
    when 'constitution potion'
      @item_description = "This is a potion at all, but apparently a vial of what might be pubic hair. Luckily for you, complete consumption will give you twice the constitution you had previously. There isn't a person in the universe who knows why this works, but it does and has a proven track record of turning even dadbods into jacked, tanned and juicy as fuck gym bros. It's international chest day - every day."
    when 'intelligence potion'
      @item_description = "Liquified brain of an ancient wizard. High in Omega 3 fatty acids and rumored to be capable of doubling your intelligence. A side effect of such a surge in IQ, is the ability to work out how to telepathic send a message to the Telnet server that creates you another login containing access to the legendary SwagLord. Surveys unsure if those that started these rumours actually drank the potion, but if they did, its more likely to be true. At least that\s what we think and we drank the potion."
    when 'dexterity potion'
      @item_description = "A dangerous combination of sodium hydrochloride and potassium sulfate. The bottle is partially dissolved, but the label promises that the elixir will permanent destroy most of your cartilige, effectively making you double jointed. This would increase your speed of movement by 2, and limbo championships will be yours for the taking. If you survive. Is there cartilige in the mouth, throat or stomach? You can't remember."
    when 'potion of luck'
      @item_description = "Dramatically increases your luck for a period of time. The only catch is you need to be lucky for it to work."
    when 'the blood of christ'
      @item_description = "Do you know the Lord and Saviour, Jesus Christ? You will if you can stomach 4 pints of slightly brown looking blood. And then you will terrify anything born of the underworld...even the legendary Balrog..."
    when 'scroll of spectral swords'
      @item_description = "Upon chanting these ancient words, a whirlwind of ghostly swords will spiral around your body, unleashing a severe beating for any thing close by. The terms and conditions and the bottom state that there is a small chance the swords will end up pointing at you. Instructions unclear."
    when 'potion of premature dementia'
      @item_description = "The wizard who created this potion tested it upon himself, in the process forgetting its actually intended effect. He went on to exhibit strange powers and even stranger behaviour."
    when 'a marble of dark matter'
      @item_description = "You remember hearing something about this little black ball down the pub. Contained within is the essence of Void itself. If squeezed too hard, it is rumoured to suddenly collapse space time around it, causing anything within this plane of existence to cease existing. If you use this item, your character and any progress you have ever made will be permanently deleted. For your stupidity, your IP address will be banned from ever playing the game again. We are really not joking about this."
    when 'holy bomb'
      @item_description = "Unleashes the forces of Heaven in a pleasantly angelic sounding blast of the divine accordian. Depending on the mood of the One True God (David Attenborough), this sound will either smite your enemies into the underworld, or make them invincible."    
    when 'scroll of gimp'
      @item_description = "Turns your enemy into a useless gimp. At least, that's what it looks like the label says. The description ink has partially been dissolved by KY Jelly"
    when 'scroll of lightning'
      @item_description = "This doesn't work because you are underground, and you can't make lightning underground. Soz."
    when 'unidentified potion'
      @item_description = "What do you want to know? It's unidentified. You can either drink it, or call Samaritans on 116 123 (UK), 116 123 (ROI)"
    when 'scroll of teleport'
      @item_description = "Summons random quantum forces to move you forwards. Or backwards."
    when 'you don\'t know javascript'
      @item_description = "A fucking terrible book made only to make the author look cleverer than you. You might not know javascript, but Kyle does. Oh, if you also find the Raspberry Pi lying around here somewhere, you might be able to use this book to hack the Matrix, contact Morpheus and get the fuck out of here. It will take a while though. And you might die if you just sit here. Your call man."
    when 'raspberry pi'
      @item_description = "If you overclock your pi and bake it, will it taste delicious? We can't tell you. On the back is a sticker that looks like a red pill."
    end
  end

  def determine_unknown_potion_effect

  end
end