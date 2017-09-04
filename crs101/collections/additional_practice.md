# Practice Problems: [Additional Practice](https://launchschool.com/lessons/85376b6d/assignments/a76c28ac)

### 1. Given the array below

```ruby
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
```

Turn this array into a hash where the names are the keys and the values are the positions in the array.

#### Solution

Manually looping through the collection:
```ruby

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

idx = 0
flint_hash = {}

while idx < flintstones.size
  key = flintstones[idx]
  flint_hash[key] = idx
  idx += 1
end

flint_hash
```

Using `each_with_object`:
```ruby
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
idx = 0

flint_hash = flintstones.each_with_object({}) do |name, hash|
  hash[name] = idx
  idx += 1
end

flint_hash
```


### 2. Add up all of the ages from the Munster family hash:

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
```

#### Solution
```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

total_age = ages.map { |_, age| age }.reduce(:+)
```


### 3. In the age hash:

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
```

throw out the really old people (age 100 or older).

#### Solution

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.select! { |_, age| age < 100 } 
```


### 4. Pick out the minimum age from our current Munster family hash:

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
```

#### Solution

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.values.min

# or more manually

keys = ages.keys
youngest = ages[keys[0]]

keys.each do |key|
  current_age = ages[key]
  (youngest = current_age) if current_age < youngest
end
```


### 5. In the array:

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
```

Find the index of the first name that starts with "Be"

#### Solution

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

first_match_idx = nil

flintstones.each_with_index do |name, idx|
  if name =~ /^Be/
    first_match_idx = idx
    break
  end
end
```


### 6. Amend this array so that the names are all shortened to just the first three characters:

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

```

#### Solution

```ruby
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

idx = 0

while idx < flintstones.size
  flintstones[idx] = flintstones[idx][0..2]
  idx += 1
end
```


### 7. Create a hash that expresses the frequency with which each letter occurs in this string:

```ruby
statement = "The Flintstones Rock"

ex:

{ "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }
```

#### Solution

```ruby
statement = "The Flintstones Rock"

count = {}

statement.chars.each do |char|
  next unless char =~ /[a-z]/i
  count[char] ? count[char] += 1 : count[char] = 1
end
```


### 8. What happens when we modify an array while we are iterating over it? What would be output by this code?

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

#### Solution

Modifying an array while iterating over it can lead to jumping over elements.

The first code example would output `1` and then `3`. `2` would be skipped entirely because `numbers.shift(1)` would remove `1`, allowing `2` to slide forward into the spot occupied by `1`.  Thus the second iteration would begin with `3`, which now occupies the second spot in the array. `4` would be skipped for similar reasons.

The second code example would output `1` and then `2`, but it would stop there because the last two elements would have been `pop`ed off of the end of the array.


### 9. As we have seen previously we can use some built-in string methods to change the case of a string. A notably missing method is something provided in Rails, but not in Ruby itself...titleize. This method in Ruby on Rails creates a string that has each word capitalized as it would be in a title. For example, the string:

```ruby
words = "the flintstones rock"
```
would be:
```ruby
words = "The Flintstones Rock"
```

Write your own version of the rails titleize implementation.

#### Solution

```ruby
def titleize(string)
  string.split.map { |word| word.capitalize }.join(' ')
end
```


### 10. Given the munsters hash below

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

#### Solution

```ruby
munsters.each do |name, details|

  case details['age']
  when (0..17)  then details['age_group'] = 'kid'
  when (18..64) then details['age_group'] = 'adult'
  else               details['age_group'] = 'senior'
  end
end
```
