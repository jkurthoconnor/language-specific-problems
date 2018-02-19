
LS Exercises: [Small Problems Easy 3](https://launchschool.com/exercise_sets/829c41b0)


## Problem 1:
Build a program that randomly generates Teddy's age, and logs it to the console. Have the age be a random number between `20` and `200` (inclusive).


### Solution
```javascript
function randomInRange(min, max) {
  var range = max - min;
  var additive = Math.random() * range;

  return Math.ceil(additive + min);
}

console.log('Teddy is ' + randomInRange(20, 200) + ' years old!');
```
### Further Exploration
Would it make a difference if `Math.round()` were used in the sample solution?

Solution: yes; the sample relies on `Math.floor()` to level any potential fractional values above the maximum.  Given the right random input, `Math.round()` would potentially round up to the integer one greater than the maximum.

What could be done to make the code more robust, for example, to allow for inadvertantly passing arguments out of order?

Solution: The values for `max` and `min` could be reassigned if the arguments wereout of order. See below.
```javascript
function randomInRange(min, max) {
  var swap;
  var range;
  var additive;

  if (max < min) {
    swap = max;
    max = min;
    min = swap;
  }

  range = max - min;
  additive = Math.random() * range;

  return Math.ceil(additive + min);
}


```

## Problem 2:

```javascript
```

### Solution

```javascript

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
