require 'pry'

module Scoring
  GOAL = 21

  def hand_value
    points = 0
    aces = 0

    hand.each do |card|
      if ('2'..'10').include?(card.value)
        points += card.value.to_i
      elsif ["Jack", "Queen", "King"].include?(card.value)
        points += 10
      else
        points += 11
        aces += 1
      end
    end

    if aces.positive? && points > GOAL
      points = ace_score_adjustment(aces, points)
    end

    points
  end

  def ace_score_adjustment(aces, points)
    aces.times do
      points -= 10
      break if points <= GOAL
    end
    points
  end

  def busted?
    hand_value > GOAL
  end
end

class Participant
  include Scoring

  attr_accessor :hand, :name

  def initialize
    @hand = []
    # @name = value passed in from 'children'
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
end

class Dealer < Participant
  attr_reader :name
  def initialize
    super
    @name = ['R2D2', 'BB8', 'C3PO'].sample
  end

  def hold?
    hand_value >= 17
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
  SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades'].freeze

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

  def show_cards
    puts "#{player.name} is holding: "\
         "#{player.hand.map(&:to_s).join(', ')}"

    puts "#{dealer.name} is holding: "\
         "#{dealer.hand[0]} and #{dealer.hand.size - 1} concealed card(s)."
    puts "\n\n"
  end

  def player_turn
    loop do
      move = move_choice
      break unless move == 'hit'
      hit(player)
      show_cards
      break unless !player.busted?
    end
  end

  def dealer_turn
    loop do
      break if dealer.hold? || dealer.busted?
      hit(dealer)
    end
    show_cards
  end

  def move_choice
    puts "Would you like to 'hit' or 'stay'?"
    move = nil
    loop do
      move = gets.chomp
      break if ['hit', 'stay'].include?(move.downcase)
      puts "#{move} is not an option.  Enter 'hit' or 'stay'."
    end
    move
  end

  def hit(participant)
    new_card = deck.shuffled_cards.shift
    participant.hand.unshift(new_card)
    puts "The new card is: #{new_card}"
  end

  def hand_result
    return "Both bust!" if player.hand_value > Scoring::GOAL &&
            dealer.hand_value > Scoring::GOAL
            
    comparison = player.hand_value <=> dealer.hand_value

    case comparison
    when 0 then 'Tie.'
    when 1
      if player.hand_value <= Scoring::GOAL
        'Player wins.'
      else
        'Dealer wins; player busts.'
      end
    when -1
      if dealer.hand_value <= Scoring::GOAL
        'Dealer wins.'
      else
        'Player wins; dealer busts.'
      end
    end
  end

  def show_hand_result
    puts "#{player.name}'s score is #{player.hand_value};"\
         " #{dealer.name}'s score is #{dealer.hand_value}."
    puts "\n#{hand_result}"
  end

  def play
    # welcome sequence
      # welcome message
      # player pick name
      # anounce dealer/ opponent
      # state terms: i.e. first to 5 wins game
    # initial dealing
      # deal cards
      # show cards
    deal_cards
    show_cards
    player_turn
    dealer_turn
    show_hand_result
  end
end

twenty_one = Game.new
twenty_one.play
