
def prompt(message) # changes prompt
  print("=> #{message}")
end

def valid_number?(num)
  num_stripped = num.to_s.delete(',' '.')
  (/^\d+$/.match(num_stripped)) && num.to_i >= 0
end

inputs = {loan: ['loan amount'], apr: ['Annual Percentage Rate (APR)'], length: ['the length of the loan in months']}

prompt("Welcome to the loan payment calculator.\n")

loop do #  main loop
  temp = ''
  loop do
  prompt("Please enter #{inputs[:loan][0]}: $")
  temp = gets.chomp
    if valid_number?(temp)
      inputs[:loan][1] = temp.delete(',').to_f # removes possible formatting commas to prevent mis-reading by `.to_f`
      break
    else
      prompt("That's not a valid entry.  Please try again. Include only digits and a decimal point if necessary.\n")
    end
  end

puts inputs

  prompt("Please enter #{inputs[:apr][0]}: ") # add valid apr test, i.e. greater than 0 and does not contain nondigit characters (after allowing  '.' for float compensations)
  inputs[:apr][1] = gets.chomp.to_f
  prompt("Please enter #{inputs[:length][0]}: ") # add valid months test, i.e. greater than 0 and does not contain nondigit characters
  inputs[:length][1] = gets.chomp.to_f
  apr_dec = inputs[:apr][1] / 100
  m_rate = apr_dec / 12
  l = inputs[:loan][1] # assign to facilitate reading formula
  m = inputs[:length][1] # assign to facilitate reading formula
  payment = l * (m_rate * (1 + m_rate)**m) / ((1 + m_rate)**m - 1)
  prompt("A #{m} month loan of $#{l} at #{inputs[:apr][1]}% interest would require monthly payments of $#{payment.round(2)}\n") #  force loan and payment amounts to print cents even if 'ones' aren't needed
end
