# LS Exercises: [JS Small Problems, Easy 2](https://launchschool.com/exercise_sets/0cfd16b0)



## 1. Ddaaiillyyddoouubbllee

Write a function that takes a string argument, and returns a new string that contains the value of the original string with all consecutive duplicate characters collased into a single character.

```bash
crunch('ddaaiillyy ddoouubbllee');    // "daily double"
crunch('4444abcabccba');              // "4abcabcba"
crunch('ggggggggggggggg');            // "g"
crunch('a');                          // "a"
crunch('');                           // ""
```
### Solution

```javascript
function crunch(str) {
  var cleanStr = '';
  var lastIdx;
  var i;

  for (i = 0; i < str.length; i++) {
    lastIdx = cleanStr.length - 1;
    if (cleanStr[lastIdx] !== str[i]) {
      cleanStr += str[i];
    }
  }

  return cleanStr;
}

// with regex
function crunch(str) {
 return str.replace(/(.)\1+/g, '$1');
}
```

## 2. Bannerizer
Write a function that will take a short line of text, and write it to the console log within a box.


Examples:
```bash
logInBox('To boldly go where no one has gone before.');


+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

logInBox('');
+--+
|  |
|  |
|  |
+--+
```

### Solution

```javascript
function logInBox(text) {
  var horizontalFrame = '+-';
  var paddedRow = '| ';
  var textRow = paddedRow + text + ' |';
  var i;

  for (i = 1; i <= text.length; i++) {
    horizontalFrame += '-';
  }

  for (i = 1; i <= text.length; i++) {
    paddedRow += ' ';
  }

  paddedRow += ' |';
  horizontalFrame += '-+';

  console.log(horizontalFrame);
  console.log(paddedRow);
  console.log(textRow);
  console.log(paddedRow);
  console.log(horizontalFrame);
}

// further exploration: with optional maxWidth argument to enforce truncation

function logInBox(text, maxWidth) {
  var sliceUpTo;
  var textRow;
  var horizontalFrame;
  var paddedRow;

  if (text.length + 4 > maxWidth) {
    sliceUpTo = maxWidth - 4;
    text = text.slice(0, sliceUpTo);
  }

  textRow = '| ' + text + ' |';
  horizontalFrame = '+-' + '-'.repeat(text.length) + '-+';
  paddedRow = '| ' + ' '.repeat(text.length) + ' |';

  console.log(horizontalFrame);
  console.log(paddedRow);
  console.log(textRow);
  console.log(paddedRow);
  console.log(horizontalFrame);
}

logInBox('To boldly go where no one has gone before.', 40);
logInBox('To boldly go where no one has gone before.');
logInBox('To boldly go where no one has gone before.', 47);
logInBox('');
```

## 3. Stringy Strings
Write a funciton that takes one argument, a positive integer, and returns a string of alternating '1's and '0's, alway starting with a '1'. The length of thestring should match the given integer.

stringy(6);    // "101010"
stringy(9);    // "101010101"
stringy(4);    // "1010"
stringy(7);    // "1010101"



### Solution

```javascript
function stringy(reps) {
  var i;
  var str = '';

  for (i = 1; i <= reps; i++) {
    if (i % 2 === 0) {
      str += '0';
    } else {
      str += '1';
    }
  }
  
  return str;
}
```
## 4. Fibonacci Number Location by length
The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that the first two numbers are 1 by definition, and each subsequent number is the sum of the two previous numbers. This series appears throughout the natural world.

Computationally, the Fibonacci series is a simple series, but the results grow at an incredibly rapid rate. For example, the 100th Fibonacci number is 354,224,848,179,261,915,075—that's enormous, especially considering that it takes six iterations just to find the first 2-digit Fibonacci number.

Write a function that calculates and returns the index of the first Fibonacci number that has the number of digits specified by the argument. (The first Fibonacci number has an index of 1.)

You may assume that the argument is always an integer greater than or equal to 2.

```bash
findFibonacciIndexByLength(2);       // 7
findFibonacciIndexByLength(10);      // 45
findFibonacciIndexByLength(16);      // 74
```


### Solution

```javascript
// assuming `length` >= 2

function findFibonacciIndexByLength(length) {
  var newFib;
  var fibIdx = 7;
  var fibLength = 2;
  var a = 8;
  var b = 13;

  if (length === 2) {
    return fibIdx;
  }

  do {
    newFib = a + b;
    fibIdx += 1;
    a = b;
    b = newFib;
  } while (String(newFib).length);

  return fibIdx;
}
```
## 5.Right Triangles

```bash

```


### Solution

```javascript
```

## 6. Madlibs

```javascript
```


### Solution

```javascript
```
## 7. Double Doubles


```bash

```


### Solution

```javascript
```
## 8. Grade Book


```bash

```


### Solution

```javascript
```
## 9. Clean UP the Words

```bash
```


### Solution

```javascript
```
## 10. What Century is That

```bash
```


### Solution

```javascript
```
