### Exercises for Lesson 2: [Inheritance](https://launchschool.com/lessons/dfff5f6b/assignments/69729798)

1) Suppose we're building a software system for a pet hotel business, so our classes deal with pets.

Given this class:

```ruby

class Dog
 def speak
   'bark!'
 end

 def swim
   'swimming!'
 end
end

teddy = Dog.new
puts teddy.speak           # => "bark!"
puts teddy.swim           # => "swimming!"
```
One problem is that we need to keep track of different breeds of dogs, since they have slightly different behaviors. For example, bulldogs can't swim, but all other dogs can.

Create a sub-class from Dog called Bulldog overriding the swim method to return "can't swim!"

Solution:
```ruby

class Dog
 def speak
   'bark!'
 end

 def swim
   'swimming!'
 end
end

class BullDog < Dog
  def swim
    "Can't swim!"
  end
end

teddy = Dog.new
puts teddy.speak           # => "bark!"
puts teddy.swim           # => "swimming!"
bowser = BullDog.new
puts bowser.speak
puts bowser.swim
```

2) Let's create a few more methods for our Dog class.

```ruby

class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def run
    'running!'
  end

  def jump
    'jumping!'
  end

  def fetch
    'fetching!'
  end
end
```
Create a new class called Cat, which can do everything a dog can, except swim or fetch. Assume the methods do the exact same thing. Hint: don't just copy and paste all methods in Dog into Cat; try to come up with some class hierarchy.


Solution:
```ruby

class HouseMammal
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < HouseMammal
  def speak
    'bark!'
  end
  
  def swim
    'swimming!'
  end
  
  def fetch
    'fetching!'
  end
end

class BullDog < Dog
  def swim
    "Can't swim!"
  end
end
  
class Cat < HouseMammal
  def speak
    'meow!'
  end
end
  
fido = Dog.new
puts fido.speak
tiger = Cat.new
puts tiger.speak
butch = Dog.new
puts butch.swim

```

3) Draw a class hierarchy diagram of the classes from step #2

Solution:

HouseMammal

- Dog    
    - BullDog  

- Cat
        

4) What is the method lookup path and how is it important?

Solution:

The method lookup path is the path Ruby takes to find a method that has been invoked. 

The order is as follows:

1) check the calling object's class' own methods. 

2) check the modules mixed into the calling object's own class

3) check the calling object's class' superclass
  
  4) check the modules mixed into the superclass
  
Recognizing the order is important because it allows one to override an inherited method by including a different method by the same name earlier in the path.