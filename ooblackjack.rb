require 'pry'

# 1) The dealer gives two cards to each player from the deck, one card at a time, alternating players, starting to the left, the first card face down and the second card face up.

# 2) Starting with the player to the left of the dealer, each player chooses to either hit or stay. If the player chooses to hit, the dealer gives the player a face-up card, and the player is given the choice to either hit or stay again, unless the player has a hand value of over 21.

# 3) Players alternate until all players have either chosen to stay or have busted.

class Player
  attr_accessor :hand, :name
   # - chooses hit or stay
  def initialize(name)
    @card_values = {"2C" => 2, "3C" => 3, "4C" => 4, "5C" => 5, "6C" => 6, "7C" => 7, "8C" => 8, "9C" => 9, "10C" => 10, "JC" => 10, "QC" => 10, "KC" => 10, "AC" => 11, "2H" => 2, "3H" => 3, "4H" => 4, "5H" => 5, "6H" => 6, "7H" => 7, "8H" => 8, "9H" => 9, "10H" => 10, "JH" => 10, "QH" => 10, "KH" => 10, "AH" => 11, "2D" => 2, "3D" => 3, "4D" => 4, "5D" => 5, "6D" => 6, "7D" => 7, "8D" => 8, "9D" => 9, "10D" => 10, "JD" => 10, "QD" => 10, "KD" => 10, "AD" => 11, "2S" => 2, "3S" => 3, "4S" => 4, "5S" => 5, "6S" => 6, "7S" => 7, "8S" => 8, "9S" => 9, "10S" => 10, "JS" => 10, "QS" => 10, "KS" => 10, "AS" => 11}
    @name = name
    @hand = []
    puts @hand
  end

  def hand_value
    sum = 0
    hand.each {|x| sum+=@card_values["#{x}"]}
    return sum
    #for each item in the player's hand (hand.each do), we want to get the value of that key in @card_values and add them to a total
  end

end

class Computer < Player
  # - chooses to hit when hand value is under 16
  # - chooses to stay when hand value is over 16
end

class Human < Player
  # - prompted to choose to either hit or stay
end

class Card
 # - face-up or face-down
end

class Deck
  attr_accessor :cards, :card_values
 # - gives cards to players
 # - what is a deck?
 #   - 52 cards, 4 suits
 def initialize
 # instead of having @cards AND @card_values, should just use one hash with both the card names and values and use select to create an array with the names.

 # @cards = ["2C", "3C", "4C", "5C", "6C", "7C", "8C", "9C", "10C", "JC", "QC", "KC", "AC", "2H", "3H", "4H", "5H", "6H", "7H", "8H", "9H", "10H", "JH", "QH", "KH", "AH", "2D", "3D", "4D", "5D", "6D", "7D", "8D", "9D", "10D", "JD", "QD", "KD", "AD", "2S", "3S", "4S", "5S", "6S", "7S", "8S", "9S", "10S", "JS", "QS", "KS", "AS"].shuffle

  @card_values = {"2C" => 2, "3C" => 3, "4C" => 4, "5C" => 5, "6C" => 6, "7C" => 7, "8C" => 8, "9C" => 9, "10C" => 10, "JC" => 10, "QC" => 10, "KC" => 10, "AC" => 11, "2H" => 2, "3H" => 3, "4H" => 4, "5H" => 5, "6H" => 6, "7H" => 7, "8H" => 8, "9H" => 9, "10H" => 10, "JH" => 10, "QH" => 10, "KH" => 10, "AH" => 11, "2D" => 2, "3D" => 3, "4D" => 4, "5D" => 5, "6D" => 6, "7D" => 7, "8D" => 8, "9D" => 9, "10D" => 10, "JD" => 10, "QD" => 10, "KD" => 10, "AD" => 11, "2S" => 2, "3S" => 3, "4S" => 4, "5S" => 5, "6S" => 6, "7S" => 7, "8S" => 8, "9S" => 9, "10S" => 10, "JS" => 10, "QS" => 10, "KS" => 10, "AS" => 11}

  @cards = @card_values.keys.shuffle
  end

  def deal_card(player)
    2.times {player.hand << @cards.pop}
    puts "#{player.name} now has a hand of #{player.hand}."
    puts "#{player.name} now has a hand VALUE of #{player.hand_value}"
  end

end


class Game
  def initialize
    @deck = Deck.new
    @computer = Computer.new('R2D2')
    @human = Human.new('Bob')
  end

  def deal_two_cards
    @deck.deal_card(@human)
    @deck.deal_card(@computer)
  end

  def play
    deal_two_cards
    # - some play order
  end

end

game = Game.new.play