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

```javascript
```

### Solution

```javascript

```


## Problem 6:

```javascript
```

### Solution

```javascript

```


## Problem 7:

```javascript
```

### Solution

```javascript

```


## Problem 8:

```javascript
```

### Solution

```javascript

```


## Problem 9:

```javascript
```

### Solution

```javascript

```


## Problem 10:

```javascript
```

### Solution

```javascript

```
