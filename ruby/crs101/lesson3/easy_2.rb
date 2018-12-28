def spacer
  puts "\n"*3
end

puts "Exercise 1"
# In this hash of people and their age ... see if there is an age present for "Spot".
# Bonus: What are two other hash methods that would work just as well for this solution?

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

if ages["Spot"]
  p "There's a value stored under 'Spot'"
else
  p "Nothing's stored under 'Spot'"
end

p ages.key?("Spot") # this also works
p ages.include?("Spot")# this also works

spacer

puts "Exercise 2"
# Add up all of the ages from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

age_total = 0
ages.each_value do |v|
  age_total = v + age_total
end
p age_total

spacer

puts "Exercise 3"
# In the age hash throw out the really old people (age 100 or older).

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.delete_if  { |k, v|  v >= 100 }
p ages

spacer

puts "Exercise 4"
# Starting with this string ... Convert the string in the following ways (code will be executed on original `munsters_description` above):

# "The munsters are creepy in a good way."
# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
# "the munsters are creepy in a good way."
# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

munsters_description = "The Munsters are creepy in a good way."
p munsters_description.capitalize!

munsters_description = "The Munsters are creepy in a good way."
p munsters_description.swapcase!

munsters_description = "The Munsters are creepy in a good way."
p munsters_description.downcase!

munsters_description = "The Munsters are creepy in a good way."
p munsters_description.upcase!

spacer


puts "Exercise 5"
# We have most of the Munster family in our age hash... add ages for Marilyn and Spot to the existing hash

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

p ages.merge(additional_ages)

spacer

puts "Exercise 6"
# Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

youngest = ages.values.sort.shift
p youngest

spacer

puts "Exercise 7"
# See if the name "Dino" appears in the string below:

advice = "Few things in life are as important as house training your pet dinosaur."

 p advice.include?('Dino')

spacer

puts "Exercise 8"
# In the array: .....Find the index of the first name that starts with "Be"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.index { |name| name.start_with?('Be') }

spacer

puts "Exercise 9"
# Using array#map!, shorten each of these names to just 3 characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
puts flintstones.map! { |name| name[0..2] }

spacer

puts "Exercise 10"

# Again, shorten each of these names to just 3 characters -- but this time do it all on one line:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.map! { |name| name[0..2] }

spacer
