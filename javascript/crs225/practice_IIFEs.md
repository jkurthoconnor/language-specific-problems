# LS Practice: [IIFEs]()

## Problem 1:

Will the code below execute?

```javascript
function() {
  console.log("Sometimes, syntax isn't intuitive!")
}();
```

### Solution:

No it will not execute. The function definition is not wrapped in parens, so it will not be evaluated as an expression. Without returning a value, the syntaxt of the concluding parens will not be understood, resulting in a SyntaxError.

## Problem 2:

Edit the code from above so that it executes without error. 

### Solution:

```javascript
(function() {
  console.log("Sometimes, syntax isn't intuitive!")
})();
```

## Problem 3:

The code below throws an error. What kind of problem does this error highlight? Use an IIFE to address it, so that the code runs without error.

```javascript
var sum = 0;
var numbers;

sum += 10;
sum += 31;

numbers = [1, 7, -3, 3];

function sum(arr) {
  return arr.reduce(function(sum, number) {
    sum += number;
    return sum;
  }, 0);
}

sum += sum(numbers);  // ?
```

### Solution:

The general problem is a name conflict with the identifier `sum`. Because of hoisting, the function named `sum` claims the name first, but is immediately reassigned to hold a primitive. `sum` thus no longer points to a function, and therefore cannot be invoked as one on the concluding line.

The code is fixed by replacing the function `sum` with an IIFE, as follows:

```javascript
var sum = 0;
var numbers;

sum += 10;
sum += 31;

numbers = [1, 7, -3, 3];

sum += (function(arr) {
  return arr.reduce(function(sum, number) {
    sum += number;
    return sum;
  }, 0);
})(numbers);
```

## Problem 4:

Consider the output below. Implement a function `countdown` that uses an IIFE to generate the desired output.

```javascript
countdown(7);
7
6
5
4
3
2
1
0
Done!
```

### Solution:

```javascript
function countdown(start) {
  (function () {
    for (var i = start; i >= 0; i -= 1) {
      console.log(i);
    }
  })();

  console.log('Done!');
}
```

## Problem 5:

Is the named function inside in this IIFE accessible in the global scope?

```javascript
(function foo() {
  console.log('Bar');
})();

foo() // ?
```

### Solution:

No it is not accessible in global scope. The IIFE creates its own scope and the function `foo` is within it, inaccessible to global scope.

## Problem 6:

For an extra challenge, refactor the solution to problem 4 using recursion, bearing in mind that a named function created in an IIFE can be referenced inside of the IIFE.

### Solution:

```javascript
function countdown(start) {
  (function sub(n) {
    console.log(n);

    if (n === 0) {
      console.log('Done!');
    } else {
      sub(n - 1));
    }
  })(start);
}
```
