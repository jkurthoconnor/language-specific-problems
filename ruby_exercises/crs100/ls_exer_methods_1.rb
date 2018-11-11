def greeting(name)
  puts "Hello #{name}. It's nice to see you again."
end
puts "What is your name?"
name = gets.chomp
greeting(name)
