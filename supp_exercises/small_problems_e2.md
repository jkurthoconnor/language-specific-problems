Small Problems: Easy 2
LaunchSchool
https://launchschool.com/exercise_sets/c39c6a0d

### How old is Teddy?
Build a program that randomly generates and prints Teddy's age. To get the age, you should generate a random number between 20 and 200.

Example Output:

```ruby
Teddy is 69 years old!
```

#### Solution: 

```ruby
def age(person)
  puts "#{person} is #{rand(181) + 20} years old!"
end

age('Teddy')
```

Further Explorations:
Modify this program to ask for a name, and then print the age for that person. For an extra challenge, use "Teddy" as the name if no name is entered.

```ruby

def age
  puts "Whose age are you requesting?"
  person = gets.chomp
  person = 'Teddy' if person.length == 0
  puts "#{person} is #{rand(181) + 20} years old!"
end

age
```

### How Big is the Room?
Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

Note: 1 square meter == 10.7639 square feet

Do not worry about validating the input at this time.

Example Run

```ruby
Enter the length of the room in meters:
10
Enter the width of the room in meters:
7
The area of the room is 70.0 square meters (753.47 square feet).
```

#### Solution: 

```ruby
SQM_TO_SQF = 10.7639
puts "Enter the length of the room in meters:"
length = gets.chomp

puts "Enter the width of the room in meters:"
width = gets.chomp

area_meters = (length.to_f * width.to_f).round(2)
area_ft = area_meters * SQM_TO_SQF

puts "The area of the room is #{area_meters} square meters (#{area_ft} square feet)."
```

Further Explorations
Modify this program to ask for the input measurements in feet, and display the results in square feet, square inches, and square centimeters.

```ruby

```
### Tip Calculator
Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.

Example:

```ruby
What is the bill? 200
What is the tip percentage? 15

The tip is $30.0
The total is $230.0
```

#### Solution: 

```ruby
puts "Enter bill amount:"
bill = gets.chomp.to_f

puts "Enter desired tip percent:"
percent = gets.chomp.to_f / 100

tip = (bill * percent).round(2)
total = (bill + tip).round(2)

puts "The tip is: $" + tip.to_s
puts "The bill total is: $" + total.to_s
```

Further Exploration:

Our solution prints the results for our as $30.0 and $230.0 instead of the more usual $30.00 and $230.00. Modify your solution so it always prints the results with 2 decimal places.

Hint: You will likely need Kernel#format for this.

```ruby
puts "Enter bill amount:"
bill = gets.chomp.to_f

puts "Enter desired tip percent:"
percent = gets.chomp.to_f / 100

tip = (bill * percent).round(2)
total = (bill + tip).round(2)

puts "The tip is: $" + format('%.2f', tip)
puts "The bill total is: $" + format('%.2f', total)
```

### When Will I Retire?
Build a program that displays when the user will retire and how many years she has to work till retirement.

```ruby
What is your age? 30
At what age would you like to retire? 70

It is 2016. You will retire in 2056.
You have only 40 years of work to go!
```

#### Solution: 

```ruby
print "What is your age? "
age = gets.chomp.to_i

print "At what age would you like to retire? "
retire_at = gets.chomp.to_i

year = Time.now.year
retire_in_yrs = retire_at - age
retirement_yr = year + retire_in_yrs

puts "\nIt's #{year}. You will retire in #{retirement_yr}."
puts "You have only #{retire_in_yrs} years of work to go!"
```

### Greeting a user
Write a program that will ask for user's name. The program will then greet the user. If the user writes "name!" then the computer yells back to the user.

```ruby
What is your name? Bob
Hello Bob.
What is your name? Bob!
HELLO BOB. WHY ARE WE SCREAMING?
```

#### Solution: 

```ruby
print "What is your name? "
name = gets.chomp

if name.end_with?('!')
  puts "HELLO #{name[0...-1].upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello " + name + "."
end
```

Further Exploration
Try modifying our solution to use String#chomp! and String#chop!, respectively.

```ruby
print 'What is your name? '
name = gets.chomp!

if name[-1] == '!'
  name.chop!
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end
```
### Odd Numbers
Print all odd numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.

#### Solution: 

```ruby
(1..99).each { |n| p n if n.odd? }
```

Further Exploration
Repeat this exercise with a technique different from the one you just used, and different from the solution shown above. You may want to explore the use Integer#upto or Array#select methods, or maybe use Integer#odd?

```ruby
odds = (1..99).to_a.select { |n| n % 2 == 1 }
puts odds
```

### Even Numbers
Print the even numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.

#### Solution:
```ruby
(1..99).each { |n| p n if n.even? }

```

### Sum or Product of Consecutive Integers
Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

Examples:
```ruby
>> Please enter an integer greater than 0:
5
>> Enter 's' to compute the sum, 'p' to compute the product.
s
The sum of the integers between 1 and 5 is 15.


>> Please enter an integer greater than 0:
6
>> Enter 's' to compute the sum, 'p' to compute the product.
p
The product of the integers between 1 and 6 is 720.
```

#### Solution: 

```ruby
def prompt(text)
  puts ">>" + text
end

prompt("Please enter an integer greater than 0:")
integer = gets.chomp.to_i

prompt("Enter 's' to compute the sum, 'p' to compute the product.")
operation = gets.chomp

case operation
when 's'
  term = 'sum'
  result = (1..integer).to_a.inject { |sum, n| sum + n }
when 'p'
  term = 'product'
  result = (1..integer).to_a.inject { |product, n| product * n }
end

prompt("The #{term} of the integers between 1 and #{integer} is #{result}.")
```

### 


```ruby

```

#### Solution: 

```ruby

```

### 


```ruby

```

#### Solution: 

```ruby

```


