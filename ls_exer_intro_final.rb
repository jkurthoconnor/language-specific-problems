# final_introductory_exercises
#1 use 'each' to print out each value
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
arr.each do |i|
  puts i
end
puts

#2 print out only values greater than 5
arr.each do |i|
  puts i if i > 5
end
puts

#3 use 'select' to create new array of the odd numbers
odd = arr.select { |i| i % 2 != 0 }
puts odd
puts

#4 append '11'; prepend '0'
arr.push(11)
arr.unshift(0)
puts arr
puts

#5 delete '11'; append '3'
arr.delete(11) # or if we know the index for '11': arr.delete[-1]
arr.push(3)
puts arr
puts

#6 remove duplicates without targeting a specific value
arr.uniq!
puts arr
puts

#7 How does a hash differ from an array?
puts "An array orders its contents in numbered slots, begining with 0.  A hash stores values associated with keys."
puts

#8 create hashes using both styles
old_hash = {:key_1 => "value_1", :key_2 => "value_2", :key_3 => "value_3"}
new_hash = {key_1: "value_1", key_2: "value_2", key_3: "value_3"}
puts "Old hash style: {:key_1 => 'value_1', :key_2 => 'value_2', :key_3 => 'value_3'}"
puts "New hash style: {key_1: 'value_1', key_2: 'value_2', key_3: 'value_3'}"
puts

#9 1. get value of key ':b' ; 2. add '{e: 5}'; 3. remove all pairs with values less than 3.5
h = {a: 1, b: 2, c: 3, d: 4}
b_value = h.values_at(:b) #or h.fetch(:b)
puts b_value
h[:e] = 5
puts h
h.delete_if { |k, v| v.to_f < 3.5}
puts h
puts

#10 Can hash values be arrays? --yes. Can there be an array of hashes? --yes.(give e.g.)
hash_o_arrays = {a: [8, 6, 7], b: [5, 3, 0]}
#Let's see if 'hash_o_arrays' is really a hash with arrays as values.
puts "#{hash_o_arrays[:b]} is the value (an array) stored with key ':b' in hash_o_arrays."
hash_o_arrays[:b].push 9
puts "#{hash_o_arrays[:b]} and that is the value of :b after pushing 9 to it.  Value of :b certainly functions like an array."
arr_o_hashes = [{c: 'carrot', d: 'stick'}, {e: 'donkey', f: 'motivation'}]
puts "This is the item stored in slot 0 of arr_o_hashes: #{arr_o_hashes[0]}. Looks like a hash."
h = arr_o_hashes[0]
h[:g] = 'rod'
puts "And here's the updated item in slot 0: #{arr_o_hashes[0]}"
puts


#11 which Ruby API do I like best?  Why?
puts "Ruby-Doc.org is the easiest to use that have found."
puts

#12 move info from array into person's hash.

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

smith_info_arr = contact_data[0]
johnson_info_arr = contact_data[1]
smith_hsh = contacts["Joe Smith"]
johnson_hsh = contacts["Sally Johnson"]
smith_hsh[:email] = smith_info_arr[0] #creates :email key in smith_hsh and stores as its value the item at smith_info_arr[0]
smith_hsh[:address] = smith_info_arr[1]
smith_hsh[:tel] = smith_info_arr[2]
johnson_hsh[:email] = johnson_info_arr[0]
johnson_hsh[:address] = johnson_info_arr[1]
johnson_hsh[:tel] = johnson_info_arr[2]
puts "\nHere is Joe Smith's information hash: #{smith_hsh}"
puts "\nHere is Sally Johnson's information hash: #{johnson_hsh}"
puts "\nHere is the hash that stores both contact hashes: #{contacts}"
