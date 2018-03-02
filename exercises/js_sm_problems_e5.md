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

```javascript
```

### Solution

```javascript

```


## Problem 4:

```javascript
```

### Solution

```javascript

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
