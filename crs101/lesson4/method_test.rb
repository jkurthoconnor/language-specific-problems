require 'pry'

DECK = { '2 of S' => 2, '3 of S' => 3, '4 of S' => 4, '5 of S' => 5, '6 of S' => 6, '7 of S' => 7, '8 of S' => 8, '9 of S' => 9, '10 of S' => 10, 'Jack of S' => 10, 'Queen of S' => 10, 'King of S' => 10, 'Ace of S' => 11, '2 of Diamonds' => 2, '3 of Diamonds' => 3, '4 of Diamonds' => 4, '5 of Diamonds' => 5, '6 of Diamonds' => 6, '7 of Diamonds' => 7, '8 of Diamonds' => 8, '9 of Diamonds' => 9, '10 of Diamonds' => 10, 'Jack of Diamonds' => 10, 'Queen of Diamonds' => 10, 'King of Diamonds' => 10, 'Ace of Diamonds' => 11, '2 of Spades' => 2, '3 of Spades' => 3, '4 of Spades' => 4, '5 of Spades' => 5, '6 of Spades' => 6, '7 of Spades' => 7, '8 of Spades' => 8, '9 of Spades' => 9, '10 of Spades' => 10, 'Jack of Spades' => 10, 'Queen of Spades' => 10, 'King of Spades' => 10, 'Ace of Spades' => 11, '2 of Clubs' => 2, '3 of Clubs' => 3, '4 of Clubs' => 4, '5 of Clubs' => 5, '6 of Clubs' => 6, '7 of Clubs' => 7, '8 of Clubs' => 8, '9 of Clubs' => 9, '10 of Clubs' => 10, 'Jack of Clubs' => 10, 'Queen of Clubs' => 10, 'King of Clubs' => 10, 'Ace of Clubs' => 11 }
#
GOAL = 21
DEALER_HOLD_POINT = 17
scores = {dealer: 1}
# current_hands = { dealer: [['King of S', 1, 'Ace of S' => 11,], player: [] }
current_hands_totals = { dealer: 0, player: 0 }


cards = [ ['2 of s', '2'], ['3 of s', '3'], ['4 of s', '4'], ['5 of s', '5'], ['6 of s', '6'], ['7 of s', '7'], ['8 of s', '8'], ['9 of s', '9'], ['10 of s', '10'], ['Jack of s', '10'], ['Queen of s', '10'], ['King of s', '10'], ['Ace of s', '11']]
suits = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
deck = []


suits.each do |name|
  cards.each do |arr|
    deck.push arr.map { |str| str.sub('s', name) }
  end
end
# binding.pry
deck.each { |arr| arr[1] = arr[1].to_i }

# so the above is how to iterate and make the changes.  but how can I retain the value of each card as well?



# the problem I had is that  although .sub returns a new string, that string is being saved at cards[arr][0], so cards is being mutated; this has been the promlem all along because each of the iterative methods I've tried still employ this assignment-by-mutation of part approach... but why is it not working to

# possible solutions
# - save new string to variable and then push that to proper array




p deck
