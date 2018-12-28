immediate_family = {
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"]
          }
extended_family = { uncles: ["bob", "joe", "steve"],
            aunts: ["mary","sally","susan"]
          }

puts "Here are the immediate relations in a fictional family: #{immediate_family.values.flatten}"
puts "\nAnd here are the extended relations in the same fictional family: #{extended_family.values.flatten}"
puts "\nHere's the .merged hash of both family levels: #{immediate_family.merge(extended_family)}"
puts "Note that the original hashes are intact:"
puts immediate_family
puts extended_family
puts "\nBut here's the .merged! hash of both family levels: #{immediate_family.merge!(extended_family)}"
puts "Note the immediate_family hash is now altered."
puts immediate_family
