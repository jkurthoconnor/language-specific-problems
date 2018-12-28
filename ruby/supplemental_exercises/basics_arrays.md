Ruby Basics [Arrays](https://launchschool.com/exercise_sets/43b48b60)

### 1.
In the code below, an array containing different types of pets is assigned to pets.

```ruby
pets = ['cat', 'dog', 'fish', 'lizard']
```

Select 'fish' from pets, assign the return value to a variable named my_pet, then print the value of my_pet.

Expected output:
I have a pet fish!

### Solution:
```ruby
pets = ['cat', 'dog', 'fish', 'lizard']

my_pet = pets[2]
puts "I have a pet #{my_pet}"
```

### 2.
In the code below, an array containing different types of pets is assigned to pets.


 Select 'fish' and 'lizard' from pets at the same time, assign the return value to a variable named my_pets, then print the value of my_pets.

 Expected output:

I have a pet fish and a pet lizard!

### Solution:
```ruby
pets = ['cat', 'dog', 'fish', 'lizard']
my_pets = pets[2..-1]
puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}."
```

### 3.
In the code below, an array containing different types of pets is assigned to pets. Also, the return value of pets[2..3], which is ['fish', 'lizard'], is assigned to my_pets.

```ruby
pets = ['cat', 'dog', 'fish', 'lizard']
my_pets = pets[2..3]
```

Remove 'lizard' from my_pets then print the value of my_pets.

Expected output:

I have a pet fish!

### Solution
```ruby
pets = ['cat', 'dog', 'fish', 'lizard']
my_pets = pets[2..3]

my_pets.delete('lizard')
puts "I have a pet #{my_pets[0]}!"
```

### 4.
Using the code below, select 'dog' from pets, add the return value to my_pets, then print the value of my_pets.

```ruby
pets = ['cat', 'dog', 'fish', 'lizard']
my_pets = pets[2..3]
my_pets.pop
```
Expected output:

I have a pet fish and a pet dog!

### Solution:
```ruby
pets = ['cat', 'dog', 'fish', 'lizard']
my_pets = pets[2..3]
my_pets.pop
my_pets << pets[1]

puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}"
```

### 5.
In the code below, an array containing different types of colors is assigned to colors.

```ruby
colors = ['red', 'yellow', 'purple', 'green']
```
Use Array#each to iterate over colors and print each element.

Expected output:

I'm the color red!
I'm the color yellow!
I'm the color purple!
I'm the color green!

### Solution:
```ruby
colors = ['red', 'yellow', 'purple', 'green']
colors.each { |color| puts "I'm the color #{color}!"}
```

### 6.
In the code below, an array containing the numbers 1 through 5 is assigned to numbers.
```ruby
numbers = [1, 2, 3, 4, 5]
```
Use Array#map to iterate over numbers and return a new array with each number doubled. Assign the returned array to a variable named doubled_numbers and print its value using #p.

Expected output:

[2, 4, 6, 8, 10]

### Solution:
```ruby
numbers = [1, 2, 3, 4, 5]
doubled_numbers = numbers.map { |n| n * 2}
p doubled_numbers
```

### 7.
In the code below, an array containing five numbers is assigned to numbers.
```ruby
numbers = [5, 9, 21, 26, 39]
```
Use Array#select to iterate over numbers and return a new array that contains only numbers divisible by three. Assign the returned array to a variable named divisible_by_three and print its value using #p.

Expected output:

[9, 21, 39]

### Solution:
```ruby
numbers = [5, 9, 21, 26, 39]
div_by_three = numbers.select { |n| (n % 3).zero? }
p div_by_three
```

### 8.
The following array contains three names and numbers. Group each name with the number following it by placing the pair in their own array. Then create a nested array containing all three groups. What does this look like? (You don't need to write any code here. Just alter the value shown so it meets the exercise requirements.)

```ruby
['Dave', 7, 'Miranda', 3, 'Jason', 11]
```

### Solution:

[ ['Dave', 7], ['Miranda', 3], ['Jason', 11] ]

### 9.
In the code below, a nested array containing three groups of names and numbers is assigned to favorites.

```ruby
favorites = [['Dave', 7], ['Miranda', 3], ['Jason', 11]]
```

Use Array#flatten to flatten favorites so that it's no longer a nested array. Then assign the flattened array to a variable named flat_favorites and print its value using #p.

### Solution:
```ruby
favorites = [['Dave', 7], ['Miranda', 3], ['Jason', 11]]
flat_favs = favorites.flatten
p flat_favs
```

### 10.
In the code below, two arrays containing several numbers are assigned to two variables, array1 and array2.

```ruby
array1 = [1, 5, 9]
array2 = [1, 9, 5]
```
Compare array1 and array2 and print true or false based on whether they match.

### Solution:
```ruby
array1 = [1, 5, 9]
array2 = [1, 9, 5]

puts array1 == array2
```
