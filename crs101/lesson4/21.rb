
# refactor ideas
# - too much repetition of 'n wins' text; find way to consolidate
# - hide/show additional dealer cardst
# - add prompy

# functional repairs
# - logic re winner: determine_winner grants win to busted parties
#   - link to earlier results?
#   - arrange loops so bust breaks out of main game loop, not just player/dealer turn loop

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
  puts "Dealer's Cards: showing #{hands[:dealer][0][0] } and #{hands[:dealer]
      .length - 1 } hidden\nYour Cards: #{hands[:player].flatten
      .select { |c| c != c.to_i }.join(', ' ) }"
end

def determine_winner(totals)
  comparison = 21 - totals[:player] <=> 21 - totals[:dealer]
  case comparison
  when -1 then 'player'
  when 0 then 'tie'
  when 1 then 'dealer'
  end
end

def display_final_results(hands, outcome)
  puts "Dealer's Hand: #{hands[:dealer].flatten.select { |c| c != c.to_i }
      .join(', ' ) }"
  puts "Player's Hand: #{hands[:player].flatten.select { |c| c != c.to_i }
      .join(', ' ) }"
  case outcome
  when 'player' then p "Congratulations, you won!!"
  when 'tie' then p 'Wow!  That hand was a tie.'
  when 'dealer' then p "I'm sorry.  The computer won. Better luck next time."
  end
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
  puts "You've gone over 21.  Dealer wins."
else
  puts "OK. You chose to stay. Now it is the dealer's turn."
  sleep 1.0
end

loop do
  break if busted?(current_hands_totals, :dealer)  ||
          (current_hands_totals[:dealer] >= 17)
  puts "Dealer hits."
  hit_me(current_hands, :dealer, deck_in_play)
  display_current_hands(current_hands)
  calculate_hands_values(current_hands, current_hands_totals)
  sleep 1.0
end

if busted?(current_hands_totals, :dealer)
  puts "Dealer's gone over 21.  You win!"
else
  puts "Dealer stays."
end

display_final_results(current_hands, determine_winner(current_hands_totals))

p current_hands_totals
p current_hands
