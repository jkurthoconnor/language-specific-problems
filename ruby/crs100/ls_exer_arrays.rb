
def spacer(n)
  puts "\n"*n
end


puts "Exercise 1"
#1:  "Below we have given you an array and a number. Write a program that checks to see if the number appears in the array."

arr = [1, 3, 5, 7, 9, 11]
number = 3
if arr.include?(number)
  puts "\nAre you looking for #{number}? Yup.  It's there!"
else
  puts "Nope.  #{number}'s not there."
end

spacer(3)

puts "Exercise 2"
#2  "What will the following programs return? What is value of arr after each?"
    #1. arr = ["b", "a"]
    #   arr = arr.product(Array(1..3))  # so... arr = [[b,1] [b,2] [b,3] [a,1] [a,2] [a,3]]
    #   arr.first.delete(arr.first.last)

    #2. arr = ["b", "a"]
    #   arr = arr.product([Array(1..3)]) # so ... arr = [["b", [1, 2, 3]], ["a", [1, 2, 3]]]
    #   arr.first.delete(arr.first.last)

puts "\nProgam 1. returns 1, since the last method is .delete, and 1 is the deleted item--per the argument fed to .delete, the deleted object is the last object in the first object of arr.    After the series of changes, arr = [['b'], ['b',2], ['b',3], ['a',1], ['a',2], ['a',3]]"
puts "\nProgram 2. returns [1, 2, 3], since the last method is .delete, and [1, 2, 3] is the deleted object--per the argument fed to .delete, the deleted object is the last object in the first object of arr. After the series of changes, arr = [['b'], ['a', [1, 2, 3]]]"
puts "\nThe essential difference between 1 and 2 is that prior to the delete call, the array in 1 is produced with what amount to: ['b', 'a'].product[1, 2, 3].  The array in 2 is produced by what amounts to : ['b', 'a'].product[[1, 2, 3]] "
spacer(3)

puts "Exercise 3"
#3 "How do you print the word "example" from the following array?"

arr = [["test", "hello", "world"],["example", "mem"]]

puts "\nThe string 'example' occupies slot 0 in the array in slot 1 of arr.  So its address is 'arr[1][0]'.  If we feed that to a 'puts', 'print', or 'p', then the string 'example' will print.  For example:"
puts arr[1][0]
print arr[1][0]
p arr[1][0]

spacer(3)

puts "Exercise 4"
#4 "What does each method return in the following example?"
    #arr = [15, 7, 18, 5, 12, 8, 5, 1]

    #1. arr.index(5)

    #2. arr.index[5]

    #3. arr[5]

puts "\nGiven  arr = [15, 7, 18, 5, 12, 8, 5, 1]\n arr.index(5) will return 3 (i.e. the index of 5)\n arr.index[5] will return an error\n arr[5] will return 8 (i.e. the item at index 5)"
spacer(3)

puts "Exercise 5 "
#5 "What is the value of a, b, and c in the following program?"
    #string = "Welcome to America!"
    #a = string[6]
    #b = string[11]
    #c = string[19]

puts "\nThe value of a is 'e'."
puts "The value of b is 'A'."
puts "The value of c is nil."
spacer(3)

puts "Exercise 6"
#6 "You run the following code...What is the problem and how can it be fixed?"
  #names = ['bob', 'joe', 'susan', 'margaret']
  #names['margaret'] = 'jody'

puts "\nThe problem is that the syntax of 'names['margaret'] = 'jody' makes it an attempt to reference an object via its array index. This index is an integer, but the string 'margaret' is used instead."
puts "If the idea is to replace 'margaret' with 'jody', we could accomplish this with 'names[3] = 'jody''"
spacer(3)

puts "Exercise 7"
#7 "Write a program that iterates over an array and builds a new array that is the result of incrementing each value in the original array by a value of 2. You should have two arrays at the end of this program, The original array and the new array you've created. Print both arrays to the screen using the p method instead of puts."

arr = [1, 2, 3, 4, 5, 6, 7, 8]
arr_plus_2 = arr.map { |i| i += 2 }
puts "\nHere's the original array:"
p arr
puts "\nHere's the array with each number incremented by 2:"
p arr_plus_2
