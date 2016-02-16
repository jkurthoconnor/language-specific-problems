
def prompt(message)
  print("=> #{message}")
end

def valid_number?(num)
  clean_number = num.delete(',.')
  /^\d+$/.match(clean_number) && num.to_i >= 0
end

def clean_input(source)
  source.delete(',').to_f
end

def say_invalid
  prompt("That's not a valid entry.  Please try again. Include only digits and a decimal point if necessary.\n")
end

messages = { welcome: "Welcome to the loan payment calculator.\n", amount: 'Please enter loan amount: $', apr: 'Please enter the Annual Percentage Rate (APR): ', length: 'Please enter the length of the loan in months: ', continue?: 'If you would like to enter additional loans, type \'y\'.  Any other input will exit. ' }

prompt(messages[:welcome])

loop do
  loan_data = {}
  user_input = ''
  loop do
    prompt(messages[:amount])
    user_input = gets.chomp
    if valid_number?(user_input)
      loan_data[:amount] = clean_input(user_input)
      break
    else
      say_invalid
    end
  end

  loop do
    prompt(messages[:apr])
    user_input = gets.chomp
    if valid_number?(user_input)
      loan_data[:apr] = clean_input(user_input)
      break
    else
      say_invalid
    end
  end

  loop do
    prompt(messages[:length])
    user_input = gets.chomp
    if valid_number?(user_input)
      loan_data[:length] = clean_input(user_input)
      break
    else
      say_invalid
    end
  end

  monthly_rate = (loan_data[:apr] / 100) / 12
  l = loan_data[:amount] # assign variable `l` and `m` to facilitate reading formula
  m = loan_data[:length]
  payment = l * (monthly_rate * (1 + monthly_rate)**m) / ((1 + monthly_rate)**m - 1)
  prompt("A #{m} month loan of $#{format('%.2f', l)} at #{loan_data[:apr]}% interest would require monthly payments of $#{format('%.2f', payment.round(2))}\n") #  force loan and payment output to include both cents places even if .00
  prompt(messages[:continue?])
  response = gets.chomp
  break unless response.casecmp('y') == 0
end
prompt("Good bye!\n")
