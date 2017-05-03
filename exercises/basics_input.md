## User Input, from Ruby Basics LaunchSchool exercises (https://launchschool.com/exercise_sets/fa30c236)

### 1 Repeat after me

Write a program that asks the user to type something in, after which your program should simply display what was entered.

Example:
```bash
$ ruby repeater.rb
>> Type anything you want:
This is what I typed.
This is what I typed.  
```

### Solution:
```ruby
puts '>> Type anything you want:'
input = gets.chomp
puts input
```

### 2 
Your Age in Months

Write a program that asks the user for their age in years, and then converts that age to months.

Examples:
```bash
$ ruby age.rb
>> What is your age in years?
35
You are 420 months old.
```  

### Solution:
```ruby
puts '>> What is your age in years?'
years = gets.chomp.to_i
months = years * 12
puts "You are #{months} months old."
```

### 3  
Print Something (Part 1)

Write a program that asks the user whether they want the program to print "something", then print it if the user enters y. Otherwise, print nothing.

Examples:
```bash
$ ruby something.rb
>> Do you want me to print something? (y/n)
y
something

$ ruby something.rb
>> Do you want me to print something? (y/n)
n

$ ruby something.rb
>> Do you want me to print something? (y/n)
help
```

### Solution:
```ruby
puts '>> Do you want me to print something? (y/n)'
input = gets.chomp

if input.include?('y')
  puts 'something'
end
```

### 4   

Print Something (Part 2)

In the previous exercise, you wrote a program that asks the user if they want the program to print "something". However, this program recognized any input as valid: if you answered anything but y, it treated it as an n response, and quit without printing anything.

Modify your program so it prints an error message for any inputs that aren't y or n, and then asks you to try again. Keep asking for a response until you receive a valid y or n response. In addition, your program should allow both Y and N (uppercase) responses; case sensitive input is generally a poor user interface choice. Whenever possible, accept both uppercase and lowercase inputs.

Examples:
```bash
$ ruby something2.rb
>> Do you want me to print something? (y/n)
y
something

$ ruby something2.rb
>> Do you want me to print something? (y/n)
help
>> Invalid input! Please enter y or n
>> Do you want me to print something? (y/n)
Y
something

$ ruby something2.rb
>> Do you want me to print something? (y/n)
N

$ ruby something2.rb
>> Do you want me to print something? (y/n)
NO
>> Invalid input! Please enter y or n
>> Do you want me to print something? (y/n)
n
```

### Solution:
```ruby
input = ''

loop do
  puts '>> Do you want me to print something? (y/n)'
  input = gets.chomp
  
  break if ['y', 'n'].include?(input.downcase)
  puts 'Invalid input!!  Enter y or n.'
end

if input.include?('y')
  puts 'something'
end
```

### 5  Launch School Printer (Part 1)

Write a program that prints 'Launch School is the best!' repeatedly until a certain number of lines have been printed. The program should obtain the number of lines from the user, and should insist that at least 3 lines are printed.

For now, just use #to_i to convert the input value to an Integer, and check that result instead of trying to insist on a valid number; validation of numeric input is a topic with a fair number of edge conditions that are beyond the scope of this exercise.

Examples:
```bash
$ ruby lsprint.rb
>> How many output lines do you want? Enter a number >= 3:
5
Launch School is the best!
Launch School is the best!
Launch School is the best!
Launch School is the best!
Launch School is the best!

$ ruby lsprint.rb
>> How many output lines do you want? Enter a number >= 3:
2
>> That''s not enough lines.
>> How many output lines do you want? Enter a number >= 3:
3
Launch School is the best!
Launch School is the best!
Launch School is the best!
```

### Solution:
```ruby
def get_request
  input = ''
  loop do
    puts "How many output lines do you want?" \
          " Enter a number >=3:"
    input = gets.chomp.to_i

    break if input >=3
    puts "That's not enough lines."
  end
  input.to_i
end

def printer(n)
  n.times { puts "LS is the best!"}
end
  
number = get_request
printer(number)
```

### 6   

Passwords

Write a program that displays a welcome message, but only after the user enters the correct password, where the password is a string that is defined as a constant in your program. Keep asking for the password until the user enters the correct password.

Examples:
```bash
$ ruby password.rb
>> Please enter your password:
Hello
>> Invalid password!
>> Please enter your password:
Secret
>> Invalid password!
>> Please enter your password:
SecreT
Welcome!
```

### Solution:
```ruby
PASS = 'pass'

loop do
  puts ">> Please enter your password:"
  break if PASS == gets.chomp
  puts ">> Invalid password!"
end

puts "Welcome!"
```

### 7  
User Name and Password

In the previous exercise, you wrote a program to solicit a password. In this exercise, you should modify the program so it also requires a user name. The program should solicit both the user name and the password, then validate both, and issue a generic error message if one or both are incorrect; the error message should not tell the user which item is incorrect.

Examples:
```bash
$ ruby login.rb
>> Please enter user name:
John
>> Please enter your password:
Hello
>> Authorization failed!
>> Please enter user name:
mary
>> Please enter your password:
SecreT
>> Authorization failed!
>> Please enter user name:
admin
>> Please enter your password:
root
>> Authorization failed!
>> Please enter user name:
admin
>> Please enter your password:
SecreT
Welcome!
```

### Solution:
```ruby
PASS = 'pass'
USRNAME = 'Bob'

loop do
  name = ''
  pswd = ''
  puts ">> Please enter your username:"
  name = gets.chomp
  puts ">> Please enter your password:"
  pswd = gets.chomp

  break if ((PASS == pswd) && (USRNAME == name))
  puts ">> Fail!"
end

puts "Welcome!"
```

### 8  
Dividing Numbers

Write a program that obtains two Integers from the user, then prints the results of dividing the first by the second. The second number must not be 0, and both numbers should be validated using this method:

def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

This method returns true if the input string can be converted to an Integer and back to a string without loss of information, false otherwise. It's not a perfect solution in that some inputs that are otherwise valid (such as 003) will fail, but it is sufficient for this exercise.

Examples:
```bash
$ ruby division.rb
>> Please enter the numerator:
8
>> Please enter the denominator:
2
>> 8 / 2 is 4

$ ruby division.rb
>> Please enter the numerator:
8.3
>> Invalid input. Only integers are allowed.
>> Please enter the numerator:
9
>> Please enter the denominator:
4
>> 9 / 4 is 2


$ ruby division.rb
>> Please enter the numerator:
10
>> Please enter the denominator:
a
>> Invalid input. Only integers are allowed.
>> Please enter the denominator:
0
>> Invalid input. A denominator of 0 is not allowed.
>> Please enter the denominator:
5
>> 10 / 5 is 2
``` 


### Solution:
```ruby
def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

def get_numerator
  n = ''
  loop do
    puts ">> Please enter the numerator:"
    n = gets.chomp
    break if valid_number?(n)
    puts "Invalid input.  Only integers are allowed."
  end
  n.to_i
end

def get_denominator
  n = ''
  loop do
    puts ">> Please enter the denomenator:"
    n = gets.chomp
    break if n != '0' && valid_number?(n)
    if n == '0'
      puts "Invalid input.  Denomenators of 0 are not allowed."
    else
      puts "Invalid input.  Only integers are allowed."
    end
  end
  n.to_i
end

num = get_numerator
denom = get_denominator

puts "#{num} / #{denom} is #{num / denom}"
```

### 9  Launch School Printer (Part 2)

In an earlier exercise, you wrote a program that prints 'Launch School is the best!' repeatedly until a certain number of lines have been printed. Our solution looked like this:

```ruby
number_of_lines = nil
loop do
  puts '>> How many output lines do you want? Enter a number >= 3:'
  number_of_lines = gets.to_i
  break if number_of_lines >= 3
  puts ">> That's not enough lines."
end

while number_of_lines > 0
  puts 'Launch School is the best!'
  number_of_lines -= 1
end
```

Modify this program so it repeats itself after each input/print iteration, asking for a new number each time through. The program should keep running until the user enters q or Q.




### Solution:
```ruby
def get_request
  input = ''
  loop do
    puts "How many output lines do you want?" \
          " Enter a number >=3:" \
          "(Q to quit)"
    input = gets.chomp
    return if input.downcase == 'q'

    break if input.to_i >=3
    puts "That's not enough lines."
  end
  input.to_i
end

def printer(n)
  n.times { puts "LS is the best!"}
end


loop do
  response = get_request

  response.class == Fixnum ? printer(response) : break
end
```

### 10 Opposites Attract

Write a program that requests two integers from the user, adds them together, and then displays the result. Furthermore, insist that one of the integers be positive, and one negative; however, the order in which the two integers are entered does not matter.

Do not check for positive/negative requirement until after both integers are entered, and start over if the requirement is not met.

You may use the following method to validate input integers:

```ruby
def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end
```

```bash
$ ruby opposites.rb
>> Please enter a positive or negative integer:
8
>> Please enter a positive or negative integer:
0
>> Invalid input. Only non-zero integers are allowed.
>> Please enter a positive or negative integer:
-5
>> 8 + -5 = 3

$ ruby opposites.rb
>> Please enter a positive or negative integer:
8
>> Please enter a positive or negative integer:
5
>> Sorry. One integer must be positive, one must be negative.
>> Please start over.
```

### Solution:

```ruby
def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def proper_pair?(pair)
  pair.count { |n| n.positive? } == 1
end

def collect_integers
  pair = []

  until pair.size == 2  
    n = ''
    puts "Please enter a positive or negative integer"
    n = gets.chomp
    if n == '0'
      puts "Zero is neither positive nor negative."
      next
    end
    pair << n.to_i if valid_number?(n)
  end

  pair
end

def result(pair)
  pair[0] + pair[1]
end

loop do
  collected_pair = collect_integers  

  if proper_pair?(collected_pair)
    puts "#{collected_pair.first} + #{collected_pair.last}" \
    " = #{result(collected_pair)}"
    break
  else
    puts "One integer must be positive, the other negative."
  end
end
```
