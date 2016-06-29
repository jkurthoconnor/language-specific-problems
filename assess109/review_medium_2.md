## Exercises: Course 101, Lesson 3, Medium 2
(Re-working exercises as review for assessment 109)

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

munsters.each do |name, info|
  if info["gender"] == "male"
    male_age += info["age"]
  end
end

p male_age

# or

male_age = 0
munsters.each_key do |name|
  if munsters[name]["gender"].start_with?("m") 
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

reversed = sentence.split.reverse.join(' ').delete('.').insert(-1, '.')
```

#### Q 5

What is the output of the following code?

```ruby
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8
```

#### Answer

`p answer - 8` will print out `34`.  This is because `some_number += 8` is a variable reassignment, and reassignments within methods do not persist outside the method.  Thus the value for `answer` remains 42, and `answer - 8` equals 34.


#### Q 6
One day Spot was playing with the Munster family's home computer and he wrote a small program to mess with their demographic data:

```ruby
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end
```

After writing this method, he typed the following...and before Grandpa could stop him, he hit the Enter key with his tail:
```ruby
mess_with_demographics(munsters)
```

Did the family's data get ransacked, or did the mischief only mangle a local copy of the original hash? (why?)

#### A
The hash will have been changed by the method.  Although the use of `=` initially appears to be reassignment, they actually change the values stored under the designated keys.  These mutations are persistent.  However,there is no indication that the original hash is modified in the executable file, so all one would need to do is rerun the program to return hash to its original values.

#### Q 7

#### A