def say(text = "This string is the default parameter, used when no argument is passed with method call.")
  puts "#{text}!!!"
end

say("Hello world")
say
say("I'm using a say method")
say
# puts text # as expected, throws error: undefined method
