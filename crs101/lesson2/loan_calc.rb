
def prompt(message) # changes prompt
  print("=> #{message}")
end

def valid_number?(num)
  num_stripped = num.delete(',.')
  /^\d+$/.match(num_stripped) && num.to_i >= 0
end

prompt("Welcome to the loan payment calculator.\n")

loop do #  main loop
  inputs = { loan: ['loan amount'], apr: ['Annual Percentage Rate (APR)'], length: ['the length of the loan in months'] } # initialize within main loop to prevent data retention from previous iteration

  temp = ''
  loop do # loan entry and validation loop
    prompt("Please enter #{inputs[:loan][0]}: $")
    temp = gets.chomp
    if valid_number?(temp)
      inputs[:loan][1] = temp.delete(',').to_f # removes possible formatting commas to prevent mis-reading by `.to_f` or `.to_i`
      break
    else
      prompt("That's not a valid entry.  Please try again. Include only digits and a decimal point if necessary.\n")
    end
  end

  temp = ''
  loop do # apr entry and validation loop
    prompt("Please enter #{inputs[:apr][0]}: ")
    temp = gets.chomp
    if valid_number?(temp)
      inputs[:apr][1] = temp.delete(',').to_f
      break
    else
      prompt("That's not a valid entry.  Please try again. Include only digits and a decimal point if necessary.\n")
    end
  end

  temp = ''
  loop do # months entry and validation loop
    prompt("Please enter #{inputs[:length][0]}: ")
    temp = gets.chomp
    if valid_number?(temp)
      inputs[:length][1] = temp.delete(',').to_f
      break
    else
      prompt("That's not a valid entry.  Please try again. Include only digits and a decimal point if necessary.\n")
    end
  end

  apr_dec = inputs[:apr][1] / 100
  m_rate = apr_dec / 12
  l = inputs[:loan][1] # assigns variable `l` and `m` to facilitate reading formula
  m = inputs[:length][1]
  payment = l * (m_rate * (1 + m_rate)**m) / ((1 + m_rate)**m - 1)
  prompt("A #{m} month loan of $#{format('%.2f', l)} at #{inputs[:apr][1]}% interest would require monthly payments of $#{format('%.2f', payment.round(2))}\n") #  force loan and payment output to include both cents places even if .00
  prompt("If you would like to enter additional loans, type 'y'.  Any other input will exit. ")
  response = gets.chomp
  break unless response.casecmp('y') == 0
end
prompt("Good bye!\n")
