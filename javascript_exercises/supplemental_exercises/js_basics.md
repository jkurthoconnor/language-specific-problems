LS Exercises: [JavaScript Basics](https://launchschool.com/exercise_sets/c39a2eed)

1. Building Strings:
Why won't this code run?

```javascript
var paragraph = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sed \
                ligula at risus vulputate faucibus. Aliquam venenatis nibh ut justo dignissim \
                dignissim. Proin dictum purus mollis diam auctor sollicitudin. Ut in bibendum \
                ligula. Suspendisse quam ante, dictum aliquam tristique id, porttitor pulvinar \
                diam. Maecenas blandit aliquet ipsum. Integer vitae sapien sed nulla rutrum \   
                hendrerit ac a urna. Interdum et malesuada fames ac ante ipsum primis in faucibus.';

console.log(paragraph);
```


Answer:
Prior to the final line, the backslash escaped carriage return has space chars in front of it, so the return isn't actually escaped; this throws an error.

Also, the extra spaces at the front of each line thrown in for attractive formatting end up appearing in the text once the syntax error is resolved.

If the code formatting is desired, then the declaraton and assignment could use string concatenation:

```javascript
      var paragraph = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sed' +
                      ' ligula at risus vulputate faucibus. Aliquam venenatis nibh ut justo dignissim' +
                      ' dignissim. Proin dictum purus mollis diam auctor sollicitudin. Ut in bibendum' +
                      ' ligula. Suspendisse quam ante, dictum aliquam tristique id, porttitor pulvinar' +
                      ' diam. Maecenas blandit aliquet ipsum. Integer vitae sapien sed nulla rutrum' +
                      ' hendrerit ac a urna. Interdum et malesuada fames ac ante ipsum primis in faucibus.';

// but the AirBnB style guide cautions against both concatenation and escaped returns. The preference is one long line. If it turns out the line breaks in the source are desired in the string itself, then inserting `\n` at each required break would be the solution. If the breaks are merely for legibility in the source code, then a single line without escaped new line chars would be preferred, as follows:

var paragraph = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sed ligula at risus vulputate faucibus. Aliquam venenatis nibh ut justo dignissim dignissim. Proin dictum purus mollis diam auctor sollicitudin. Ut in bibendum ligula. Suspendisse quam ante, dictum aliquam tristique id, porttitor pulvinar diam. Maecenas blandit aliquet ipsum. Integer vitae sapien sed nulla rutrum hendrerit ac a urna. Interdum et malesuada fames ac ante ipsum primis in faucibus.';

```


2. Go over the code.  What does it log to the console?

```javascript
var myBoolean = true;
var myString = 'hello';
var myArray = [];
var myOtherString = '';

if (myBoolean) {
  console.log('Hello');
}

if (!myString) {
  console.log('World');
}

if (!!myArray) {
  console.log('World');
}

if (myOtherString || myArray) {
  console.log('!');
}
```

Solution:
Line 45: 'Hello'
Line 49: logs nothing; `!myString` evaluates to `false`
Line 53: logs 'World'; `!!myArray` evaluates to `true` 
Line 57: logs '!'; `(myOtherString || myArray)` returns `myArray`, which evaluates to `true`


3. Go over the code below and specify how many possible flows/paths there are.

```javascript
if (condition1) {
  // ...
  if (condition2) {
    // ...
  } else {
    // ...
  }
} else {
  // ...
  if (condition4) {
    // ...
    if (condition5) {
    // ...
    }
  }
}
```

Solution:
When conditon 1 is true and
  - 1. condition 2 is true or
  - 2 . condition 2 is false
When condition 1 is false
  - condition 4 is true and
    - 3. condition 5 is true or
    - 4. condition 5 is false
  - 5. condition 4 is false


4. What does this code log? Can you explain these results? 

```javascript
var name = 'Bob';
var saveName = name;
name.toUpperCase();
console.log(name, saveName);
```

Solution: 
The code logs `Bob Bob`. This is because strings are primitive types in JS, thus they are immutable.  While `name.toUpperCase()` returns a new, uppercased string, the program does nothing with that value, and the original value to which `name` points remains unchanged.

Further Exploration:
How is it possible that even though this string is a primitive, it is able to call a method?

Solution:
When a method is called on a primitive, JS briefly creates an object of the appropriate type (assuming there is a corresponding constructor) from the primitive's value and uses that object to call the method. Once the method returns, it is discarded.  
5. Arithmetic Integer

Here is the code for the program:

```javascript
var number1 = prompt('Enter the first number:');
var number2 = prompt('Enter the second number:');

console.log(number1 + ' + ' + number2 + ' = ' + (number1 + number2));
console.log(number1 + ' - ' + number2 + ' = ' + (number1 - number2));
console.log(number1 + ' * ' + number2 + ' = ' + (number1 * number2));
console.log(number1 + ' / ' + number2 + ' = ' + Math.floor(number1 / number2));
console.log(number1 + ' % ' + number2 + ' = ' + (number1 % number2));
console.log(number1 + ' ** ' + number2 + ' = ' + Math.pow(number1, number2));
```

Here are the expected results:

```bash
Enter the first number: 23
Enter the second number: 17

23 + 17 = 40
23 - 17 = 6
23 * 17 = 391
23 / 17 = 1
23 % 17 = 6
23 ** 17 = 1.4105003956066297e+23
```

Solution:

The results did not match expectations for the first operation, the addition. This is because the `+` operator, when working with string operands, performs string concatenation.  The rest of the logs match expectations, but they rely on JS's implicit type coercion to work. The underlying issue is that `number1` and `number2` are strings, and they are never reassigned to the number equivalents, nor are their number equivalents explicitly used in the mathematical formulae. Better code would not rely upon the implicit conversions.  The following is an improvement on the original, but only partially; note that it still relies on the implicit conversion now to make the string concatenation work. Ideally, we'd not rely on any implicit conversion.

```javascript
      var number1 = Number(prompt('Enter the first number:'));
      var number2 =  Number(prompt('Enter the second number:'));

      console.log(number1 + ' + ' + number2 + ' = ' + (number1 + number2));
      console.log(number1 + ' - ' + number2 + ' = ' + (number1 - number2));
      console.log(number1 + ' * ' + number2 + ' = ' + (number1 * number2));
      console.log(number1 + ' / ' + number2 + ' = ' + Math.floor(number1 / number2));
      console.log(number1 + ' % ' + number2 + ' = ' + (number1 % number2));
      console.log(number1 + ' ** ' + number2 + ' = ' + Math.pow(number1, number2));

// solution that does not rely on implicit coercion:
var num1 = prompt('Enter the first number:');
var num2 = prompt('Enter the second number:');
var num1Int = parseInt(num1, 10);
var num2Int = parseInt(num2, 10);

console.log(num1 + ' + ' + num2 + ' = ' + (num1Int + num2Int));
console.log(num1 + ' - ' + num2 + ' = ' + (num1Int - num2Int));
console.log(num1 + ' * ' + num2 + ' = ' + (num1Int * num2Int));
console.log(num1 + ' / ' + num2 + ' = ' + Math.floor(num1Int / num2Int));
console.log(num1 + ' % ' + num2 + ' = ' + (num1Int % num2Int));
console.log(num1 + ' ** ' + num2 + ' = ' + Math.pow(num1Int, num2Int));
```


6. Counting the Number of Characters

In this exercise, you will write a program that asks the user for a phrase, then outputs the number of characters in that phrase. Go over the documentation for String to find an appropriate method to use.

```javascript
Please enter a phrase: walk
// console output
There are 4 characters in "walk".

Please enter a phrase: walk, don't run
// console output
There are 15 characters in "walk, don't run".
```


Solution:

```javascript
var phrase = prompt('Please enter a phrase:');
var charCount = String(phrase.length);

console.log('There are ' + charCount + ' characters in "' + phrase + '".');

// using ES6 template literals:
var request = 'Please enter a phrase: ';
var phrase = prompt(`${request}`);

console.log(`There are ${String(phrase.length)} characters in "${phrase}".`);

// Further Exploration

var phrase = prompt('Please enter a phrase:');
var charCount = String(phrase.replace(/[^a-z]/ig, '').length);

console.log('There are ' + charCount + ' characters in "' + phrase + '".');

// using template literals:
var request = 'Please enter a phrase: ';
var phrase = prompt(`${request}`);
var count = String(phrase.replace(/[^a-z]/ig, '').length);

console.log(`There are ${count} characters in "${phrase}".`);
```


7.  For this exercise we're going to learn more about type conversion by implementing our own parseInt function that converts a string of numeric characters (including an optional plus or minus sign) to a number.

The function takes a string of digits as an argument, and returns the appropriate number. Do not use any of the built-in functions for converting a string to a number type.

For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

Examples:

```javascript
stringToInteger('4321');      // 4321
stringToInteger('570');       // 570
```

Solution:

```javascript
var STR_TO_INT = {
  '0': 0,
  '1': 1,
  '2': 2,
  '3': 3,
  '4': 4,
  '5': 5,
  '6': 6,
  '7': 7,
  '8': 8,
  '9': 9,
}

function stringToInteger(str) {
  var digits = str.split('').reverse();
  var sum = 0;
  var placeValue;
  var i;

  for (i = 0; i < digits.length; i++) {
    placeValue = 10 ** i;
    sum += STR_TO_INT[digits[i]] * placeValue;
  }
  return sum;
}
console.log(stringToInteger('4321'));
console.log(stringToInteger('570'));

// extracted look-up table to helper method to avoid reliance on global variables
function stringToInteger(numStr) {
  var reversedNums = numStr.split('').reverse();
  var result = 0; 

  for (i = 0; i < reversedNums.length; i += 1) {
    result += convertDigit(reversedNums[i]) * Math.pow(10, i);
  }

  return result;
}

function convertDigit(str) {
  var translation = {
    '0': 0,
    '1': 1,
    '2': 2,
    '3': 3,
    '4': 4,
    '5': 5,
    '6': 6,
    '7': 7,
    '8': 8,
    '9': 9,
  };

  return translation[str];
}

console.log(stringToInteger('401592'));
console.log(stringToInteger('5001'));
console.log(stringToInteger('5000'));
    
```

8.  Write a function that takes a string of digits, and returns the appropriate number as an integer.  The string may have a leading + or - sign; if the first character is a +, your function should return a positive number; if it is a -, your function should return a negative number. If there is no sign, return a positive number.

You may assume the string will always contain a valid number.

Examples:
```javascript
stringToSignedInteger('4321');      // 4321
stringToSignedInteger('-570');      // -570
stringToSignedInteger('+100');      // 100
```

Solution

```javascript
var STR_TO_INT = {
  '0': 0,
  '1': 1,
  '2': 2,
  '3': 3,
  '4': 4,
  '5': 5,
  '6': 6,
  '7': 7,
  '8': 8,
  '9': 9,
}

function stringToInteger(str) {
  var digits = str.split('').reverse();
  var sum = 0;
  var placeValue;
  var i;

  for (i = 0; i < digits.length; i++) {
    placeValue = 10 ** i;
    sum += STR_TO_INT[digits[i]] * placeValue;
  }
  return sum;
}

function stringToSignedInteger(str) {
  var sign = str[0];
  var string = (/[+-]/.test(sign)) ? str.slice(1) : str;
  var value = stringToInteger(string);

  return (sign === '-') ? -value : value;
}

// or, simply refactoring stringToInteger:
function stringToSignedInteger(numStr) {
  var negative = (numStr[0] === '-');
  var digits = (numStr[0].match(/\d/) ? numStr : numStr.slice(1));
  var reversedNums = digits.split('').reverse();
  var result = 0; 

  for (i = 0; i < reversedNums.length; i += 1) {
    result += convertDigit(reversedNums[i]) * Math.pow(10, i);
  }

  return (negative ? result * -1 : result);
}

function convertDigit(str) {
  var translation = {
    '0': 0,
    '1': 1,
    '2': 2,
    '3': 3,
    '4': 4,
    '5': 5,
    '6': 6,
    '7': 7,
    '8': 8,
    '9': 9,
  };

  return translation[str];
}
```

9.  You will learn more about converting strings to numbers by writing a function that takes a positive integer or zero, and converts it to a string representation.
You may not use any of the standard conversion functions available in JavaScript, such as String(), Number.prototype.toString, or an expression such as '' + number. Your function should do this the old-fashioned way and construct the string by analyzing and manipulating the number.

Examples:

```javascript
integerToString(4321);      // "4321"
integerToString(0);         // "0"
integerToString(5000);      // "5000"
```

Solution:

```javascript
var INT_TO_STRING = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

function integerToString(int) {
  var i;
  var modulo;
  var digits = [];

  do {
    modulo = int % 10;
    int = Math.floor(int / 10);
    digits.unshift(INT_TO_STRING[modulo]);
  } while (int > 0) 

  return digits.join('');
}

console.log(integerToString(4321));      // "4321"
console.log(integerToString(0));         // "0"
console.log(integerToString(5000));      // "5000"

// refactored to avoid reliance on global vars and to use map:
function integerToString(int) {
  var numbers = [];
  var digits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

  do {
    numbers.unshift(int % 10);
    int = Math.floor(int / 10);
  } while (int > 0);
    
  return numbers.map(function (n) {
    return digits[n];
  }).join('');
}
```

10.  In the previous exercise, you reimplemented a function that converts non-negative numbers to strings. In this exercise, you're going to extend that function by adding the ability to represent negative numbers.

You may not use any of the standard conversion functions available in JavaScript, such as String(), Number.prototype.toString, or an expression such as '' + number. You may, however, use the integerToString function from the previous exercise.

Examples:
```javascript
signedIntegerToString(4321);      // "+4321"
signedIntegerToString(-123);      // "-123"
signedIntegerToString(0);         // "0"
```
 


Solution.
```javascript
var INT_TO_STRING = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

function integerToString(int) {
  var i;
  var modulo;
  var digits = [];

  do {
    modulo = int % 10;
    int = Math.floor(int / 10);
    digits.unshift(INT_TO_STRING[modulo]);
  } while (int > 0) 

  return digits.join('');
}

function signedIntegerToString(int) {
  var signedNum;
  var numerals = integerToString(Math.abs(int));

  if (int > 0) {
    signedNum = '+' + numerals;
  } else if (int < 0) {
    signedNum = '-' + numerals;
  } else {
    signedNum = numerals;
  }

  return signedNum;
}
```
