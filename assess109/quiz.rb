## changes
# - [x] add case modification questions to string_fluency
# - 
# - move questions to separate file (yaml?)
# - revise questioning prompt display;
#    - [x] clear after each question
#    - [] re-position text
#    - [x] prompt on curser line

string_fluency = [
  "return length of string\n bonus: return number of characters --not spaces, punctuation-- in string",
  'return number of specified characters in string',
  'return number of specified sub-strings ( or words) in string',
  'delete specified characters in string',
  'delete characters at specified indices in string',
  "return index of specified characters in a string (first occurrance)\nbonus: return index of specified characters (next occurrence) starting at given index \ndouble bonus: return index of next occurance of character with out providing integer for start-from index",
  'add specified characters to start of string',
  'add specified characters to end of string',
  'add / insert specified characters at specified indices in string',
  'insert specified word prior to (or after) given existing word (use one line)',
  'substitute given character(s) for other(s) in a string',
  "reverse character order in string\nbonus: reverse without using `.reverse` on array\ndouble bonus: reverse order by iterating through string directly (i.e. not via an array)",
  'determine if given characters are present in string',
  'return array of characters matching a pattern',
  'return an array of words taken from a string that meet given conditions',
  'return new string (or modify existing string) to have all characters lowercased',
  'return new string (or modify existing string) to have all characters uppercased',
  'return new string (or modify existing string) to have sentence case',
  'return new string (or modify existing string) to have all cases switched'
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
  'return the index of specified element (first occurance)',
  'return the index of the first object that matches a given block',
  'return number of times an element occurs within the array',
  'move element in array to new index using one line',
  'combine two arrays into one',
  'return all indices of occurrences of a specified element'
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
  'delete all key/value pairs where value meets certain conditions',
  'combine two hashes into one'
]

mini_programs = [
  'reverse an array without using the built-in reverse method',
  'write a solution to FizzBuzz',
  'write a method that takes an array and returns an array of the same string values except with the vowels removed',
  'select elements out of the array if its index is a fibonacci number',
  'write a method to generate fibonacci numbers between 0 and a stop point',
  'write a method to determine if a word is a palindrome, without using the reverse method',
  'write a method that determines if there is a balanced number of parentheses; add check to ensure parentheses are in correct order',
  'write a search method that returns all elements in a hash matching a set of conditions',
  'write a title case method that returns a string with title-appropriate capitalization',
  'write a method that takes a string and returns an array of the indices of single characters that match a pattern. bonus: do same with matches of multi-char strings',
  'write a method that takes an array and returns the indices of all elements matching a pattern (e.g. odd)',
  'write a method to return all the factors of a number',
  'return the indices of duplicates in an array',
  'return the max and min values in a array without invoking `.max` or `.min`',
  'return the index of the nth occurrence of an element in an array'
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

menu_options = {1=>"string fluency", 2=>"array fluency", 3=>"hash fluency", 4=>"mini-challenges", 5=>"basic concepts", 6=>"exit program"}

def random_question(type)
  type[rand(type.length)]
end

def prompt(text)
  puts ">> #{text}"
end

def display_menu(options)
  system 'clear' or system 'cls'
  prompt('Welcome to the Basic Ruby Fluency Quizzer.')
  puts ''
  prompt("Select one")
  puts '>>'
  options.each do |number, option|
    puts ">> >> (#{number}) #{option}"
  end
  puts '>>'
  print '>> '
end

def display_please_reenter
  prompt('That is not an option.  Please enter 1 - 6.')
  print '>> '
end
  

loop do
  display_menu(menu_options)
  choice = ''
  loop do
    choice = gets.chomp.to_i
    break if (1..6).cover?(choice)
    display_please_reenter
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
    system 'clear' or system 'cls'
    5.times do 
      puts ''
    end
    prompt(random_question(question_set))
    5.times do 
      puts ''
    end
    prompt("[ENTER to continue, or type 'menu' to return to menu.]")
    print '>> '
    break if gets.chomp == 'menu'
  end
end
