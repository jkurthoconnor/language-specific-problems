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
  end

  def choose_name
    puts "Please enter your name."
    name_choice = nil
    loop do
      name_choice = gets.chomp
      break if !name_choice.strip.empty?
      puts "I can't use that as a player name.  Please try again."
    end
    @name = name_choice
  end
end

class Dealer < Participant
  attr_reader :name
  def initialize
    super
    @name = ['R2D2', 'BB8', 'C3PO'].sample
  end

  def stay?
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
   MESSAGE_PAUSE = 1.0
   GAME_WON_AT = 5

  attr_accessor :player, :dealer, :deck

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def clear_screen
    system 'clear' or system 'cls'
  end

  def welcome_sequence
    welcome_message
    player.choose_name
  end

  def deal_cards
    2.times do
      player.hand.unshift(deck.shuffled_cards.shift)
      dealer.hand.unshift(deck.shuffled_cards.shift)
    end
  end

  def show_cards
    clear_screen
    puts "#{player.name}'s hand: "\
         "#{player.hand.map(&:to_s).join(', ')}"
    puts ""
    puts "#{dealer.name}'s hand: "\
         "#{dealer.hand[0]} and #{dealer.hand.size - 1} concealed."
    5.times { puts "\n" }
  end

  def player_turn
    loop do
      return busted_message(player) if player.busted?
      move = move_choice
      return stay_message(player) if move == 'stay'
      hit_message(player)
      hit(player)
      show_cards
    end
  end

  def dealer_turn
    loop do
      return busted_message(dealer) if dealer.busted?
      return stay_message(dealer) if dealer.stay?
      hit_message(dealer)
      hit(dealer)
      show_cards
    end
  end

  def move_choice
    puts "#{player.name}, would you like to 'hit' or 'stay'?"
    move = nil
    loop do
      move = gets.chomp
      break if ['hit', 'stay'].include?(move.downcase)
      puts "#{move} is not an option.  Enter 'hit' or 'stay'."
    end
    move
  end

  def welcome_message
    clear_screen
    puts "Welcome to 21.\n\nYour dealer today is #{dealer.name}."
    puts "The first to win #{GAME_WON_AT} hands wins the game."
    5.times { puts "\n" }
  end

  def hit_message(participant)
    puts "#{participant.name} hits."
    sleep MESSAGE_PAUSE
  end

  def stay_message(participant)
    puts "#{participant.name} stays."
    sleep MESSAGE_PAUSE
  end

  def busted_message(participant)
    puts "#{participant.name} busted!"
  end

  def hit(participant)
    new_card = deck.shuffled_cards.shift
    participant.hand.unshift(new_card)
    
    case participant
    when player
      puts "Your new card is: #{new_card}"
    when dealer
      puts "#{dealer.name} takes one card."
    end

    sleep  MESSAGE_PAUSE
  end

  def hand_result
    return "#{dealer.name} wins; #{player.name} busts." if player.hand_value >
                                                           Scoring::GOAL
    return "#{player.name} wins; #{dealer.name} busts." if dealer.hand_value >
                                                           Scoring::GOAL

    comparison = player.hand_value <=> dealer.hand_value

    case comparison
    when 0 then "Tie."
    when 1 then "#{player.name} wins."
    when -1 then "#{dealer.name} wins."
    end
  end

  def display_score_board
    display_game_score
    display_hand_result
  end

  def display_hand_result #rename to display hands and include cards?
    puts "#{player.name}'s score is #{player.hand_value};"\
         " #{dealer.name}'s score is #{dealer.hand_value}."
    puts "\n#{hand_result}"
  end
  
  def display_game_score
    puts "Here's the score:"
  end

  def play
    welcome_sequence # state terms: i.e. first to 5 wins game
    # loop
    # initial dealing: deal cards; show cards
    deal_cards
    show_cards
    player_turn
    dealer_turn unless player.busted?
    display_score_board # << add revealing dealer's entire hand
  end
end

twenty_one = Game.new
twenty_one.play
