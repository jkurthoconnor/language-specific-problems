LS Exercises: [Small Problems: Easy 5](https://launchschool.com/exercise_sets/605aaeb8)


## Problem 1:
Write a function that takes a string, doubles every character in the string, and returns the result as a new string.


```javascript
repeater('Hello');        // "HHeelllloo"
repeater('Good job!');    // "GGoooodd  jjoobb!!"
repeater('');             // ""
```

### Solution

```javascript
// using compound reassignment
function repeater(str) {
  var repeated = '';
  var i;

  for (i = 0; i < str.length; i++) {
    repeated += str[i] + str[i];
  }

  return repeated;
}

// with `replace` and regex

function repeater(str) {
  return str.replace(/(.)/g, '$1$1');
}
```


## Problem 2:

Write a function that takes a string, doubles every consonant character in the string, and returns the result as a new string. The function should not double vowels, digits, punctuation, or whitespace.

```javascript
doubleConsonants('String');          // "SSttrrinngg"
doubleConsonants('Hello-World!');    // "HHellllo-WWorrlldd!"
doubleConsonants('July 4th');        // "JJullyy 4tthh"
doubleConsonants('');                // ""
```

### Solution

```javascript
// with an ugly regex
function doubleConsonants(str) {
  return str.replace(/([b-df-hj-np-tv-z])/gi, '$1$1');
}
```


## Problem 3:

Write a function that takes a postitve integer as an argument, and returns that number with its digits reversed.

```javascript
reverseNumber(12345);    // 54321
reverseNumber(12213);    // 31221
reverseNumber(456);      // 654
reverseNumber(12000);    // 21 -- Note that zeros get dropped!
reverseNumber(1);        // 1
```

### Solution

```javascript
function reverseNumber(num) {
var digits = String(num).split('');

return parseInt(digits.reverse().join(''), 10);
}
```


## Problem 4:

Write a function that takes a non-empty string argument, and returns the middle character(s) of the string. If the string has an odd `length`, you should return exactly one character. If the string has an even `length`, you should return exactly two charaters.

```javascript
centerOf('I Love Ruby');      // "e"
centerOf('Launch School');    // " "
centerOf('Launch');           // "un"
centerOf('Launchschool');     // "hs"
centerOf('x');                // "x"
```

### Solution

```javascript
function centerOf(str) {
  var center = Math.floor(str.length / 2);
  var odd = (str.length % 2) === 1;

  return odd ? str[center] : str.slice(center - 1, center + 1);
}
```


## Problem 5:

Write a function that takes a number as an argument. If the argument is a positive number, return the negative of that number. If the argument is a negative number, return it as-is.
```javascript

negative(5);     // -5
negative(-3);    // -3
negative(0);     // -0
```

### Solution

```javascript
function negative(num) {
  return num < 0 ? num : -num;
}
```


## Problem 6:

Write a function that takes an integer argument, and returns an array containing all integers between `1` and the argument (inclusive), in ascending order.

Your may assume that the argument will always be a positive integer.
```javascript
sequence(5);    // [1, 2, 3, 4, 5]
sequence(3);    // [1, 2, 3]
sequence(1);    // [1]
```

### Solution

```javascript
function sequence(n) {
  var seq = [];
  var i;

  for (i = 1; i <= n; i++) {
    seq.push(i);
  }

  return seq;
}
```


## Problem 7:

Write a function that takes a string argument consisting of a first name, a space, and a last name, and returns a new string consisting of the last name, a comma, a space, and the first name.

```javascript
swapName('Joe Roberts');    // "Roberts, Joe"
```

### Solution

```javascript
function swapName(name) {
  var names = name.split(' ');

  return names[1] + ', ' + names[0];
}

// using destructuring assignment
function swapName(name) {
  var [firstName, lastName] = name.split(' ');

  return lastName + ', ' + firstName;
}
```

Further Exploration:

What if a person had more than one first name? Refactor the current solution to accomodate this.

```javascript
function swapName(name) {
  var names = name.split(' ');
  var lastName = names.slice(-1);
  var firstNames = names.slice(0, -1);

  return lastName + ', ' + firstNames.join(' ');
}
```

## Problem 8:

Create a function that takes two integers as arguments. The first argument is a count, and the second is the starting number of a sequence that your function will create. The function should return an array containing the same number of elements as the count argument. The value of each element should be a multiple of the starting number.

You may assume that the count argument will always be an integer greater than or equal to 0. The starting number can be any integer. If the count is 0, the function should return an empty array.

```javascript
sequence(5, 1);          // [1, 2, 3, 4, 5]
sequence(4, -7);         // [-7, -14, -21, -28]
sequence(3, 0);          // [0, 0, 0]
sequence(0, 1000000);    // []
```

### Solution

```javascript
function sequence(count, start) {
  var factor;
  var seq = [];

  for (factor = 1; factor <= count; factor++) {
    seq.push(factor * start);
  }
  
  return seq;
}
```


## Problem 9:

Write a function that takes a string argument, and returns a new string containing the words from the string argument in reverse order.

Examples:

```javascript
reverseSentence('');                       // ""
reverseSentence('Hello World');            // "World Hello"
reverseSentence('Reverse these words');    // "words these Reverse"
```

### Solution

```javascript
function reverseSentence(sent) {
  var reversed = sent.split(' ').reverse();

  return reversed.join(' ');
}
```


## Problem 10:

Write a function that takes a string argument containing one or more words, and returns a new string containing the words from the string argument. All five-or-more letter words should have their letters in reverse order. The string argument will consist of only letters and spaces. Words will be separated by a single space.

Examples:

```javascript
reverseWords('Professional');             // "lanoisseforP"
reverseWords('Walk around the block');    // "Walk dnuora the kcolb"
reverseWords('Launch School');            // "hcnuaL loohcS"
```

### Solution

```javascript
function reverseWords(str) {
  var words = str.split(' ');
  var result = [];
  var i;

  for (i = 0; i < words.length; i++) {
    if (words[i].length >= 5) {
      result.push(revString(words[i]));
    } else {
      result.push(words[i]);
    }
  }

  function revString(string) {
    return string.split('').reverse().join('');
  }

  return result.join(' ');
}
```