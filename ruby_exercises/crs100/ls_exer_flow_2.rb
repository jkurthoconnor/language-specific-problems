def cap_if_10plus (str)
  if str.length >= 10
    puts str.upcase
  else
    puts "String is fewer than 10 characters long."
  end
end
puts "Please enter a string."
string = gets.chomp
cap_if_10plus(string)
