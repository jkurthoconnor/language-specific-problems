VALID_CHOICES = %w(rock paper scissors)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win?(player1, player2)
  (player1 == 'rock' && player2 == 'scissors') ||
    (player1 == 'paper' && player2 == 'rock') ||
    (player1 == 'scissors' && player2 == 'paper')
end

def determine_result(player, computer)
  if win?(player, computer)
    "You won!"
  elsif win?(computer, player)
    "Computer won!"
  else
    "It is a tie!!"
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid game choice.")
    end
  end
  computer_choice = VALID_CHOICES.sample

  prompt("You chose #{choice}; the computer chose #{computer_choice}")

  prompt("#{determine_result(choice, computer_choice)}")

  prompt("Would you like to play again? ('Y' for yes.)")
  again = Kernel.gets().chomp()
  break unless again.casecmp('y') == 0
end
prompt("That was fun. Good bye!")
