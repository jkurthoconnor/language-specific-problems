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



require 'pry'

DECK = { '2 of Hearts' => 2, '3 of Hearts' => 3, '4 of Hearts' => 4, '5 of Hearts' => 5, '6 of Hearts' => 6, '7 of Hearts' => 7, '8 of Hearts' => 8, '9 of Hearts' => 9, '10 of Hearts' => 10, 'Jack of Hearts' => 10, 'Queen of Hearts' => 10, 'King of Hearts' => 10, 'Ace of Hearts' => 11, '2 of Diamonds' => 2, '3 of Diamonds' => 3, '4 of Diamonds' => 4, '5 of Diamonds' => 5, '6 of Diamonds' => 6, '7 of Diamonds' => 7, '8 of Diamonds' => 8, '9 of Diamonds' => 9, '10 of Diamonds' => 10, 'Jack of Diamonds' => 10, 'Queen of Diamonds' => 10, 'King of Diamonds' => 10, 'Ace of Diamonds' => 11, '2 of Spades' => 2, '3 of Spades' => 3, '4 of Spades' => 4, '5 of Spades' => 5, '6 of Spades' => 6, '7 of Spades' => 7, '8 of Spades' => 8, '9 of Spades' => 9, '10 of Spades' => 10, 'Jack of Spades' => 10, 'Queen of Spades' => 10, 'King of Spades' => 10, 'Ace of Spades' => 11, '2 of Clubs' => 2, '3 of Clubs' => 3, '4 of Clubs' => 4, '5 of Clubs' => 5, '6 of Clubs' => 6, '7 of Clubs' => 7, '8 of Clubs' => 8, '9 of Clubs' => 9, '10 of Clubs' => 10, 'Jack of Clubs' => 10, 'Queen of Clubs' => 10, 'King of Clubs' => 10, 'Ace of Clubs' => 11 }

def shuffle_new_deck(source)
  deck = source.select { |k, v| k == k}.to_a
  deck.shuffle
end

def deal_hands(deck, hand)
  n = 0
  2.times do |n|
    hand[:player][n] = deck.shift
    hand[:dealer][n] = deck.shift
    n+=1
  end
end

def calculate_hands_values(hands, totals)
  totals.each_key do |k|
    totals[k] = hands[k].flatten.select { |n| n == n.to_i }
                .inject { |sum, n| sum + n }
    if totals[k] > 21 && hands[k].flatten.include?(11)
      totals[k] = (totals[k] - 10 * hands[k].flatten.count(11)) + 10
    end
  end
end

def hit_me(hands, turn, deck)
  hands[turn].push deck.shift
end

def busted?(totals, turn)
  if totals[turn] > 21
    true
  end
end

def display_current_hands(hands)
  puts "Dealer's Hand: showing #{hands[:dealer][0][0] }\nYour Hand: #{hands[:player].flatten.select { |c| c != c.to_i }.join(', ' ) }" # hide/show additional dealer cards
end

deck_in_play = shuffle_new_deck(DECK)
current_hands = { dealer: [], player: [] }
current_hands_totals = { dealer: 0,  player: 0 }

deal_hands(deck_in_play, current_hands)
display_current_hands(current_hands)

response = nil
loop do
  puts "Would you like to hit or stay?"
  response = gets.chomp
  break if response.downcase == 'stay'
  hit_me(current_hands, :player, deck_in_play)
  calculate_hands_values(current_hands, current_hands_totals)
  puts "Your new card is: #{current_hands[:player][-1][0]}"
  display_current_hands(current_hands)
  break if busted?(current_hands_totals, :player)
end

if busted?(current_hands_totals, :player)
  puts "You've gone over 21."
else
  puts "OK. You chose to stay. Now it is the dealer's turn."
end

p current_hands_totals
p current_hands
