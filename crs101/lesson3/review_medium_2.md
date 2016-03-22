## Exercises Medium 2

#### Q 1

Hashes are commonly found to be more complex than the simple one we saw earlier:

```ruby
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
```

It is often the case that each key points to another hash instead of a single value:

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}
```

Figure out the total age of just the male members of the family.


#### Answer

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

male_age = 0
munsters.each_key do |name|
  if munsters[name]["gender"].start_with?("m") # why must name of hsh be included? it isn't in sample answer for what looks like a similar situation?
    male_age = male_age + munsters[name]["age"]
  end
end

p male_age
```

#### Q 2
One of the most frequently used real-world string properties is that of "string substitution", where we take a hard-coded string and modify it with various parameters from our program.

Given this previously seen family hash, print out the name, age and gender of each family member:

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}
```
...like this:
```ruby
(Name) is a (age) year old (male or female).
```

#### Answer

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  puts "#{name} is a #{details["age"]} year old #{details["gender"]}."
end
```

#### Q 3

In an earlier exercise we saw that depending on variables to be modified by called methods can be tricky:

```ruby
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```
We learned that whether the above "coincidentally" does what we think we wanted "depends" upon what is going on inside the method.

How can we refactor this exercise to make the result easier to predict and easier for the next programmer to maintain?

#### Answer

If the goal is to modify both variables, then I'd change the second line:

```ruby
def tricky_method(a_string_param, an_array_param)
  a_string_param << "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"
```

#### Q 4 

A quick glance at the docs for the Ruby String class will have you scratching your head over the absence of any "word iterator" methods.

Our natural inclination is to think of the words in a sentence as a collection. We would like to be able to operate on those words the same way we operate on the elements of an array. Where are the `String#each_word` and the `String#map_words` methods?

A common idiom used to solve this conundrum is to use the `String#split` in conjunction with `Array#join` methods to break our string up and then put it back together again.

Use this technique to break up the following string and put it back together with the words in reverse order:
 ```ruby
sentence = "Humpty Dumpty sat on a wall."
```

#### A

```ruby
sentence = "Humpty Dumpty sat on a wall."
reverse_sent = sentence.split.reverse.join(' ')
reverse_sent = reverse_sent.delete('.')
p reverse_sent
```