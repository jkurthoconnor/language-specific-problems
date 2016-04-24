

string_fluency = [
  'return length / number of characters in string',
  'return number of specified characters in string',
  'return number of specified sub-strings (words) in string',
  'delete specified characters in string',
  'delete characters at specified indices in string',
  'return index of specified characters in a string',
  'add specified characters to start of string',
  'add specified characters to end of string',
  'add / insert specified characters at specified indices in string',
  'substitute given character(s) for other(s) in a string',
  'reverse character order in string (bonus: reverse without using .reverse on array)',
  'determine if given characters are present in string',
  'return array of characters matching a pattern'
]

array_fluency = [
  'iterate over array of numbers and print out each value (iterators v. loops)',
  'iterate over array of numbers and print out only those matching certain conditions',
  'append `n` to end of array',
  'prepend `n` to beginning of array',
  'remove specified objects from an array',
  'remove objects from an array at specified indices',
  'remove duplicates from an array using one method',
  'extract all odds (or evens or ... ) from an array into new array',
  'increment all numbers in an array by 1',
  'find sum of all numbers in an array',
  'find max / min value in an array',
  'return the index of specified element',
  'return the index of the first object that matches a given block',
  'return number of times an element occurs within the array'
]

hash_fluency = [
  'get value of specified key',
  'add key/value pair',
  'print out all keys',
  'print out all values',
  'print out all key/value pairs',
  'print out all key/value pairs where value meets certain conditions',
  'find max / min key/value',
  'return new hash of pairs meeting certain criteria',
  'delete all key/value pairs where value meets certain conditions'
]

mini_programs = [
  'reverse an array without using the built-in reverse method',
  'write a solution to FizzBuzz',
  'write a method that takes an array and returns an array of the same string values except with the vowels removed',
  'select elements out of the array if its index is a fibonacci number',
  'write a method to generate fibonacci numbers between start and stop points',
  'write a method to determine if a word is a palindrome, without using the reverse method',
  'write method that determines if there is a balanced number of parentheses; add check to ensure parentheses are in correct order',
  'write a search method that returns all elements in a hash matching a set of conditions',
  'delete all key/value pairs where value meets certain conditions'
]

basic_concepts = [
  'explain local variable scope (interaction with blocks and methods)',
  'how passing an object into a method can or cannot permanently change the object',
  'explain `.each`, `.map`, `.`select',
  'explain variables as pointers',
  'explain the distinctions between `puts` and `return`',
  'explain the difference between `false` and  `nil`',
  'implicit return value of methods and blocks'
]

def random_question(type)
  type[rand(type.length)]
end

def prompt(text)
  puts ">> #{text}"
end

MENU = "Select one:\n(1) string fluency\n(2) array fluency\n(3) hash fluency\n(4) mini-challenges\n(5) basic concepts\n(6) exit program"


prompt('Welcome to the Basic Ruby Fluency Quizzer.')

loop do
  prompt(MENU)
  choice = ''
  loop do
    choice = gets.chomp.to_i
    break if (1..6).cover?(choice)
    prompt('That is not an option.  Please make a selection by entering 1 - 5.')
  end
  break if choice == 6
  question_set = case choice
              when 1 then string_fluency
              when 2 then array_fluency
              when 3 then hash_fluency
              when 4 then mini_programs
              when 5 then basic_concepts
              end

  loop do
    prompt(random_question(question_set))
    prompt("[ENTER to continue, or type 'menu' to return to menu.]")
    break if gets.chomp == 'menu'
  end
end
