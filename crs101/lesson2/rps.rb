VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  Kernel.puts("=> #{message}")
end

def display_result(player, computer)
  if (player == 'rock' && computer == 'scissors') ||
      (player == 'paper' && computer == 'rock') ||
      (player == 'scissors' && computer == 'paper')
      prompt("You won!")
  elsif (player == 'scissors' && computer == 'rock') ||
      (player == 'rock' && computer == 'paper') ||
      (player == 'paper' && computer == 'scissors')
      prompt("Computer won!")
  else
    prompt("It is a tie??!!")
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

  display_result(choice, computer_choice)

  prompt("Would you like to play again? ('Y' for yes.)")
  again = Kernel.gets().chomp()
  break unless again.casecmp('y') == 0
end
prompt("That was fun. Good bye!")
