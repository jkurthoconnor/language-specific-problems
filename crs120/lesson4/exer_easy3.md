### Exercises for Launch School Course 120, Lesson 4: [Easy 3](https://launchschool.com/lessons/f1c58be0/assignments/98073b61)

1) If we have this code:
```ruby
class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end
```
What happens in each of the following cases:

case 1:
```ruby
hello = Hello.new
hello.hi
```
Solution: the following will print to screen: `Hello`


case 2:
```ruby
hello = Hello.new
hello.bye
```
Solution:  `bye` is not a method that `Hello` class objects can access, so the code will throw an undefined method error.

case 3:
```ruby
hello = Hello.new
hello.greet
```
case 4:
```ruby
hello = Hello.new
hello.greet("Goodbye")
```
case 5:
```ruby
Hello.hi
```


