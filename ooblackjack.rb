require 'pry'

# 1) The dealer gives two cards to each player from the deck, one card at a time, alternating players, starting to the left, the first card face down and the second card face up.

# 2) Starting with the player to the left of the dealer, each player chooses to either hit or stay. If the player chooses to hit, the dealer gives the player a face-up card, and the player is given the choice to either hit or stay again, unless the player has a hand value of over 21.

# 3) Players alternate until all players have either chosen to stay or have busted.

class Player
   # - chooses hit or stay
  def initialize(name)
    @name = name
    @hand = []

  end
end

class Computer < Player
end

class Human < Player
end

class Card
 # - face-up or face-down
end

class Deck
 # - gives cards to players
 # - what is a deck?
 #   - 52 cards, 4 suits
 def initialize
  @deck = ["2C", "3C", "4C", "5C", "6C", "7C", "8C", "9C", "10C", "JC", "QC", "KC", "AC", "2H", "3H", "4H", "5H", "6H", "7H", "8H", "9H", "10H", "JH", "QH", "KH", "AH", "2D", "3D", "4D", "5D", "6D", "7D", "8D", "9D", "10D", "JD", "QD", "KD", "AD", "2S", "3S", "4S", "5S", "6S", "7S", "8S", "9S", "10S", "JS", "QS", "KS", "AS"]

  @card_values = {"2C" => 2, "3C" => 3, "4C" => 4, "5C" => 5, "6C" => 6, "7C" => 7, "8C" => 8, "9C" => 9, "10C" => 10, "JC" => 10, "QC" => 10, "KC" => 10, "AC" => 11, "2H" => 2, "3H" => 3, "4H" => 4, "5H" => 5, "6H" => 6, "7H" => 7, "8H" => 8, "9H" => 9, "10H" => 10, "JH" => 10, "QH" => 10, "KH" => 10, "AH" => 11, "2D" => 2, "3D" => 3, "4D" => 4, "5D" => 5, "6D" => 6, "7D" => 7, "8D" => 8, "9D" => 9, "10D" => 10, "JD" => 10, "QD" => 10, "KD" => 10, "AD" => 11, "2S" => 2, "3S" => 3, "4S" => 4, "5S" => 5, "6S" => 6, "7S" => 7, "8S" => 8, "9S" => 9, "10S" => 10, "JS" => 10, "QS" => 10, "KS" => 10, "AS" => 11}
  end



end


class Game
  def initialize
    @deck = Deck.new
    @computer = Computer.new('R2D2')
    @human = Human.new('Bob')
  end

  def play
    # - some play order
  end

end

game = Game.new