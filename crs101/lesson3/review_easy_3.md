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

