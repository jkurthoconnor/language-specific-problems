require 'pry'


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
     # binding.pry
    if totals[k] > 21 && hands[k].flatten.include?(11)
      totals[k] = (totals[k] - 10 * hands[k].flatten.count(11)) + 10
    #  binding.pry
    end
  end
end



deck = [ ["Ace of Examples", 11], ["Ace of Experiments", 11], ["Ace of Samples", 11], ["Ace of Tests", 11], ["Ace of Something", 11], ["7 of Hearts", 7], ["8 of Hearts", 8], ["Ace of That", 11], ["10 of Hearts", 10], ["Ace of Another", 11], ["Queen of Hearts", 10], ["King of Hearts", 10], ["Ace of Hearts", 11] ]

deck_in_play = deck.shuffle
current_hands = { dealer: [], player: [] }
current_hands_totals = { dealer: 0,  player: 0 }

deal_hands(deck_in_play, current_hands)

puts "Dealer's Hand: showing #{current_hands[:dealer][0][0] }\nYour Hand: #{current_hands[:player].flatten.select { |c| c != c.to_i }.join(', ' ) }" # hide/show additional cards
calculate_hands_values(current_hands, current_hands_totals)
p current_hands
p current_hands_totals
