
class Participant
  attr_accessor :hand, :name
  
  def initialize
    @hand 
    @name = set_name
  end

  def hit
  end
  
  def stay
  end
end

class Player < Participant
  def initialize
    # what states uniquely apply to player? total? ...well each will have a card total, but that could be handled by Participant
  end

  def busted?
  end
  
  def total
    # related to cards
  end
end

class Dealer < Participant
  def initialize
    # what states apply to being a dealer?
  end


  def busted?
  end

  def total
    # related to cards
  end
  
  # def deal (?)
  # end
end

class Deck
  attr_reader :cards

  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::VALUES.each do |value|
        @cards.push Card.new(value, suit)
      end
    end
  end
end

class Card
  attr_reader :value, :suit

  VALUES = ["2", "3", "4", "5", "6", "7", "8", "9", "10"] +
           ["Jack", "Queen", "King", "Ace"]
  SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
  
  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def to_s
    "#{value} of #{suit}"
  end
end

class Game
  attr_accessor :player, :dealer, :deck

  def initialize
    # @player = Player.new
    # @dealer = Dealer.new
    @deck = Deck.new
  end

  def play
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end
end

twenty_one = Game.new
p twenty_one.deck
puts twenty_one.deck

p twenty_one.deck.cards
puts twenty_one.deck.cards
