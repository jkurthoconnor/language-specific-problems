# ## Pseudo code for 21
# 1. Initialize deck
# 2. Deal cards to player and dealer
# 3. Player turn: hit or stay
#   - repeat until bust or "stay"
# 4. If player bust, dealer wins.
# 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# 6. If dealer bust, player wins.
# 7. Compare cards and declare winner.

# ## tips

#
# ***** Calculating Aces. Remember that aces can be worth either 1 or 11, depending on the context. You should not ask the user what the value of the ace is; your program should be able to figure this out automatically.

require 'pry'

DECK = { '2 of Hearts' => 2, '3 of Hearts' => 3, '4 of Hearts' => 4, '5 of Hearts' => 5, '6 of Hearts' => 6, '7 of Hearts' => 7, '8 of Hearts' => 8, '9 of Hearts' => 9, '10 of Hearts' => 10, 'Jack of Hearts' => 10, 'Queen of Hearts' => 10, 'King of Hearts' => 10, 'Ace of Hearts' => 11, '2 of Diamonds' => 2, '3 of Diamonds' => 3, '4 of Diamonds' => 4, '5 of Diamonds' => 5, '6 of Diamonds' => 6, '7 of Diamonds' => 7, '8 of Diamonds' => 8, '9 of Diamonds' => 9, '10 of Diamonds' => 10, 'Jack of Diamonds' => 10, 'Queen of Diamonds' => 10, 'King of Diamonds' => 10, 'Ace of Diamonds' => 11, '2 of Spades' => 2, '3 of Spades' => 3, '4 of Spades' => 4, '5 of Spades' => 5, '6 of Spades' => 6, '7 of Spades' => 7, '8 of Spades' => 8, '9 of Spades' => 9, '10 of Spades' => 10, 'Jack of Spades' => 10, 'Queen of Spades' => 10, 'King of Spades' => 10, 'Ace of Spades' => 11, '2 of Clubs' => 2, '3 of Clubs' => 3, '4 of Clubs' => 4, '5 of Clubs' => 5, '6 of Clubs' => 6, '7 of Clubs' => 7, '8 of Clubs' => 8, '9 of Clubs' => 9, '10 of Clubs' => 10, 'Jack of Clubs' => 10, 'Queen of Clubs' => 10, 'King of Clubs' => 10, 'Ace of Clubs' => 11 }

def shuffle_new_deck(source)
  deck = source.select { |k, v| k == k}.to_a
  deck.shuffle
end

def deal_hand(deck, hand)
  n = 0
  2.times do |n|
    hand[:player][n] = deck.shift
    hand[:dealer][n] = deck.shift
    n+=1
  end
end

def calculate_hand_value(hand, totals)
  totals[:player] = hand[:player][0][1].to_i + hand[:player][1][1].to_i
  totals[:dealer] = hand[:dealer][0][1].to_i + hand[:dealer][1][1].to_i
  # pseudo code for aces
  # totals.each do |competitor|
  # if totals[:competitor] > 21
  #   if [:competitor].values.include?(11)
  #      subtract 10 from totals[:competitor] for each occurance of 11
  #   end
  # end
end


current_hand = { dealer: [], player: [] }
current_hand_totals = { dealer: 0,  player: 0 }
binding.pry
deck_in_play = shuffle_new_deck(DECK)

deal_hand(deck_in_play, current_hand)
binding.pry
puts "Dealer's Hand: showing #{current_hand[:dealer][0][0].to_s}\nYour Hand: #{current_hand[:player][0][0].to_s} & #{current_hand[:player][1][0].to_s}"

calculate_hand_value(current_hand, current_hand_totals)
p current_hand_totals
