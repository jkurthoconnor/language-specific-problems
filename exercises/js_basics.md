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
Line 49: logs nothing; `!myString` is translated to `false`
Line 53: logs 'World'; `!!myArray` is translated to `true` 
Line 57: logs '!'; `(myOtherString || myArray)` returns `myArray`, which is translated to `true`


3. Go over the code below and specify how many possible flows/paths there are.

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
The code logs `Bob Bob`. This is because strings are primitive types in JS, thus they are immutable.  While `name.toUpperCase()` returns a new, uppercased string, the original value to which `name` points remains unchanged.


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
```Enter the first number: 23
Enter the second number: 17

23 + 17 = 40
23 - 17 = 6
23 * 17 = 391
23 / 17 = 1
23 % 17 = 6
23 ** 17 = 1.4105003956066297e+23
```

Solution:

The results did not match expectations for the first operation, the addition. This is because the `+` operator, when wrapped with string operands, performs string concatenation.  The rest of the logs match expectations, but they rely on JS's implicit type coercion to work. The underlying issue is that `number1` and `number2` are strings, and they are never reassigned to the number equivalents, nor are their number equivalents explicitly used in the mathematical formulae. Better code would not rely upon the implicit conversions.  The following is an improvement on the original.

```javascript
      var number1 = Number(prompt('Enter the first number:'));
      var number2 =  Number(prompt('Enter the second number:'));

      console.log(number1 + ' + ' + number2 + ' = ' + (number1 + number2));
      console.log(number1 + ' - ' + number2 + ' = ' + (number1 - number2));
      console.log(number1 + ' * ' + number2 + ' = ' + (number1 * number2));
      console.log(number1 + ' / ' + number2 + ' = ' + Math.floor(number1 / number2));
      console.log(number1 + ' % ' + number2 + ' = ' + (number1 % number2));
      console.log(number1 + ' ** ' + number2 + ' = ' + Math.pow(number1, number2));
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
var charCount = phrase.length;

console.log('There are ' + charCount + ' characters in "' + phrase + '".');
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
function stringToInteger(str) {
  return str * 1;
}
console.log(stringToInteger('4321'));
console.log(stringToInteger('570'));
```
