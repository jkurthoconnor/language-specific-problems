puts "What is your first name?"
first_name = gets.chomp
puts "What is your last name?"
last_name = gets.chomp
puts "Hello #{first_name} #{last_name}.  Pleased to meet you."
puts "To help me remember your name, I will repeat it 10 times."
10.times do
  puts "#{first_name} #{last_name}"
end
