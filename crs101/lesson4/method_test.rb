require 'pry'


def deal_hand(deck, hand)
  n = 0
  2.times do |n|
    hand[:player][n] = deck.shift
    hand[:dealer][n] = deck.shift
    n+=1
  end
end

def calculate_hand_value(hand, totals) # only works for one or two card hands
  totals[:player] = hand[:player][0][1].to_i + hand[:player][1][1].to_i
  totals[:dealer] = hand[:dealer][0][1].to_i + hand[:dealer][1][1].to_i

  binding.pry
  totals.each_key do |k|
    binding.pry
    if totals.values_at(k).join.to_i > 21
      if hand[k].flatten.include?(11)
        totals[k] = (totals[k] - 10 * hand[k].flatten.count(11)) + 10
        binding.pry
      end
    end
  end
end


deck = [ ["Ace of Examples", 11], ["Ace of Experiments", 11], ["Ace of Samples", 11], ["Ace of Tests", 11], ["Ace of Something", 11], ["7 of Hearts", 7], ["8 of Hearts", 8], ["Ace of That", 11], ["10 of Hearts", 10], ["Ace of Another", 11], ["Queen of Hearts", 10], ["King of Hearts", 10], ["Ace of Hearts", 11] ]

deck_in_play = deck.shuffle
current_hand = { dealer: [], player: [] }
current_hand_totals = { dealer: 0,  player: 0 }

deal_hand(deck_in_play, current_hand)

puts "Dealer's Hand: showing #{current_hand[:dealer][0][0].to_s}\nYour Hand: #{current_hand[:player][0][0].to_s} & #{current_hand[:player][1][0].to_s}"

calculate_hand_value(current_hand, current_hand_totals)
binding.pry
p current_hand_totals
