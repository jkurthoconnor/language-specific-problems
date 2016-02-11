
require 'yaml'
MESSAGES = YAML.load_file('calc_messages.yml')

def prompt(message) # changes prompt
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num_stripped = num.to_s.delete(',' '.')
  /\D/.match(num_stripped.to_s) == nil
  # num.to_i() != 0 # 0 is the return for any .to_i call on a nondigit, but also on 0, so method had to be improved
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt(MESSAGES[:welcome]) # argument prior to yaml config: ("Welcome to the calculator. Please enter your name.")

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
    prompt(MESSAGES[:name]) # argument prior to yaml config: ("Please enter your name.")
  else
    break
  end
end
prompt("Hi #{name}.  Let's get started!")
loop do # main loop
  num_1 = '' # initializes variable outside of loop block to make it available   outside of loop
  loop do
    prompt(MESSAGES[:number_1]) # argument prior to yaml config: ("What's the first number you wish to use?")
    num_1 = Kernel.gets().chomp()# could delete commas at this point

    if valid_number?(num_1)
      break
    else
      prompt(MESSAGES[:invalid]) # argument prior to yaml config: ("That isn't a valid number. Try again.")
    end
  end
  num_2 = ''
  loop do
    prompt(MESSAGES[:number_2]) # argument prior to yaml config: ("What is the second number?")
    num_2 = Kernel.gets().chomp()

    if valid_number?(num_2)
      break
    else
      prompt(MESSAGES[:invalid]) # argument prior to yaml config: ("That isn't a valid number. Try again.")
    end
  end

  # refactored to improve formatting of options `Kernel.puts("What operation would you like to perform? Type '1' for addition.  # Type '2' for subtraction. Type '3' for multiplication.  Type '4' for# division.")`

  # operator_prompt = <<-MSG
  #   What operation would you like to perform?
  #   1) add
  #   2) subtract
  #   3) multiply
  #   4) divide
  # MSG

  prompt(MESSAGES[:operator_prompt]) #  argument prior to yaml config: (operator_prompt)

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator) # checks if operator is included in an array of given strings
      break
    else
      prompt(MESSAGES[:operator_followup]) # # argument prior to yaml config: ("Choose 1, 2, 3 or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers ...")

  result = case operator # refactored from conditional statements
           when '1'
             num_1.to_f() + num_2.to_f() # in 1, 2, 3 changed `.to_i` to `.to_f` to allow for adding float inputs
           when '2'
             num_1.to_f() - num_2.to_f()
           when '3'
             num_1.to_f() * num_2.to_f()
           when '4'
             num_1.to_f() / num_2.to_f() # already was `.to_f` to prevent integer division
           end

  prompt("The result is #{result}")
  prompt(MESSAGES[:more?])  # argument prior to yaml config:  ("Would you like to perform additional calculations? (Y)")
  answer = Kernel.gets().chomp().downcase()
  break unless answer.start_with?('y')

end # end main loop
prompt("Thanks for calculating today.  Good bye, #{name}!")
