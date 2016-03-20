Exercises: Medium 1

#### Q Med. 1
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

#### Q Med 2

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
  frequencies.delete(' ')
end
```

#### Q Med 3

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

#### Q Med 4
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

#### Q Med 5
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

```
