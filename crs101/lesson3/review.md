(Reworking course exercises to prepare for assessment)

- [] return to complete e1 q2
- [] return to e1 q7
- update notes based on methods used in solutions
  - [x] easy 1
  - [x] easy 2
  - [x] easy 3

## Exercises: Easy 1

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

famous_words.insert(0, addition)
addition + famous_words
````
There's an important difference between the two approaches.  While both return 'Four score and seven years ago...', calling `insert` actually modifies the string, so it is returning the modified string; Using `+` to concatenate two strings leaves each string as it was.

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
````ruby
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

barney = flintstones.assoc("Barney")
````


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
****
## Exercises: Easy 2

#### Q 1
In this hash of people and their age,

````ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
````

see if there is an age present for "Spot".

Bonus: What are two other hash methods that would work just as well for this solution?

#### Answer

````ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.include?("Spot")
ages["Spot"]
ages.values_at("Spot")

````
----

#### Q 2
Add up all of the ages from our current Munster family hash:

````ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
````

#### Answer
````ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

p ages.values.inject { |sum, age| sum + age }

````
---
#### Q 3
In the age hash:

````ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
````

throw out the really old people (age 100 or older).

#### Answer
````ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.select { |name, age| age < 100 }
````
---

#### Q 4
Starting with this string:
````ruby
munsters_description = "The Munsters are creepy in a good way."
````

Convert the string in the following ways (code will be executed on original munsters_description above):

````ruby
"The munsters are creepy in a good way."
"tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
"the munsters are creepy in a good way."
"THE MUNSTERS ARE CREEPY IN A GOOD WAY."
````

#### Answer
````ruby
munsters_description = "The Munsters are creepy in a good way."
munsters_description.capitalize!

munsters_description = "The Munsters are creepy in a good way."
munsters_description.swapcase!

munsters_description = "The Munsters are creepy in a good way."
munsters_description.downcase!

munsters_description = "The Munsters are creepy in a good way."
munsters_description.upcase!

````
---

#### Q 5
We have most of the Munster family in our age hash:
````ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
````

add ages for Marilyn and Spot to the existing hash
````ruby
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
````

#### Answer

````ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
ages["Marilyn"] = 22
ages["Spot"] = 237

````
---

#### Q 6
Pick out the minimum age from our current Munster family hash:

````ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
````

#### Answer

````ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.min # returns key & value for minimum in hash
ages.values.min # returns minimum value in hash

````

#### Q 7
See if the name "Dino" appears in the string below:
```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```

#### Answer
```ruby
advice = "Few things in life are as important as house training your pet dinosaur."

advice.include?("Dino")
```


#### Q 8
In the array:
```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

Find the index of the first name that starts with "Be"


#### Answer

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.find_index { |name| name.start_with?('Be')}

```
#### Q 9
Using array#map!, shorten each of these names to just 3 characters:

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```


#### Answer

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |name| name.slice(0, 3)}
```
#### Q 10

Again, shorten each of these names to just 3 characters -- but this time do it all on one line:

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

#### Answer

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |name| name.slice(0, 3)}
```

## Exercises: Easy 3

#### Q 1

Show an easier way to write this array:

```ruby
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
```

#### Answer 1

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

```

#### Q 2

How can we add the family pet "Dino" to our usual array:

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

```

#### Answer 2

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.push 'Dino'
```

#### Q 3

In the previous exercise we added Dino to our array like this:

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"
```

We could have used either `Array#concat` or `Array#push` to add Dino to the family.

How can we add multiple items to our array? (Dino and Hoppy)

#### Answer 3
```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.push 'Dino', 'Hoppy'
```

or
```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
pets = %w(Dino Hoppy)

flintstones = flintstones + pets
```

#### Q 4
Shorten this sentence:

```ruby
advice = "Few things in life are as important as house training your pet dinosaur."
```

...remove everything starting from "house".

Review the `String#slice!` documentation, and use that method to make the return value "Few things in life are as important as ". But leave the advice variable as "house training your pet dinosaur.".

As a bonus, what happens if you use the `String#slice` method instead?


#### Answer 4

```ruby
advice = "Few things in life are as important as house training your pet dinosaur."

advice.slice!(0, 39)
```
If I used
```ruby
advice.slice(0, 39)
```
the return would be the same as when I used `.slice!`.  That is it would return the first 39 characters of `advice`; the difference is that the `advice` string would remain unmodified in using `.slice`.

#### Q 5

Write a one-liner to count the number of lower-case 't' characters in the following string:

```ruby
statement = "The Flintstones Rock!"
```

#### Answer 5

```ruby
statement = "The Flintstones Rock!"
statement.count('t')
```

#### Q 6

Back in the stone age (before CSS) we used spaces to align things on the screen. If we had a 40 character wide table of Flintstone family members, how could we easily center that title above the table with spaces?

```ruby
title = "Flintstone Family Members"
```

#### Answer 6

```ruby
title = "Flintstone Family Members"
title.center(40)
```
