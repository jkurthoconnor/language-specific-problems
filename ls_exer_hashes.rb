def spacer(n)
  puts "\n"*n
end

puts "\nExercise 1"
#1. "Given a hash of family members, with keys as the title and an array of names as the values, use Ruby's built-in select method to gather only immediate family members' names into a new array."

family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

#these lines return a separate array of immediate family members
bros_sis = family.select { |k, v| (k == :sisters) || (k == :brothers) }.values.flatten
#.values.flatten returns flat array with values of the caller. stop here if only need a separate array of immediate family members
family[:immediate] = bros_sis#this line stores the array of immediate family members under :immediate in the family hash
puts "\nHere's the family hash with a new key, '':immediate', whose value is the new immediate family array: #{family}"

=begin if the assignment didn't call for use of .select, this line would have created an array of the immediate family member more directly
  bros_sis = family.values_at(:sisters, :brothers).flatten
=end
spacer(3)


puts "Exercise 2"
#2 "Look at Ruby's merge method. Notice that it has two versions. What is the difference between merge and merge!? Write a program that uses both and illustrate the differences."

hash_1 = {a: 'apples', b: 'bananas'}
hash_2 = {c: 'carrots', d: 'diced onions'}
puts "\nThe 'merge' method combines two hashes into a new hash.  It does not modify either source.\nSo, for instance, here's hash_1: #{hash_1}.\nHere's hash_2: #{hash_2}.\nHere's the result of hash_1 calling 'merge' with hash_2 as the argument:\n#{hash_1.merge(hash_2)}\nHere's the original unmutated hashes:\n#{hash_1}\n#{hash_2}."
puts "\nIn contrast, the 'merge!' method adds one hash to another.  That is, 'merge!' mutates the caller. So, for instance, here's the result of hash_1 calling 'merge!' with hash_2 as the argument.\n#{hash_1.merge!(hash_2)}\nHere's hash_1 again...notice it has been changed:\n#{hash_1}./\nHash_2, however, is unmutated.  See?\n#{hash_2}."
spacer(3)


puts "Exercise 3"
#3 "Using some of Ruby's built-in Hash methods, write a program that loops through a hash and prints all of the keys. Then write a program that does the same thing except printing the values. Finally, write a program that prints both."

hash = {a: 'apples', b: 'bananas', c: 'carrots', d: 'diced onions'}


puts "\nHere are the keys: #{hash.keys}"
puts "\nHere are the values: #{hash.values}"
puts "\nHere are the key & values paired:"
hash.each_pair { |k, v| puts "Key:#{k} Value: #{v}" }

spacer(3)

 puts "Exercise 4"
 #4 "Given the following expression, how would you access the name of the person?"

 person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}

puts "\nHere's the name: #{person[:name] }"

spacer(3)

puts "Exercise 5"
#5 "What method could you use to find out if a Hash contains a specific value in it? Write a program to demonstrate this use."

objects = {electronics: "droids", paper_products: "books"}
puts "\nThe 'has_value?' method returns true if a value is present in the calling hash.  For instance:"
if objects.has_value?("droids")
  puts "These are not the #{objects[:electronics]} you are looking for."
end

spacer(3)

puts "Exercise 6"
#6 "Given the array.[below]..Write a program that prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in them but in a different order. Your output should look something like this:"

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
anagram_list = {}
words.each do |w|
  key = w.split('').sort.flatten.join
  if anagram_list.has_key?(key)
    anagram_list[key].push w
  else
    anagram_list[key] = [w]
  end
end
puts "\nHere are the arrays of anagrams."
anagram_list.each_pair { |k, v| p v}

spacer(3)


puts "Exercise 7"
=begin #7 "Given the following code...
    x = "hi there"
    my_hash = {x: "some value"}
    my_hash2 = {x => "some value"}

What's the difference between the two hashes that were created?
=end

puts "\nmy_hash uses 'x:' to indicate the key.  That turns the string into a symbol. \nmy_hash2 uses 'x => ' to indicate the key.  This keeps the key as a string. (Is this the older syntax as well?"

spacer(3)

puts "Exercise 8"
#8 "If you see this error, what do you suspect is the most likely problem?
# NoMethodError: undefined method `keys' for Array

puts "The error below is most likely caused by an array trying to call .keys.  B. Keys is not an array method.\nError: 'NoMethodError: undefined method `keys' for Array'"
