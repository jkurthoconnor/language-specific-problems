## Exercises: Course 101, Lesson 3, Medium 1
(Re-working exercises as review for assessment 109)
#### Q  1
Let's do some "ASCII Art" (a stone-age form of nerd artwork from back in the days before computers had video screens).

For this exercise, write a one-line program that creates the following output 10 times, with the subsequent line indented 1 space to the right:

```ruby
The Flintstones Rock!
 The Flintstones Rock!
  The Flintstones Rock!
```

#### Answer

```ruby
30.times { |num| puts ' '  * num + 'The Flintstones Rock!'}
```

#### Q  2

Create a hash that expresses the frequency with which each letter occurs in this string:

```ruby
statement = "The Flintstones Rock"
```
ex:

```ruby
{ "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }
```

#### Answer

```ruby
statement = "The Flintstones Rock"
frequencies = {}

statement.split('').uniq.sort.each do |letter|
  frequencies[letter] = statement.count(letter)
end
frequencies.delete(' ')

```

#### Q  3

The result of the following statement will be an error:
```ruby
puts "the value of 40 + 2 is " + (40 + 2)
```
Why is this and what are two possible ways to fix this?

#### Answer

The error in
```ruby
puts "the value of 40 + 2 is " + (40 + 2)
```
is that the interpreter doesn't know how to handle the `+` function.  `+` can a) concatenate two strings, or it b) could add two numbers, but a and b are different functions represented by the same symbol.  The `puts` statement in question is trying to add a string to an integer.  That's a type confusion.

This could be resolved by converting the sum `40 + 2` to a string.  Then `+` could be used to concatenate both strings.

```ruby
puts "the value of 40 + 2 is " + (40 + 2).to_s
```

The type confusion could also be solved by interpolation.  Interpolation would accomplish the same thing.  That is, it would allow the formula to be executed and then converted into a string.

```ruby
puts "the value of 40 + 2 is #{40 + 2}"
```

#### Q 4
What happens when we modify an array while we are iterating over it? What would be output by this code?

```ruby
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
```

What would be output by this code?
```ruby
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
```

#### Answer

Iterating over an array that is being modified can cause problems with the count in the iteration.  Running the following code

```ruby
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end
```

should output: 
```ruby
1 
3
```
and would return:
[3, 4]

This is because the `.shift` call removes the first element in the array.  So, on the second iteration `p number` looks to output the 2nd element, but because the array has shifted, the second element is now 3.

Running the following code would give a different output.

```ruby
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
```

This will output
```ruby
1
2
```
and will return
[1, 2]

The different output and return is because `pop` doesn't interfere with the iterator's count.  `pop` removes elements off of the end, so although the original `numbers`  array isn't output as a whole because at each iteration its last element is being deleted, the iterator counting isn't interfered with.

#### Q Medium 5
Alan wrote the following method, which was intended to show all of the factors of the input number:

```ruby
def factors(number)
  dividend = number
  divisors = []
  begin
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end until dividend == 0
  divisors
end
```

Alyssa noticed that this will fail if you call this with an input of 0 or a negative number and asked Alan to change the loop. How can you change the loop construct (instead of using begin/end/until) to make this work? Note that we're not looking to find the factors for 0 or negative numbers, but we just want to handle it gracefully instead of raising an exception or going into an infinite loop.

Bonus 1

What is the purpose of the `number % dividend == 0` ?

Bonus 2

What is the purpose of the second-to-last line in the method (the divisors before the method's end)?


#### Answer

```ruby
def factors(number)
  dividend = number
  divisors = []
  
  if number <= 0
    puts "Sorry.  We only provide factors for positive numbers."
  end
  
  while dividend > 0
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end
```
Answer Bonus 1: 
`number % dividend == 0` is the test for a number to be evenly divided by a (potential) integer dividend.  This Boolean expression returns true only when the (potential) integer dividend is a factor of the number.

Answer Bonus 2:
`divisors` appears just before the method end so that when called the method will return the array of divisors (i.e. the integers that have been identified as factors of the number entered as the method argument.)  Without this, the method will return `nil` and after the method has been run there will be no way to access the factors stored under `divisors` because that array was initialized within the method.  


#### Q 6

Alyssa was asked to write an implementation of a rolling buffer. Elements are added to the rolling buffer and if the buffer becomes full, then new elements that are added will displace the oldest elements in the buffer.

She wrote two implementations saying, "Take your pick. Do you like << or + for modifying the buffer?". Is there a difference between the two, other than what operator she chose to use to add an element to the buffer?

```ruby
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end
```

#### Answer

Both `rolling_buffer1` (#1) and `rolling_buffer2`(#2)  will return the same array, (assuming `buffer` in #1 and `input_array` in #2 have the same values, and the values for the other parameters are the same). 

#1 passes `buffer` in as an argument, so because it uses a mutating method `<<` `buffer` will be modified and  its new content will be available outside of the method. But #2 does not pass in `buffer` as an argument.  Rather it simply assigns a value to `buffer` within the method.  This [re]assignment is local to the method, and so won't affect the value of `buffer` outside.  So, while both return the same array, only #1 actually modifies the buffer as it appears outside of the method.

#### Q 7

Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator, A user passes in two numbers, and the calculator will keep computing the sequence until some limit is reached.

Ben coded up this implementation but complained that as soon as he ran it, he got an error. Something about the limit variable. What's wrong with the code?

```ruby
limit = 15

def fib(first_num, second_num)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"
```

How would you fix this so that it works?


#### Answer

This original code doesn't allow the local variable `limit` to be accessed within the method.  `limit` is defined outside of the method, and it is not being passed in as an argument.  The error reports that `limit` is an `undefined local variable or method`. The `fib` method simply doesn't 'know' what `limit` is. `limit` is outside of `fib` method's scope.

To fix this, just add `limit` in as an argument when defining the method.

```ruby
limit = 15

def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"
```

#### Q 8

In another example we used some built-in string methods to change the case of a string. A notably missing method is something provided in Rails, but not in Ruby itself...`titleize`! This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title.

Write your own version of the rails `titleize` implementation.


#### Answer

```ruby
title = 'tHis is THe tItle oF ThE bOOk'

def titleize!(string)
  string.split.map { |word| word.capitalize! }.join(' ')
end


```

#### Q 9

Given the munsters hash below

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
```

Modify the hash such that each member of the Munster family has an additional "age_group" key that has one of three values describing the age group the family member is in (kid, adult, or senior). Your solution should produce the hash below

```ruby
{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }
```

Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.

hint: try using a `case` statement along with Ruby `Range` objects in your solution


#### Answer

```ruby
munsters.each_key do |name|
  
  age = munsters[name]["age"]
  case age
  when (0..17) then munsters[name]["age_group"] = "kid"
  when (18..64) then munsters[name]["age_group"] = "adult"
  when (65..1000) then munsters[name]["age_group"] = "senior"
  end
end

p munsters
```