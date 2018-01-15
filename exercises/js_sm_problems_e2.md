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
  } while (String(newFib).length < length);

  return fibIdx;
}
```
## 5.Right Triangles
Write a function that takes a positive integer, `n`, as an argument, and logs a right triangle whose sides each have `n` stars. The hypotenuse of the triangle should have one end at the lower-left of the triangle, and the other end at the upper-right.



```bash
// examples:
triangle(5);

    *
   **
  ***
 ****
*****

triangle(9);

        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********


```


### Solution

```javascript
// using ES6 `.repeat()`
function triangle(size) {
  var i;
  var row;

  for (i = 1; i <= size; i++) {
   row = '';
   row += ' '.repeat(size - i) + '*'.repeat(i);
   console.log(row);
  }
}

// using only resources available in ES5
function triangle(size) {
  var i;
  var row;

  for (i = 1; i <= size; i++) {
   row = '';
   row += repeat(' ', size - i) + repeat('*', i);
   console.log(row);
  }
}

function repeat(str, times) {
  var i;
  var result = '';

  for (i = 1; i <= times; i++) {
    result += str;
   }

   return result;
}

triangle(5);
triangle(9);
triangle(20);
    

triangle(5);
triangle(9);
```

## 6. Madlibs
Create a simple madlib program that prompts for a noun, a verb, an adverb, and an adjective, and injects them into a story that you create.

```bash
Enter a noun: dog
Enter a verb: walk
Enter an adjective: blue
Enter an adverb: quickly

// console output
Do you walk your blue dog quickly? That's hilarious!
```


### Solution

```javascript
function madLib() {
  var noun = '';
  var verb = '';
  var adjective = '';
  var adverb = '';

  noun = prompt('Enter a noun:');
  verb = prompt('Enter a verb:');
  adjective = prompt('Enter an adjective:');
  adverb = prompt('Enter an adverb:');

  console.log('So you ' + verb + ' your ' + adjective + ' ' +  noun + ' ' + adverb + ' ? Awesome!!')
}
```
## 7. Double Doubles
A double number is an even-length number whose left-side digits are exactly the same as its right-side digits.

Write a function that returns the number provided as an argument multiplied by two, unless the argument is a double number; return double numbers as-is.


```javascript
// Examples
twice(37);          // 74
twice(44);          // 44
twice(334433);      // 668866
twice(444);         // 888
twice(107);         // 214
twice(103103);      // 103103
twice(3333);        // 3333
twice(7676);        // 7676

```


### Solution

```javascript
function twice(num) {
  if (doubleNum(num)) {
    return num;
  }

  return num * 2
}

function doubleNum(num) {
  var digits = String(num);
  var slicePoint = digits.length / 2;
  var firstHalf = digits.slice(0, slicePoint);
  var secondHalf = digits.slice(slicePoint);

  return firstHalf === secondHalf;
}
```
## 8. Grade Book
Write a function that determines th mean (average) of the three scores passed to it, and returns th letter associated with that grade.

Numerical score letter grade list:

    90 <= score <= 100: 'A'
    80 <= score < 90: 'B'
    70 <= score < 80: 'C'
    60 <= score < 70: 'D'
    0 <= score < 60: 'F'

Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.

Examples:

getGrade(95, 90, 93);    // "A"
getGrade(50, 50, 95);    // "D"


### Solution

```javascript
function getGrade(g1, g2, g3) {
  var average;

  average = (g1 + g2 + g3) / 3;

  switch (true) {
    case average >= 90:
      return 'A';
    case average >= 80:
      return 'B';
    case average >= 70:
      return 'C';
    case average >= 60:
      return 'D';
    default:
      return 'F';
  }
}
```
## 9. Clean UP the Words
Given a string that consists of some words and an assortment of non-alphabetic characters, write a function that returns the string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (i.e., the result string should never have consecutive spaces).
```javascript
// example
cleanUp("---what's my +*& line?");    // " what s my line "
```


### Solution

```javascript
// with regex and `replace`:
function cleanUp(str) {
  return str.replace(/[^a-zA-Z]+/g, ' ');
  }
  
// looping
function cleanUp(str) {
  var i;
  var j;
  var cleanStr = '';

  for (i = 0; i < str.length; i++) {
    if (str[i].match(/[a-zA-Z]/)) {
      cleanStr += str[i];
    } else {
      cleanStr += ' ';
      for (j = i + 1; j < str.length; j++) {
        if (str[j].match(/[a-zA-Z]/)) {
          i = j - 1;
          break;
        }
      }
    }
  }

  return cleanStr;
}
```
## 10. What Century is That

```javascript
century(2000);        // "20th"
century(2001);        // "21st"
century(1965);        // "20th"
century(256);         // "3rd"
century(5);           // "1st"
century(10103);       // "102nd"
century(1052);        // "11th"
century(1127);        // "12th"
century(11201);       // "113th"
```


### Solution

```javascript
function century(year) {
  var cent;

  if (year % 100 === 0) {
    cent = year / 100;
  } else {
    cent = Math.floor(year / 100) + 1;
  }

  return ordinalString(cent);
}

function ordinalString(integer) {
  var digits = String(integer);
  var onesDigit = digits[digits.length - 1];
  var tensDigit = digits[digits.length - 2];
  var ordinalSuffix;

  if (tensDigit === '1') {
    ordinalSuffix = 'th';
  } else if (onesDigit === '1') {
    ordinalSuffix = 'st';
  } else if (onesDigit === '2') {
    ordinalSuffix = 'nd';
  } else if (onesDigit === '3') {
    ordinalSuffix = 'rd';
  } else {
    ordinalSuffix = 'th';
  }

  return digits + ordinalSuffix;
}

console.log(century(2000));        // "20th"
console.log(century(2001));        // "21st"
console.log(century(1965));        // "20th"
console.log(century(256));         // "3rd"
console.log(century(5));           // "1st"
console.log(century(10103));       // "102nd"
console.log(century(1052));        // "11th"
console.log(century(1127));        // "12th"
console.log(century(11201));       // "113th"
    
```
