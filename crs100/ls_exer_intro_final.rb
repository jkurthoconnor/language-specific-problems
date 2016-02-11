# final_introductory_exercises

def spacer(n)
  puts "\n"*n
end

puts "Exercise 1"
#1 use 'each' to print out each value
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
arr.each do |i|
  puts i
end
spacer(3)

puts "Exercise 2"
#2 print out only values greater than 5
arr.each do |i|
  puts i if i > 5
end
spacer(3)

puts "Exercise 3"
#3 use 'select' to create new array of the odd numbers
odd = arr.select { |i| i % 2 != 0 }
puts odd
spacer(3)

puts "Exercise 4"
#4 append '11'; prepend '0'
arr.push(11)
arr.unshift(0)
puts arr
spacer(3)

puts "Exercise 5"
#5 delete '11'; append '3'
arr.delete(11) # or if we know the index for '11': arr.delete[-1]
arr.push(3)
puts arr
spacer(3)

puts "Exercise 6"
#6 remove duplicates without targeting a specific value
arr.uniq!
puts arr
spacer(3)

puts "Exercise 7"
#7 How does a hash differ from an array?
puts "An array orders its contents in numbered slots, begining with 0.  A hash stores values associated with keys."
spacer(3)

puts "Exercise 8"
#8 create hashes using both styles
old_hash = {:key_1 => "value_1", :key_2 => "value_2", :key_3 => "value_3"}
new_hash = {key_1: "value_1", key_2: "value_2", key_3: "value_3"}
puts "Old hash style: {:key_1 => 'value_1', :key_2 => 'value_2', :key_3 => 'value_3'}"
puts "New hash style: {key_1: 'value_1', key_2: 'value_2', key_3: 'value_3'}"
spacer(3)

puts "Exercise 9"
#9 1. get value of key ':b' ; 2. add '{e: 5}'; 3. remove all pairs with values less than 3.5
h = {a: 1, b: 2, c: 3, d: 4}
b_value = h.values_at(:b) #or h.fetch(:b)
puts b_value
h[:e] = 5
puts h
h.delete_if { |k, v| v.to_f < 3.5}
puts h
spacer(3)

puts "Exercise 10"
#10 Can hash values be arrays? --yes. Can there be an array of hashes? --yes.(give e.g.)
hash_o_arrays = {a: [8, 6, 7], b: [5, 3, 0]}
#Let's see if 'hash_o_arrays' is really a hash with arrays as values.
puts "#{hash_o_arrays[:b]} is the value (an array) stored with key ':b' in hash_o_arrays."
hash_o_arrays[:b].push 9
puts "#{hash_o_arrays[:b]} <<-- and that is the value of :b after pushing 9 to it.  Value of :b certainly functions like an array."
arr_o_hashes = [{c: 'carrot', d: 'stick'}, {e: 'donkey', f: 'motivation'}]
puts "This is the item stored in slot 0 of arr_o_hashes: #{arr_o_hashes[0]}. Looks like a hash."
h = arr_o_hashes[0]
h[:g] = 'rod'
puts "And here's the updated item in slot 0: #{arr_o_hashes[0]}"
spacer(3)

puts "Exercise 11"
#11 which Ruby API do I like best?  Why?
puts "Ruby-Doc.org is the easiest to use that have found."
spacer(3)


puts "Exercise 12"
#12 move info from array into person's hash.
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

smith_info_arr = contact_data[0]
johnson_info_arr = contact_data[1]
smith_hsh = contacts["Joe Smith"]
johnson_hsh = contacts["Sally Johnson"]
smith_hsh[:email] = smith_info_arr[0] #creates :email key in smith_hsh and stores as its value the item at smith_info_arr[0]; ##NB: online solutions don't use step with initial variables, go directly to assignments:e.g.  contacts["Joe Smith"][:email] = contact_data[0][0]
smith_hsh[:address] = smith_info_arr[1] ## online solution:  contacts["Joe Smith"][:address] = contact_data[0][1]
smith_hsh[:tel] = smith_info_arr[2] ## online solution:  contacts["Joe Smith"][:tel] = contact_data[0][2]
johnson_hsh[:email] = johnson_info_arr[0]
johnson_hsh[:address] = johnson_info_arr[1]
johnson_hsh[:tel] = johnson_info_arr[2]
puts "Here is Joe Smith's information hash: #{smith_hsh}"
puts "\nHere is Sally Johnson's information hash: #{johnson_hsh}"
puts "\nHere is the hash that stores both contact hashes: #{contacts}"
spacer(3)

puts "Exercise 13"
#13 how can one access Joe's email? Sally's phone number?
puts "Here's Joe's email: #{contacts["Joe Smith"].values_at(:email)}"
puts "\nHere's the email a different way: #{contacts["Joe Smith"][:email]}"
puts "\nHere's Sally's phone number: #{contacts["Sally Johnson"].values_at(:tel)}"
puts "\nHere's the phone number a different way: #{contacts["Sally Johnson"][:tel]}\n"
spacer(3)

puts "Exercise 14"
#14 "programmatically loop or iterate over the contacts hash from exercise 12, and populate the associated data from the contact_data array" hint: iterate over [:email, :address, : phone] shift and first methods might help
contact_data2 = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts2 = {"Joe Smith" => {}, "Sally Johnson" => {}}
keys = [:email, :addr, :tel]
n = 0
keys.each do |k|
  contacts2["Joe Smith"][k] = contact_data2[0][n]
  contacts2["Sally Johnson"][k] = contact_data2[1][n]
  n += 1
end
puts contacts2
spacer(3)


puts "Exercise 15"
#15 1. use array method delete_if and string method start_with? to delete all words that start with 's' 2. recreate arr and remove all that start with 's' or 'w'
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr_copy = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

arr.delete_if { |word| word.start_with?('s')}
p arr

#arr.each do |word|  #why won't this block work?  it leaves 'salted roads'
#  if word.start_with?('s')
#    arr.delete(word)
#  end
#end
#p arr
arr_copy.delete_if { |word| word.start_with?('s', 'w') }
#this also works:  arr_copy.delete_if { |word| word.start_with?('s') || word.start_with?('w')}
p arr_copy
spacer(3)

puts "Exercise 16"
#16 "turn it [array] into a new array that consists of strings containing one word. (ex. ["white snow", etc...] → ["white", "snow", etc...]. Look into using Array's map and flatten methods, as well as String's split method."
a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

split = a.map { |word| word.split }
single_words = split.flatten
p single_words
