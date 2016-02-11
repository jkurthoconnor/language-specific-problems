family = {
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            uncles: ["bob", "joe", "steve"],
            aunts: ["mary","sally","susan"]
          }
#print keys
puts "\nThese are the hash's keys:"
family.each do |key, value|
  puts key
end
#print values
puts "\nThese are the hash's values:"
family.each do |key, value|
  puts value
end
#print keys and values
puts "\nFinally, the hash's keys with values:"
family.each do |key, value|
  puts "key: #{key}, value: #{value}"
end
