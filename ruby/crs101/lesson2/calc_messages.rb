# used this file to create yaml version of messages used in calc.rb  Messages hash here was made by hand.  NB: attempts at interpolation threw undefined variable errors (even whenthiscode was run within the loop in calc.rb.) I commented them out as a workaround.

require 'yaml'
messages = { welcome: "Welcome to the calculator. Please enter your name.",
name: "Please enter your name.",
# greeting: "Hi #{name}.  Let's get started!",
number_1: "What's the first number you wish to use?",
invalid: "That isn't a valid number. Try again.",
number_2: "What is the second number?",
operator_prompt: "<<-MSG
  What operation would you like to perform?
  1) add
  2) subtract
  3) multiply
  4) divide
MSG",
operator_followup: "Choose 1, 2, 3 or 4",
# calculating: "#{operation_to_message(operator)} the two numbers ...",
# result: "The result is #{result}",
more?: "Would you like to perform additional calculations? (Y)"
# thanks: "Thanks for calculating today.  Good bye, #{name}!"
}
yml_messages = messages.to_yaml
File.open "calc_messages.yml", 'w' do |f| # opens (creates if nonexistent?) file with write permissions
  f.write yml_messages #write the yaml description of yml_messages hash
end
