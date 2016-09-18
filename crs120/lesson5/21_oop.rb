require 'pry'

class Participant
  attr_accessor :hand, :name

  def initialize
    @hand = []
    # @name = value passed in from 'children'
  end

  def hit
  end

  def stay
  end
end

class Player < Participant
  attr_reader :name

  def initialize
    super
    @name = choose_name
  end

  def choose_name
    puts "Please enter your name."
    name_choice = nil
    loop do
      name_choice = gets.chomp
      break if !name_choice.strip.empty?
      puts "I can't use that as a player name.  Please try again."
    end
    name_choice
  end

  def busted?
  end

  def total
    # related to cards
  end
end

class Dealer < Participant
  def initialize
    super
    # what states apply to being a dealer?
  end

  def busted?
  end

  def total
    # related to cards
  end

end

class Deck
  attr_reader :shuffled_cards

  def initialize
    @new_deck = []
    Card::SUITS.each do |suit|
      Card::VALUES.each do |value|
        @new_deck.push Card.new(value, suit)
      end
    end
    @shuffled_cards = shuffle
  end

  def shuffle
    @new_deck.shuffle!
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
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def deal_cards
    2.times do 
      player.hand.unshift(deck.shuffled_cards.shift)
      dealer.hand.unshift(deck.shuffled_cards.shift)
    end
  end

  def show_initial_cards
    player.hand.each do |card|
      puts "#{player.name} is holding #{card}"
    end

    puts "Dealer is holding #{dealer.hand[0]} and one concealed card."
  end

  def play
    deal_cards
    show_initial_cards
    p player.name
    # player_turn
    # dealer_turn
    # show_result
  end
end

twenty_one = Game.new

twenty_one.play
