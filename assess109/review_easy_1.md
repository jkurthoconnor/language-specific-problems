## Exercises: Course 101, Lesson 3, Easy 1
(Re-working exercises as review for assessment 109)

#### Q 1.
What would you expect the code below to print out?

````ruby
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
````


#### Answer
The code will print out the items in the numbers array, including duplicates. `puts` will iterate through the array and print out each item on its own line.

#### Q 2.
Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios: 1. what is != and where should you use it? 2. put ! before something, like !user_name 3. put ! after something, like words.uniq! 4. put ? before something 5. put ? after something 6. put !! before something, like !!user_name

#### Answer
1. `!=` is the 'not equal' Boolean operator.  It is used to code something like 'A is not equal to B'.  This example would be coded as 'a != b'.  It would evaluate to `true` when the values of `a` and `b` are not identical.  Use this in Boolean expressions or other instances in which one wants a true or false return value.
2. When one puts `!` before something, say `expression`,  `!expression` returns the opposite truth value of `expression`. But the `!` does not alter the truth value of `expression`.
3. putting `!` after something does nothing by itself, but it is used in many cases as a convention to indicate the difference between a method and its mutating counterpart.  See `.uniq` & `.uniq!`.

#### Q 3.
Replace the word "important" with "urgent" in this string:

````ruby
advice = "Few things in life are as important as house training your pet dinosaur."
````

### Answer
```` ruby
advice = "Few things in life are as important as house training your pet dinosaur."

advice.gsub!('important', 'urgent')
````
In this case, calling `sub!` would have provided the same return because there is only one instance of the specified string to be substituted.  `gsub!` returns a new string with all instances of the element removed; `sub!` returns a new string with only the first instance removed.

#### Q 4.

````ruby
numbers = [1, 2, 3, 4, 5]
````
What does the follow method calls do (assume we reset numbers to the original array between method calls)?
````ruby
numbers.delete_at(1)
numbers.delete(1)
````

#### Answer

`numbers.delete_at(1)` will delete the element at index 1 in the`numbers` array (viz.`2`).  It will return the deleted element.

`numbers.delete(1)` will delete all occurrences of `1` in the `numbers` array.  It will return the deleted element.

#### Q 5.
Programmatically determine if 42 lies between 10 and 100.

#### Answer

````ruby
(10..100).include?(42)
````

OR

```ruby
range = 10..100
range.include?(42)
```

#### Q 6.
Starting with the string:
````ruby
famous_words = "seven years ago..."
````
show two different ways to put the expected "Four score and " in front of it.


#### Answer
````ruby
famous_words = "seven years ago..."
addition = 'Four score and '

addition + famous_words
complete = addition + famous_words
famous_words.insert(0, addition)

````
There's an important difference between the three approaches.  While all return 'Four score and seven years ago...', calling `insert` actually modifies the string, so it is returning the modified string; Using `+` to concatenate two strings leaves each string as it was, and assigning `complete` to the concatenation of `addition` and `famous_words` creates a new string, but leaves the original strings as they were.

#### Q 7.
Fun with gsub:
````ruby
def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep
````
This gives us a string that looks like a "recursive" method call:
````ruby
"add_eight(add_eight(add_eight(add_eight(add_eight(number)))))"
````
If we take advantage of Ruby's Kernel#eval method to have it execute this string as if it were a "recursive" method call
````ruby
eval(how_deep)
````
what will be the result?


#### Answer

#### Q 8.
If we build an array like this:
````ruby
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
````
We will end up with this "nested" array:
````ruby
["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
````
Make this into an un-nested array.

#### Answer
````ruby
flinstones = ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
flinstones.flatten!
````


#### Q 9.
Given the hash below
````ruby
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
````
Turn this into an array containing only two elements: Barney's name and Barney's number

#### Answer
```ruby
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

barney = flintstones.assoc("Barney")
```

OR
```ruby
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

flintstones.select { |name, number| number == 2 }.to_a.flatten

```

#### Q 10.
Given the array below
````ruby
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
````
Turn this array into a hash where the names are the keys and the values are the positions in the array.

#### Answer

````ruby
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

characters = {}

flintstones.map { |name| characters[name] = flintstones.index(name) }

p characters
````

or

````ruby
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

characters = {}

flintstones.each_with_index { |name, index| characters[name] = index }

p characters
````

or

```ruby
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

names = {}

flintstones.each do |name|
  names[name] = flintstones.index(name)
end

p names
```