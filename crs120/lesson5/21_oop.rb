module Scoring
  GOAL = 21

  def hand_value
    points = 0
    aces = 0

    points += evaluate_face_cards[:points]
    aces += evaluate_face_cards[:aces]
    points += evaluate_numbered_cards

    if aces.positive? && points > GOAL
      points = ace_score_adjustment(aces, points)
    end

    points
  end

  def evaluate_face_cards
    values = { points: 0, aces: 0 }

    hand.each do |card|
      values[:points] += 10 if ["Jack", "Queen", "King"].include?(card.value)
      if card.value == "Ace"
        values[:points] += 11
        values[:aces] += 1
      end
    end

    values
  end

  # rubocop: disable Performance/RangeInclude
  def evaluate_numbered_cards
    points = 0

    hand.each do |card|
      points += card.value.to_i if ('2'..'10').include?(card.value)
    end

    points
  end
  # rubocop: enable Performance/RangeInclude

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
  attr_accessor :hand

  def initialize
    @hand = []
  end
end

class Player < Participant
  attr_reader :name

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
    @new_deck.shuffle
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

  attr_accessor :player, :dealer, :deck, :score

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
    @score = { p: 0, d: 0 }
  end

  def reset_hand
    @deck = Deck.new
    player.hand = []
    dealer.hand = []
  end

  # rubocop: disable Style/AndOr
  def clear_screen
    system 'clear' or system 'cls'
  end
  # rubocop: enable Style/AndOr

  def welcome_sequence
    clear_screen
    welcome_message
    player.choose_name
  end

  def welcome_message
    puts "Welcome to 21.\n\nYour dealer today is #{dealer.name}."
    puts "\nThe first to win #{GAME_WON_AT} hands wins the game."
    5.times { puts "\n" }
  end

  def dealing_sequence
    clear_screen
    display_dealing_message
    deal_cards
  end

  def display_dealing_message
    puts "\n#{dealer.name} just opened a new deck."
    puts "\nShuffling"
    puts ""
    3.times do
      '_\|/_\|/_\|/_'.chars.each do |char|
        sleep 0.03
        print char
      end
    end

    puts ""
    puts "\nDone. Let's play!"
    sleep MESSAGE_PAUSE
  end

  def deal_cards
    2.times do
      player.hand.unshift(deck.shuffled_cards.shift)
      dealer.hand.unshift(deck.shuffled_cards.shift)
    end
  end

  def display_cards_during_hand
    display_player_cards
    display_dealer_cards_during_hand
  end

  def display_cards_after_hand
    display_player_cards
    display_dealer_cards_after_hand
  end

  def display_player_cards
    puts "\n#{player.name}'s hand: "\
       "#{player.hand.map(&:to_s).join(', ')}"
  end

  def display_dealer_cards_during_hand
    puts "\n#{dealer.name}'s hand: "\
         "#{dealer.hand[0]} and #{dealer.hand.size - 1} concealed."
  end

  def display_dealer_cards_after_hand
    puts "\n#{dealer.name}'s hand: "\
       "#{dealer.hand.map(&:to_s).join(', ')}"
  end

  def players_turn
    loop do
      display_scoreboard_during_hand
      move = move_choice
      return stay_message(player) if move == 'stay'
      hit_message(player)
      hit(player)
      return busted_message(player) if player.busted?
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

  def hit_message(participant)
    puts "\n#{participant.name} hits."
    sleep MESSAGE_PAUSE / 2
  end

  def stay_message(participant)
    puts "\n#{participant.name} stays."
    sleep MESSAGE_PAUSE
  end

  def busted_message(participant)
    puts "\n#{participant.name} busted!"
    sleep MESSAGE_PAUSE
  end

  def hit(participant)
    new_card = deck.shuffled_cards.shift
    participant.hand.unshift(new_card)

    case participant
    when player
      puts "The new card is: #{new_card}"
    when dealer
      puts "#{dealer.name} takes a card."
    end

    sleep MESSAGE_PAUSE
  end

  def dealers_turn
    loop do
      display_scoreboard_during_hand
      return stay_message(dealer) if dealer.stay?
      hit_message(dealer)
      hit(dealer)
      return busted_message(dealer) if dealer.busted?
    end
  end

  def results
    display_scoreboard_with_result
    increment_score
  end

  # rubocop:disable Metrics/AbcSize
  def hand_result
    return "#{dealer.name} wins." if player.hand_value > Scoring::GOAL
    return "#{player.name} wins." if dealer.hand_value > Scoring::GOAL
    return "#{player.name} wins." if player.hand_value > dealer.hand_value
    return "#{dealer.name} wins." if player.hand_value < dealer.hand_value
    return "It's a tie." if player.hand_value == dealer.hand_value
  end
  # rubocop:enable Metrics/AbcSize

  def display_scoreboard_during_hand
    clear_screen
    display_game_score
    display_cards_during_hand
    5.times { puts "\n" }
  end

  def display_scoreboard_with_result
    clear_screen
    display_game_score
    display_cards_after_hand
    display_hand_result
    5.times { puts "\n" }
  end

  def display_hand_result
    puts "\nHand values: #{player.name}: #{player.hand_value} |||"\
         " #{dealer.name}: #{dealer.hand_value}."
    puts "\n#{hand_result}"
  end

  def increment_score
    case hand_result
    when "#{dealer.name} wins."
      score[:d] += 1
    when "#{player.name} wins."
      score[:p] += 1
    end
  end

  def quit?
    puts "Type 'y' to play the next hand. Any other key will end the game."
    choice = gets.chomp
    choice.casecmp('y').nonzero?
  end

  def display_game_score
    puts "\nGames won: #{player.name}: #{score[:p]} |||"\
         " #{dealer.name}: #{score[:d]}"
  end

  def someone_won_game?
    score[:p] == GAME_WON_AT || score[:d] == GAME_WON_AT
  end

  def closing_sequence
    clear_screen
    display_game_result
    display_goodbye_message
  end

  def display_game_result
    display_game_score
    puts "\n#{game_result}"
  end

  def game_result
    if score[:p] == GAME_WON_AT
      "Congratulations #{player.name}. You won!"
    else
      "I'm sorry.  #{dealer.name} beat you."
    end
  end

  def display_goodbye_message
    puts "\nThanks for playing. Goodbye!"
  end

  def play
    welcome_sequence
    loop do
      dealing_sequence
      players_turn
      dealers_turn unless player.busted?
      results
      break if someone_won_game?
      break if quit?
      reset_hand
    end
    closing_sequence
  end
end

twenty_one = Game.new
twenty_one.play
