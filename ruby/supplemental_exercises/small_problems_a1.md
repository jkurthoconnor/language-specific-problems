01-109: Small Problems:
[Advanced 1](https://launchschool.com/exercise_sets/1b40a3fd)

1. Madlibs Revisited

Let's build another program using madlibs. We made a program like this in the easy exercises. This time, the requirements are a bit different.

Make a madlibs program that reads in some text from a text file that you have created, and then plugs in a selection of randomized nouns, verbs, adjectives, and adverbs into that text and prints it. You can build your lists of nouns, verbs, adjectives, and adverbs directly into your program, but the text data should come from a file or other external source. Your program should read this text, and for each line, it should place random words of the appropriate types into the text, and print the result.


### Solution

```ruby
text = File.read('scrap_madlibs.txt')
SUBS = { 'noun' => ['dog', 'cat', 'turtle', 'punk band', 'asbestos crew',
          'tree'],
          'verb' => ['rub', 'walk', 'drink', 'eat', 'tune', 'shower'],
          'adj'=> ['happy', 'sad', 'well-fed', 'sleep-deprived', 'eager', 'depressed'],
          'adv'=> ['quickly', 'slowly', 'sadly', 'reluctantly', 'hungrily', 'voraciously']
        }

 
def madlibs(content)
  content.split(/\b/).map { |word| SUBS[word] ? SUBS[word].sample : word }.join
end
```

### Seeing Stars

Write a method that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the method. The smallest such star you need to handle is a 7x7 grid.

Examples
```ruby
star(7)

*  *  *
 * * *
  ***
*******
  ***
 * * *
*  *  *
star(9)

*   *   *
 *  *  *
  * * *
   ***
*********
   ***
  * * *
 *  *  *
*   *   *
```

### Solution:

```ruby

```
