
LS Exercises: [Medium Problems 1](https://launchschool.com/exercise_sets/d9f7b773)


## Problem 1:

Write a function that rotates an array by moving the first element to the end of the array. Do not modify the original array.

    If the input is not an array, return undefined.
    If the input is an empty array, return an empty array.

Review the test cases below, then implement the solution accordingly.

```javascript
rotateArray([7, 3, 5, 2, 9, 1]);       // [3, 5, 2, 9, 1, 7]
rotateArray(['a', 'b', 'c']);          // ["b", "c", "a"]
rotateArray(['a']);                    // ["a"]
rotateArray([1, 'a', 3, 'c']);         // ["a", 3, "c", 1]
rotateArray([{ a: 2 }, [1, 2], 3]);    // [[1, 2], 3, { a: 2 }]
rotateArray([]);                       // []

// return `undefined` if the argument is not an array
rotateArray();                         // undefined
rotateArray(1);                        // undefined


// the input array is not mutated
var array = [1, 2, 3, 4];
rotateArray(array);                    // [2, 3, 4, 1]
array;                                 // [1, 2, 3, 4]


```

### Solution

```javascript
// the return of `slice` called on an empty array is an empty array
// so using that method here prevents need for a guard statement to
// catch empty input arrays; bracket accessing into an empty array would 
// return `undefined` for the specified index, so that approach requires
// separate handling of empty array inputs

function rotateArray(arr) {
  if (!Array.isArray(arr)) {
    return undefined;
  }

  return arr.slice(1).concat(arr.slice(0, 1));
}
```


## Problem 2:

Write a function that rotates the last n digits of a number. For the rotation, rotate by one digit to the left, moving the first digit to the end.

Examples:
```javascript
rotateRightmostDigits(735291, 1);      // 735291
rotateRightmostDigits(735291, 2);      // 735219
rotateRightmostDigits(735291, 3);      // 735912
rotateRightmostDigits(735291, 4);      // 732915
rotateRightmostDigits(735291, 5);      // 752913
rotateRightmostDigits(735291, 6);      // 352917
```

### Solution

```javascript
function rotateRightmostDigits(digits, rotation) {
  var numberStr = String(digits);
  var startRotationIdx = numberStr.length - rotation;
  var base = numberStr.slice(0, startRotationIdx);
  var target = numberStr.slice(startRotationIdx);
  var rotated = target.slice(1) + target[0];

  if (typeof digits !== 'number') {
    return NaN;
  }

  return Number(base + rotated);
}

console.log(rotateRightmostDigits(735291, 1));      // 735291
console.log(rotateRightmostDigits(735291, 2));      // 735219
console.log(rotateRightmostDigits(735291, 3));      // 735912
console.log(rotateRightmostDigits(735291, 4));      // 732915
console.log(rotateRightmostDigits(735291, 5));      // 752913
console.log(rotateRightmostDigits(735291, 6));      // 352917
console.log(rotateRightmostDigits('hjesa', 6));      // NaN
```


## Problem 3:
Take the number 735291 and rotate it by one digit to the left, getting 352917. Next, keep the first digit fixed in place and rotate the remaining digits to get 329175. Keep the first two digits fixed in place and rotate again to get 321759. Keep the first three digits fixed in place and rotate again to get 321597. Finally, keep the first four digits fixed in place and rotate the final two digits to get 321579. The resulting number is called the maximum rotation of the original number.

Write a function that takes an integer as an argument, and returns the maximum rotation of that integer. You can (and probably should) use the rotateRightmostDigits function from the previous exercise.

Examples:

```javascript
maxRotation(735291);          // 321579
maxRotation(3);               // 3
maxRotation(35);              // 53
maxRotation(105);             // 15 -- the leading zero gets dropped
maxRotation(8703529146);      // 7321609845
```

### Solution

```javascript
function maxRotation(number) {
  var numberStr = String(number);
  var i;

  if (typeof number !== 'number') {
    return NaN;
  }

  for (i = numberStr.length; i > 1; i -= 1) {
    numberStr = rotateRightmostDigits(numberStr, i);
  }

  return Number(numberStr);
}

function rotateRightmostDigits(digits, rotation) {
  var startRotationIdx = digits.length - rotation;
  var base = digits.slice(0, startRotationIdx);
  var target = digits.slice(startRotationIdx);
  var rotated = target.slice(1) + target[0];

  return base + rotated;
}

console.log(maxRotation(735291));          // 321579
console.log(maxRotation(3));               // 3
console.log(maxRotation(35));              // 53
console.log(maxRotation(105));             // 15 -- the leading zero gets dropped
console.log(maxRotation(8703529146));      // 7321609845

```


## Problem 4:
A stack is a list of values that grows and shrinks dynamically. A stack may be implemented as an Array that uses two Array methods: Array.prototype.push and Array.prototype.pop.

A stack-and-register programming language is a language that uses a stack of values. Each operation in the language operates on a register, which can be thought of as the current value. The register is not part of the stack. An operation that requires two values pops the topmost item from the stack (i.e., the operation removes the most recently pushed value from the stack), operates on the popped value and the register value, and stores the result back in the register.

Consider a MULT operation in a stack-and-register language. It multiplies the stack value with the register value, removes the value from the stack, and stores the result back in the register. For example, if we start with a stack of [3, 6, 4] (where 4 is the topmost item in the stack) and a register value of 7, the MULT operation transforms the stack to [3, 6] (the 4 is removed), and the result of the multiplication, 28, is left in the register. If we do another MULT at this point, the stack is transformed to [3], and the register is left with the value 168.

Write a function that implements a miniature stack-and-register-based programming language that has the following commands (also called operations or tokens):

    n : Place a value, n, in the register. Do not modify the stack.
    PUSH : Push the register value onto the stack. Leave the value in the register.
    ADD : Pop a value from the stack and add it to the register value, storing the result in the register.
    SUB : Pop a value from the stack and subtract it from the register value, storing the result in the register.
    MULT : Pop a value from the stack and multiply it by the register value, storing the result in the register.
    DIV : Pop a value from the stack and divide it into the register value, storing the integer result in the register.
    MOD : Pop a value from the stack and divide it into the register value, storing the integer remainder of the division in the register.
    POP : Remove the topmost item from the stack and place it in the register.
    PRINT : Print the register value.

All operations are integer operations (which is only important with DIV and MOD).

Programs will be supplied to your language function via a string argument. Your function may assume that all arguments are valid programs — i.e., they will not do anything like trying to pop a non-existent value from the stack, and they will not contain any unknown tokens.

Initialize the stack and register to the values [] and 0, respectively.

Examples:

```javscript
minilang('PRINT');
// 0

minilang('5 PUSH 3 MULT PRINT');
// 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT');
// 5
// 3
// 8

minilang('5 PUSH POP PRINT');
// 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT');
// 5
// 10
// 4
// 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT');
// 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT');
// 12

minilang('-3 PUSH 5 SUB PRINT');
// 8

minilang('6 PUSH');
// (nothing is printed because the `program` argument has no `PRINT` comma
```

### Solution

```javascript
// Further Exploration: with error handling
function minilang(program) {
  var stack = [];
  var register = 0;
  var tokens = program.split(' ');
  var emptyStackRisks = ['MULT', 'ADD', 'SUB', 'POP', 'DIV', 'MOD'];

  tokens.forEach(function (token) {
    if (/^[\-+]?\d+$/.test(token)) {
      register = parseInt(token, 10);
    } else {
      try {
      execute(token);
      } catch (error) {
        console.log(error.name + error.message);
      }
    }
  });

  function execute(operation) {
    if (stack.length === 0 && emptyStackRisks.indexOf(operation) >= 0) {
      throw new Error(`: Cannot ${operation} on empty stack.`);
    }

    switch (operation) {
      case 'PUSH':
        stack.push(register);
        break;
      case 'MULT':
        register *= stack.pop();
        break;
      case 'PRINT':
        console.log(register);
        break;
      case 'ADD':
        register += stack.pop();
        break;
      case 'SUB':
        register -= stack.pop();
        break;
      case 'POP':
        register = stack.pop();
        break;
      case 'DIV':
        register = Math.floor(register / stack.pop());
        break;
      case 'MOD':
        register %= Math.floor(stack.pop());
        break;
      default:
        throw new TypeError(`: unknown token ${operation}.`);
    }
  }
}

minilang('MULT PRINT');
// throws empty stack exception

minilang('PRINT');
// 0

minilang('5 PUSH 3 MULT PRINT');
// 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT');
// 5
// 3
// 8

minilang('5 PUSH POP PRINT');
// 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT');
// 5
// 10
// 4
// 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT');
// 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT');
// 12

minilang('-3 PUSH 5 SUB PRINT');
// 8

minilang('6 PUSH');
// (nothing is printed because the `program` argument has no `PRINT` comma

minilang('7 FLURB');
minilang('7a');
// TypeError

minilang('7 ADD');
minilang('MULT PRINT');
// empty stack exception
```


## Problem 5:


Write a function that takes a sentence string as an argument, and returns that string with every occurrence of a "number word" — 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' — converted to its corresponding digit character.

Example:

```javascript
wordToDigit('Please call me at five five five one two three four. Thanks.');
// "Please call me at 5 5 5 1 2 3 4. Thanks."
```

### Solution

```javascript
function wordToDigit(phrase) {
  var words = phrase.split(/\b/);

  return words.map(substituteDigits).join('');
}


function substituteDigits(word) {
  var numbers = {
    'zero': '0',
    'one': '1',
    'two': '2',
    'three': '3',
    'four': '4',
    'five': '5',
    'six': '6',
    'seven': '7',
    'eight': '8',
    'nine': '9',
  }

  if (Object.keys(numbers).includes(word)) {
    return numbers[word];
  } else {
    return word;
  }
}

console.log(wordToDigit('Please call me at five five five one two three four. Thanks.'));
// "Please call me at 5 5 5 1 2 3 4. Thanks."

// as a RegExp problem:
function wordToDigit(phrase) {
  var numbers = {
    'zero': '0',
    'one': '1',
    'two': '2',
    'three': '3',
    'four': '4',
    'five': '5',
    'six': '6',
    'seven': '7',
    'eight': '8',
    'nine': '9',
  }

  var numberWords = /\b(zero|one|two|three|four|five|six|seven|eight|nine)\b/gi;

  return phrase.replace(numberWords, function (match) {
    return numbers[match];
  });
}



console.log(wordToDigit('Please call me at five five five one two three four. Thanks.'));
// "Please call me at 5 5 5 1 2 3 4. Thanks."
console.log(wordToDigit('My two lonely cats are four years old.'));
// "My 2 lonely cats are 4 years old."
```


## Problem 6:

Write a recursive function that computes the nth Fibonacci number, where nth is an argument passed to the function.


Examples:
```javascript
fibonacci(1);       // 1
fibonacci(2);       // 1
fibonacci(3);       // 2
fibonacci(4);       // 3
fibonacci(5);       // 5
fibonacci(12);      // 144
fibonacci(20);      // 6765
```

### Solution

```javascript

function fibonacci(n) {
  if (n < 3) {
    return 1;
  } else {
    return fibonacci(n - 2) + fibonacci(n - 1);
  }
}

console.log(fibonacci(1));       // 1
console.log(fibonacci(2));       // 1
console.log(fibonacci(3));       // 2
console.log(fibonacci(4));       // 3
console.log(fibonacci(5));       // 5
console.log(fibonacci(12));      // 144
console.log(fibonacci(20));      // 6765


// or using ternary operator:

function fibonacci(n) {
  return n < 3 ? 1 : fibonacci(n - 2) + fibonacci(n - 1);
}
```


## Problem 7:

Rewrite your recursive fibonacci function so that it computes its results without using recursion.

Examples:
```javascript
fibonacci(20);       // 6765
fibonacci(50);       // 12586269025
fibonacci(100);      // 354224848179261915075
```

### Solution

```javascript
function fibonacci(n) {
  var i;
  var a = 1;
  var b = 1;

  for (i = 3; i <= n; i += 1) {
    b = a + b;
    a = b - a;
  }

  return b;
}
```


## Problem 8:
Our recursive fibonacci function from the previous exercise is not very efficient. It starts slowing down with an nth argument value as low as 35. One way to improve the performance of our recursive fibonacci function (and other recursive functions) is to use memoization.

Memoization is an approach that involves saving a computed answer for future reuse, instead of computing it from scratch every time it is needed. In the case of our recursive fibonacci function, using memoization saves calls to fibonacci(nth - 2) because the necessary values have already been computed by the recursive calls to fibonacci(nth - 1).

For this exercise, your objective is to refactor the recursive fibonacci function to use memoization.

### Solution

```javascript
var knownFibs = {};

function fibonacci(n) {
  if (n < 3) {
    return 1;
  } else {
    if (Object.keys(knownFibs).includes(n)) {
      return knownFibs[n];
    } else {
      knownFibs[n] = fibonacci(n - 2) + fibonacci(n - 1);
      return knownFibs[n];
    }
  }
}
```
