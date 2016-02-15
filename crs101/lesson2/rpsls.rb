VALID_CHOICES = %w(rock paper scissors lizard Spock)
VALID_ABBREVIATIONS = %w(r p s l S)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def convert_initial(entry)
  if entry == 'r'
    'rock'
  elsif entry == 'p'
    'paper'
  elsif entry == 's'
    'scissors'
  elsif entry == 'l'
    'lizard'
  else
    'Spock'
  end
end

def win?(player1, player2)
  (player1 == 'rock' && (player2 == 'scissors' || player2 == 'lizard')) ||
    (player1 == 'paper' && (player2 == 'rock' || player2 == 'Spock')) ||
    (player1 == 'scissors' && (player2 == 'paper' || player2 == 'lizard')) ||
    (player1 == 'lizard' && (player2 == 'Spock' || player2 == 'paper')) ||
    (player1 == 'Spock' && (player2 == 'scissors' || player2 == 'rock'))
end

def determine_result(player, computer)
  if win?(player, computer)
    "You won this round!"
  elsif win?(computer, player)
    "Computer won this round!"
  else
    "The round is a tie!!"
  end
end

def increment_score(result, score_hash)
  if result ==  "You won this round!"
    score_hash[:player] = score_hash[:player] + 1
  elsif result == "Computer won this round!"
    score_hash[:computer] = score_hash[:computer] + 1
  end
end

def say_score(score_hash)
  prompt("Here's the current score: #{score_hash}")
  if score_hash[:player] == 5
    prompt("\n=> Congratulations!  You beat the computer!!")
  elsif score_hash[:computer] == 5
    prompt("\n=> Sorry. You've lost this game.")
  end
end

loop do
  prompt("Welcome to ROCK PAPER SCISSORS LIZARD VULCAN.\n=> The first player to win five (5) rounds wins the game.\n=> You may select by typing the full word (e.g.: 'rock')\n=> or you may enter the first letter of your choice.\n=> (Remember to capitalize for the Vulcan!)")

  score = {player: 0, computer: 0}
  while score[:player] < 5 && score[:computer] < 5

    choice = ''
    loop do
      prompt("\n=> Choose one: #{VALID_CHOICES.join(', ')}.")
      choice = Kernel.gets().chomp()
      if VALID_CHOICES.include?(choice)
        break
      elsif VALID_ABBREVIATIONS.include?(choice)
        choice = convert_initial(choice)
        break
      else
        prompt("That's not a valid choice. Try again.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose #{choice}; the computer chose #{computer_choice}")
    outcome = determine_result(choice, computer_choice)
    prompt("#{outcome}")
    increment_score(outcome, score)
    say_score(score)
  end

  prompt("\n=> Would you like to play another 'first to five' series? ('Y' for yes.)")
  again = Kernel.gets().chomp()
  break unless again.casecmp('y') == 0
end

prompt("That was fun. Good bye!")
