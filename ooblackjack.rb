require 'pry'

# how could this be done programmatically?
@@card_values = {"2C" => 2, "3C" => 3, "4C" => 4, "5C" => 5, "6C" => 6, "7C" => 7, "8C" => 8, "9C" => 9, "10C" => 10, "JC" => 10, "QC" => 10, "KC" => 10, "AC" => 11, "2H" => 2, "3H" => 3, "4H" => 4, "5H" => 5, "6H" => 6, "7H" => 7, "8H" => 8, "9H" => 9, "10H" => 10, "JH" => 10, "QH" => 10, "KH" => 10, "AH" => 11, "2D" => 2, "3D" => 3, "4D" => 4, "5D" => 5, "6D" => 6, "7D" => 7, "8D" => 8, "9D" => 9, "10D" => 10, "JD" => 10, "QD" => 10, "KD" => 10, "AD" => 11, "2S" => 2, "3S" => 3, "4S" => 4, "5S" => 5, "6S" => 6, "7S" => 7, "8S" => 8, "9S" => 9, "10S" => 10, "JS" => 10, "QS" => 10, "KS" => 10, "AS" => 11}

@@aces = ["AS", "AC", "AH", "AD"]

# 1) The dealer gives two cards to each player from the deck, one card at a time, alternating players, starting to the left, the first card face down and the second card face up.

# 2) Starting with the player to the left of the dealer, each player chooses to either hit or stay. If the player chooses to hit, the dealer gives the player a face-up card, and the player is given the choice to either hit or stay again, unless the player has a hand value of over 21.

# 3) Players alternate until all players have either chosen to stay or have busted.

class Player
  attr_accessor :hand, :name
   # - chooses hit or stay
  def initialize(name)
    @name = name
    @hand = []
  end

  def has_aces?

  end

  def hand_value
    sum = 0
    hand.each {|x| sum+=@@card_values[x]}
    # for aces equalling either 1 or 11
    # if sum > 21 && hand.include? (any ace card)
    # then subtract 10
    # but should also include functionality to allow for making multiple aces 1s instead of 11s
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

  @cards = @@card_values.keys.shuffle
end

  def deal_card(player)
    player.hand << @cards.pop
    puts "#{player.name} was dealt a card!"
    #puts "#{player.name} has a current hand of #{player.hand.drop(1).each do |a| puts a end} (one card hidden)"
  end

end


class Game
  @@computer_stay = 0
  @@human_stay = 0
  def initialize
    print "Your name? >"
    human_name = gets.chomp.split.map(&:capitalize).join(' ')
    @deck = Deck.new
    @computer = Computer.new('R2D2')
    @human = Human.new(human_name)
  end

  def alternate_player
    if @current_player == @human
      @current_player = @computer
    else
      @current_player = @human
    end
  end

  def hit_or_stay(human, computer)
    choices = [1, 2]
    puts "#{human.name} has a hand of #{human.hand}. Value: #{human.hand_value}."
    puts "#{computer.name} has a hand of #{computer.hand.drop(1)} (one card face-down). Value: HIDDEN."
    begin
    print 'Hit(1) or stay(2)? >>'
    choice = gets.chomp.to_i
  end until choices.include?(choice)
    if choice == 1
      system 'cls'
      puts "You chose to hit!"
      @deck.deal_card(@human)
    else
      system 'cls'
      puts "You stay."
      @@human_stay += 1
    end
  end

  def computer_hit_or_stay
    if @computer.hand_value < 16
      puts "#{@computer.name} hits!"
      @deck.deal_card(@computer)
    else
      puts "The computer stays."
      @@computer_stay += 1
    end
  end

  def both_players_stay?
    if @@computer_stay >= 1 && @@human_stay >=1
      true
    else
      false
    end
  end

  def deck_empty?
    false
  end

  def current_player_hit_or_stay
    if @current_player == @human
      hit_or_stay(@human, @computer)
      # give a prompt to hit or stay
      # add a card from the deck to the player hand
      # OR
      # pass to alternate_player
    else # @current_player is @computer
      computer_hit_or_stay

      # add a card from the deck to computer hand IF the computer's hand value is under 16
    end
  end

  def deal_two_cards
    2.times {@deck.deal_card(@human)
    @deck.deal_card(@computer)}
  end

  def player_bust?
    if @current_player.hand_value > 21
      true
    #elsif  #@current_player.hand_value > 21 && #player has aces
      # then subtract 10 for each ace until hand_value is under 21
      
    else
      false
    end
  end

  def win_evaluation
    if @human.hand_value > @computer.hand_value
      puts '#{@human.name} wins!'
    elsif @computer.hand_value < @human.hand_value
      puts '#{@computer.name} wins!'
    else
      puts 'It was a tie!'
    end
  end

  def play
    system 'cls'
    @current_player = @human
    deal_two_cards
    # player_bust? evaluation should be done before both_players_stay evaluation because we're going to use a greater than evaluation if both players stay.
    loop do
    current_player_hit_or_stay
    if both_players_stay?
      win_evaluation
      break
    elsif deck_empty?
      puts 'The deck is empty!'
      break
    elsif player_bust?
      puts "#{@current_player.name} busted!"
      alternate_player
      puts "#{@current_player.name} wins!"
      break
    else
      alternate_player
    end
  end
    # - some play order
    # then some play_again prompt
  end

end

game = Game.new.play