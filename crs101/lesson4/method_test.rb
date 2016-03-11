require 'pry'

def determine_winner(totals)
  comparison = 21 - totals[:player] <=> 21 - totals[:dealer]
  case comparison
  when -1 then 'player'
  when 0 then 'tie'
  when 1 then 'dealer'
  end
end

def display_results(outcome)
  case outcome
  when 'player' then p "Congratulations, you won!!"
  when 'tie' then p 'Wow!  That hand was a tie.'
  when 'dealer' then p "I'm sorry.  The computer won that hand. Better luck next time."
  end
end

deck = [ ["Ace of Examples", 11], ["Ace of Experiments", 11], ["Ace of Samples", 11], ["Ace of Tests", 11], ["Ace of Something", 11], ["7 of Hearts", 7], ["8 of Hearts", 8], ["Ace of That", 11], ["10 of Hearts", 10], ["Ace of Another", 11], ["Queen of Hearts", 10], ["King of Hearts", 10], ["Ace of Hearts", 11] ]

deck_in_play = deck.shuffle
current_hands = { dealer: [], player: [] }
current_hands_totals = { dealer: 20,  player: 20 }

display_results(determine_winner(current_hands_totals))
