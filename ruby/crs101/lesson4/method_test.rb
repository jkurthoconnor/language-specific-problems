require 'pry'
#
GOAL = 21
DEALER_HOLD_POINT = 17
scores = {dealer: 1}
# current_hands = { dealer: [['King of S', 1, 'Ace of S' => 11,], player: [] }
current_hands_totals = { dealer: 0, player: 0 }


CARDS = [ ['2 of s', '2'], ['3 of s', '3'], ['4 of s', '4'], ['5 of s', '5'], ['6 of s', '6'], ['7 of s', '7'], ['8 of s', '8'], ['9 of s', '9'], ['10 of s', '10'], ['Jack of s', '10'], ['Queen of s', '10'], ['King of s', '10'], ['Ace of s', '11']]
SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades']
deck = []


def new_deck
  SUITS.each do |name|
    CARDS.each do |arr|
      deck.push arr.map { |str| str.sub('s', name) }
    end
  end
  deck.each { |arr| arr[1] = arr[1].to_i }
end

p new_deck
# so the above is how to iterate and make the changes.  but how can I retain the value of each card as well?



# the problem I had is that  although .sub returns a new string, that string is being saved at cards[arr][0], so cards is being mutated; this has been the promlem all along because each of the iterative methods I've tried still employ this assignment-by-mutation of part approach... but why is it not working to

# possible solutions
# - save new string to variable and then push that to proper array




p deck
