## Exercises: Course 101, Lesson 3, Hard 1
(Re-working exercises as review for assessment 109)

#### Question 1

What do you expect to happen when the greeting variable is referenced in the last line of the code below?
```ruby
if false
  greeting = “hello world”
end

greeting
```

#### A

Referencing `greeting` will return nothing, or rather `nil` because the value 'hello world' has not been stored under the `greeting` variable.  It is interesting to note, though, that this will not throw an `undefined method or local variable` exception, which it would had `greeting` not been initialized.  So even though `greeting` is not assigned the value in the conditional statement because the test isn't met (no expression has evaluated to `false`) its presence in the conditional seems to count as variable initialization.  Given the return of `nil`, it must have been initialized to point to `nil`.


#### Question 2

What is the result of the last line in the code below?
```ruby
greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings 
```

#### A
The last line of code will output the hash `greetings` and return `nil`.  `greetings` will have had the value stored at `a:` mutated, so the value is 'hi there'.