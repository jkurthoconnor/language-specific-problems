require 'pry'

DECK = { '2 of S' => 2, '3 of S' => 3, '4 of S' => 4, '5 of S' => 5, '6 of S' => 6, '7 of S' => 7, '8 of S' => 8, '9 of S' => 9, '10 of S' => 10, 'Jack of S' => 10, 'Queen of S' => 10, 'King of S' => 10, 'Ace of S' => 11, '2 of Diamonds' => 2, '3 of Diamonds' => 3, '4 of Diamonds' => 4, '5 of Diamonds' => 5, '6 of Diamonds' => 6, '7 of Diamonds' => 7, '8 of Diamonds' => 8, '9 of Diamonds' => 9, '10 of Diamonds' => 10, 'Jack of Diamonds' => 10, 'Queen of Diamonds' => 10, 'King of Diamonds' => 10, 'Ace of Diamonds' => 11, '2 of Spades' => 2, '3 of Spades' => 3, '4 of Spades' => 4, '5 of Spades' => 5, '6 of Spades' => 6, '7 of Spades' => 7, '8 of Spades' => 8, '9 of Spades' => 9, '10 of Spades' => 10, 'Jack of Spades' => 10, 'Queen of Spades' => 10, 'King of Spades' => 10, 'Ace of Spades' => 11, '2 of Clubs' => 2, '3 of Clubs' => 3, '4 of Clubs' => 4, '5 of Clubs' => 5, '6 of Clubs' => 6, '7 of Clubs' => 7, '8 of Clubs' => 8, '9 of Clubs' => 9, '10 of Clubs' => 10, 'Jack of Clubs' => 10, 'Queen of Clubs' => 10, 'King of Clubs' => 10, 'Ace of Clubs' => 11 }
#
GOAL = 21
DEALER_HOLD_POINT = 17
scores = {dealer: 1}
# current_hands = { dealer: [['King of S', 1, 'Ace of S' => 11,], player: [] }
current_hands_totals = { dealer: 0, player: 0 }
hearts = []
diamonds = []
clubs = []
spades = []
cards = [ ['2 of ', 2], ['3 of ', 3], ['4 of ', 4] ]
suits = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
deck = []

# suits.each do |s|
#   deck.push cards.each { |arr| arr[0].insert(-1, s) }
#   binding.pry
# end

cards.each do |arr|
  hearts.push arr[0].insert(-1, 'Hearts')
  diamonds.push arr[0].insert(-1, 'Diamonds')

end

p deck
p hearts
p diamonds
p clubs
p spades
