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

### 5   


### Solution:


### 6   


### Solution:


### 7   


### Solution:


### 8   


### Solution:


### 9   


### Solution:


### 10   


### Solution:


