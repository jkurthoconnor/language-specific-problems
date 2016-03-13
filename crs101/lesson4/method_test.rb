require 'pry'

DECK = { '2 of S' => 2, '3 of S' => 3, '4 of S' => 4, '5 of S' => 5, '6 of S' => 6, '7 of S' => 7, '8 of S' => 8, '9 of S' => 9, '10 of S' => 10, 'Jack of S' => 10, 'Queen of S' => 10, 'King of S' => 10, 'Ace of S' => 11, '2 of Diamonds' => 2, '3 of Diamonds' => 3, '4 of Diamonds' => 4, '5 of Diamonds' => 5, '6 of Diamonds' => 6, '7 of Diamonds' => 7, '8 of Diamonds' => 8, '9 of Diamonds' => 9, '10 of Diamonds' => 10, 'Jack of Diamonds' => 10, 'Queen of Diamonds' => 10, 'King of Diamonds' => 10, 'Ace of Diamonds' => 11, '2 of Spades' => 2, '3 of Spades' => 3, '4 of Spades' => 4, '5 of Spades' => 5, '6 of Spades' => 6, '7 of Spades' => 7, '8 of Spades' => 8, '9 of Spades' => 9, '10 of Spades' => 10, 'Jack of Spades' => 10, 'Queen of Spades' => 10, 'King of Spades' => 10, 'Ace of Spades' => 11, '2 of Clubs' => 2, '3 of Clubs' => 3, '4 of Clubs' => 4, '5 of Clubs' => 5, '6 of Clubs' => 6, '7 of Clubs' => 7, '8 of Clubs' => 8, '9 of Clubs' => 9, '10 of Clubs' => 10, 'Jack of Clubs' => 10, 'Queen of Clubs' => 10, 'King of Clubs' => 10, 'Ace of Clubs' => 11 }
#
def shuffle_new_deck(source)
  deck = source.to_a
  deck.shuffle
end

# current_hands = { dealer: [], player: [] }
# deck_in_play = shuffle_new_deck(DECK)
# deal_hands(deck_in_play, current_hands)
# p current_hands

loop do
  puts "Would you like to hit or stay?"
  response = gets.chomp
  break if response.casecmp('stay') == 0
end
