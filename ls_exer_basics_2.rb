number = rand(8999) + 1000
thousands = number/1000
hundreds = (number % 1000)/100
tens = (number % 100)/10
ones = (number % 10)/1
puts "#{number} broken into units is #{thousands} thousand(s), #{hundreds} hundred(s), #{tens} ten(s), and #{ones} ones."
