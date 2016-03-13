
# refactor ideas
# - rubocop clean up
# - too much repetition of 'n wins' text; find way to consolidate
# - hide/show additional dealer cards?
# - large conditional chains smell; fix if not remedied by adding the play again loop and breaks
# - create deck without relying on hash of complete options

# functional additions
# - XX play again loop
# - xx entry validation
# - xx display current hands at top of screen (use 'clear'?)
# - xx add prompt
# - add play to five loop


require 'pry'

DECK = { '2 of Hearts' => 2, '3 of Hearts' => 3, '4 of Hearts' => 4, '5 of Hearts' => 5, '6 of Hearts' => 6, '7 of Hearts' => 7, '8 of Hearts' => 8, '9 of Hearts' => 9, '10 of Hearts' => 10, 'Jack of Hearts' => 10, 'Queen of Hearts' => 10, 'King of Hearts' => 10, 'Ace of Hearts' => 11, '2 of Diamonds' => 2, '3 of Diamonds' => 3, '4 of Diamonds' => 4, '5 of Diamonds' => 5, '6 of Diamonds' => 6, '7 of Diamonds' => 7, '8 of Diamonds' => 8, '9 of Diamonds' => 9, '10 of Diamonds' => 10, 'Jack of Diamonds' => 10, 'Queen of Diamonds' => 10, 'King of Diamonds' => 10, 'Ace of Diamonds' => 11, '2 of Spades' => 2, '3 of Spades' => 3, '4 of Spades' => 4, '5 of Spades' => 5, '6 of Spades' => 6, '7 of Spades' => 7, '8 of Spades' => 8, '9 of Spades' => 9, '10 of Spades' => 10, 'Jack of Spades' => 10, 'Queen of Spades' => 10, 'King of Spades' => 10, 'Ace of Spades' => 11, '2 of Clubs' => 2, '3 of Clubs' => 3, '4 of Clubs' => 4, '5 of Clubs' => 5, '6 of Clubs' => 6, '7 of Clubs' => 7, '8 of Clubs' => 8, '9 of Clubs' => 9, '10 of Clubs' => 10, 'Jack of Clubs' => 10, 'Queen of Clubs' => 10, 'King of Clubs' => 10, 'Ace of Clubs' => 11 }

def prompt(message)
  puts "=> #{message}"
end

def introduce_game
  prompt "Welcome to 21.  The first to win five hands wins the game."
  sleep 2.0
end

def shuffle_new_deck(source)
  deck = source.to_a
  deck.shuffle
end

def deal_hands(deck, hand)
  2.times do
    hand[:player].unshift deck.shift
    hand[:dealer].unshift deck.shift
  end
end

def update_hands_values(hands, totals)
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

def display_current_status(hands, score)
  system 'clear' or system 'cls'
  prompt "Game Score: Dealer: #{score[:dealer]} Player: #{score[:player]}"
  puts
  prompt "Current Hand."
  prompt "Dealer's Cards: showing #{hands[:dealer][0][0]} and #{hands[:dealer]
      .length - 1} hidden"
  prompt "Your Cards: #{hands[:player].flatten
      .select { |c| c != c.to_i }.join(', ')}"
  puts
end

def determine_hand_outcome(totals)
  comparison = 21 - totals[:player] <=> 21 - totals[:dealer]
  if totals[:player] > 21
    'player busts'
  elsif totals[:dealer] > 21
    'dealer busts'
  elsif comparison == -1
    'player'
  elsif comparison == 0
    'tie'
  else
    'dealer'
  end
end

def increment_scores(outcome, score)
  if outcome == 'player busts' || outcome == 'dealer'
    score[:dealer] += 1
  elsif outcome == 'dealer busts' || outcome == 'player'
    score[:player] += 1
  end
end

def display_hand_outcome(hands, outcome, totals)
  case outcome
  when 'player' then prompt "Congratulations, you won!!"
  when 'tie' then prompt 'Wow!  That hand was a tie.'
  when 'dealer' then prompt "I'm sorry.  The computer won. Better luck next time."
  when 'player busts' then prompt "You went over 21.  The computer won."
  when 'dealer busts' then prompt "The computer went over 21. Victory is yours!!"
  end
  puts
  prompt "Hand Results"
  prompt "Dealer's Hand: #{hands[:dealer].flatten.select { |c| c != c.to_i }
      .join(', ')}"
  prompt "Dealer's Points: #{totals[:dealer]}\n\n"
  prompt "Player's Hand: #{hands[:player].flatten.select { |c| c != c.to_i }
      .join(', ')}"
  prompt "Player's Points: #{totals[:player]}\n\n"
  sleep 2.0
end

loop do
  introduce_game

  loop do # play to 5
    scores = { dealer: 0, player: 0 }

    loop do # individual hands
      deck_in_play = shuffle_new_deck(DECK)
      current_hands = { dealer: [], player: [] }
      current_hands_totals = { dealer: 0, player: 0 }
      current_hand_outcome = nil

      deal_hands(deck_in_play, current_hands)
      display_current_status(current_hands, scores)

      response = nil
      loop do
        prompt "Would you like to hit or stay?"

        loop do
          response = gets.chomp
          break if response.casecmp('stay') == 0 || response.casecmp('hit') == 0
          prompt "That's not a valid game option.  Enter 'hit' or 'stay'."
        end

        break if response.casecmp('stay') == 0
        hit_me(current_hands, :player, deck_in_play)
        update_hands_values(current_hands, current_hands_totals)
        prompt "Your new card is: #{current_hands[:player][-1][0]}"
        sleep 1.0
        display_current_status(current_hands, scores)
        break if busted?(current_hands_totals, :player) || current_hands_totals[:player] == 21
      end

      if response == 'stay'
        prompt "OK. You chose to stay. Now it is the dealer's turn."
        sleep 1.0
      end

      loop do
        break if busted?(current_hands_totals, :player) || (current_hands_totals[:player] == 21)
        break if busted?(current_hands_totals, :dealer) || (current_hands_totals[:dealer] >= 17)
        prompt "Dealer hits."
        sleep 1.0
        hit_me(current_hands, :dealer, deck_in_play)
        display_current_status(current_hands, scores)
        update_hands_values(current_hands, current_hands_totals)
      end

      if !busted?(current_hands_totals, :dealer) && !busted?(current_hands_totals, :player) && !(current_hands_totals[:player] == 21)
        prompt "Dealer stays."
        sleep 1.0
      end
      current_hand_outcome = determine_hand_outcome(current_hands_totals)
      display_hand_outcome(current_hands, current_hand_outcome, current_hands_totals)
      increment_scores(current_hand_outcome, scores)
      break if scores[:dealer] == 5 || scores[:player] == 5
      # add display scores after victory; without doing so there is no apparent resoution before looping into 'rematch question'
    end
    break if scores[:dealer] == 5 || scores[:player] == 5
  end
  prompt "Would you like a rematch?"
  loop do
    response = gets.chomp
    break if response.casecmp('yes') == 0 || response.casecmp('no') == 0
    prompt "That's not an option.  Please enter 'yes' or 'no'."
  end
  break if response.casecmp('no') == 0

end

prompt "Thanks for playing.  Good bye!"
