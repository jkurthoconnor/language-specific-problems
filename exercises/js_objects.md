LS Exercises: [JS Fundamentals: Objects](https://launchschool.com/exercise_sets/7912d84c)


## Problem 1:
Identify the bug in the following code. Don't run the code until after you've tried to answer.

```javascript
var myObject = {
  a: 'name',
  'b': 'test',
  123: 'c',
  1: 'd',
};

myObject[1];
myObject[a];
myObject.a;
```

### Solution
`myObject[a]` raises an `Uncaught ReferenceError` because when bracket notation does not immediately find a string, or a value that can be converted to a string, bracket notation attempts to evaluate `a` as variable , but there is no associated value or function for which `a` is an identifier.

`myObject.a` works because dot notation requires identifiers, so there is no attempt on the interpreter to evaluate an expression.


## Problem 2:


In the following code, a user creates a person object literal and defines two methods for returning the person's first and last names. What is the result when the user tries out the code on the last line?

```javascript
var person = {
  firstName: function () {
    return 'Victor';
  },
  lastName: function () {
    return 'Reyes';
  },
};

console.log(person.firstName + ' ' + person.lastName);
```

### Solution
The functions are not actually being called in the last line of the program because the `()` are missing. Instead, a string representation of the function in each case is simply being displayed as the value of keys `firstName` and `lastName`.


## Problem 3:


What will the following code log to the console and why? Don't run the code until after you have tried to answer.

```javascript
var array1 = ['Moe', 'Larry', 'Curly', 'Chemp', 'Harpo', 'Chico', 'Groucho', 'Zeppo'];
var array2 = [];
var i;

for (i = 0; i < array1.length; i += 1) {
  array2.push(array1[i]);
}

for (i = 0; i < array1.length; i += 1) {
  if (array1[i].startsWith('C')) {
    array1[i] = array1[i].toUpperCase();
  }
}

console.log(array2);
```

### Solution
`array2` was formed by copying the primitive values (i.e. strings) that constitute the elements in `array1`. This means that the two arrays have, immediately after the first loop has completed, contents that consist of duplicated values. Thus, when `array1` is modified in loop 2, the values of `array2` remain unaffected.

Logging `array2` gives us: ` ['Moe', 'Larry', 'Curly', 'Chemp', 'Harpo', 'Chico', 'Groucho', 'Zeppo']`



## Problem 4:
What will the following code log to the console and why? Don't run the code until after you have tried to answer.

```javascript
var myObject = {
  prop1: '123',
  prop2: '234',
  'prop 3': '345',
};

var prop2 = '456';
myObject['prop2'] = '456';
myObject[prop2] = '678';

console.log(myObject[prop2]);
console.log(myObject.prop2);
```

### Solution

```javascript
var myObject = {
  prop1: '123',
  prop2: '234',
  'prop 3': '345',
};

var prop2 = '456';
myObject['prop2'] = '456'; // sets `'prop2'` value to `'456'`, because
                           // bracket notation expects a string,
                           // when it finds one it does not attempt
                           // to evaluate any potential expressions,
                           // instead it simply accesses `'prop2'` in `myObject`
                           // and reassigns its value
myObject[prop2] = '678';   // sets a new property, `'456'` to point to the value
                           // `'678'`, because the interpreter does not find a
                           // string within brackets, it evaluates the expression
                           // `prop2`, which evaluates to `'456'` (the value of
                           // the local var `prop2`; since there is no property
                           // in `myObject` by the name `'456'`, this line of
                           // code sets a new property `'456'` to hold `'678'`

console.log(myObject[prop2]); // "678"
console.log(myObject.prop2); // "456"
```

### Further Exploration:
What will be logged this time?

```javascript
var myObj = {};
myObj[myFunc()] = 'hello, ';  // the function declaration for `myFunc()` has
                              // been hoisted, so `myFunc()` is evaluated and
                              // called, returning `'funcProp'`; `'funcProp'`
                              // is then used as the property name which
                              // is given the value '`hello, '`

function myFunc() {
  return 'funcProp';
}

console.log(myObj);          // `{funcProp: 'hello, '}`
myObj[myFunc()] = 'world!';  // `myFunc` is evaluated/called and returns
                             // `'funcProp'`; this, in turn, is used to reassign
                             //  the value of that property to `'world!'`
console.log(myObj);          // `{ funcProp : 'world!'}`
```

## Problem 5:

What will this code log to the console?
```javascript
var myArray = ['a', 'b', 'c'];

console.log(myArray[0]);
console.log(myArray[-1]);

myArray[-1] = 'd';
myArray['e'] = 5;
myArray[3] = 'f';

console.log(myArray[-1]);
console.log(myArray['e']);
console.log(myArray);
```

### Solution

```javascript
var myArray = ['a', 'b', 'c'];

console.log(myArray[0]);  // `'a'` -- `0` is an index with the value `'a'`
console.log(myArray[-1]); // `undefined` -- `-1` is neither a valid index
                          // nor is it another property name in the array

myArray[-1] = 'd';       // value `'d'` is assigned to new property name `-1`
myArray['e'] = 5;        // value `5` is assigned to new property name `'e'`
myArray[3] = 'f';        // value `'f'` is assigned to index `3`

console.log(myArray[-1]); // `'d'`
console.log(myArray['e']); // `5`
```


## Problem 6:
A user wrote a function that takes an array as an argument and returns its average. Given the code below, the user expects the `average` function to return `5`. Is the user's expectation correct? Why or why not?

```javascript
var myArray = [5, 5];
myArray[-1] = 5;
myArray[-2] = 5;

function average(array) {
  var sum = 0;
  var i;

  for (i = -2; i < array.length; i += 1) {
    sum += array[i];
  }

  return sum / array.length;
}

average(myArray);
```

### Solution

```javascript
function average(array) {
  var sum = 0;
  var i;

  for (i = -2; i < array.length; i += 1) {
    sum += array[i];
  }

  return sum / array.length;
}

console.log(average(myArray)); // 10 -- `array.length` returns an integer
                               // value one greater than the largest index
                               // in this case, that's `2`; the loop, however
                               // calculates `sum` by adding all the values 
                               // for all the properties, even not elements
                               // thus at the time of the return statement
                               // `sum` holds `20`
                               // a user expecting `5` to be logged will be
                               // mistaken, as s/he misunderstands the difference
                               // between array elements and key: value pairs
                               // stored in an array object
```

### Further Exploration
Refactor the code so the function returns the expected result of `5`

```javascript
function average(array) {
  var sum = 0;
  var i;
  var keys = Object.keys(array);

  for (i = 0; i < keys.length; i += 1) {
    sum += array[keys[i]];
  }

  return sum / keys.length;
}

console.log(average(myArray));
```
## Problem 7:
The calculateBonus function calculates the bonus for a given salary. It makes use of two arguments for determining the bonus: a salary amount and a boolean switch. If the boolean is true, the bonus should be half of the salary; otherwise the bonus should be 0. Fill in the blanks in the function so that it will work, then explain why it works.

Examples:
```javascript
function calculateBonus() {
  return _________[1] ? _________[0] / 2 : 0;
}

calculateBonus(2800, true);               // 1400
calculateBonus(1000, false);              // 0
calculateBonus(50000, true);              // 25000
```

### Solution

```javascript
function calculateBonus() {
  return arguments[1] ? arguments[0] / 2 : 0;
}

console.log(calculateBonus(2800, true));               // 1400
console.log(calculateBonus(1000, false));              // 0
console.log(calculateBonus(50000, true));              // 25000

```


## Problem 8:
The penultimate function takes a string as an argument and returns the next-to-last word in the string. The function assumes that "words" are any sequence of non-whitespace characters. The function also assumes that the input string will always contain at least two words. The penultimate function in the example below does not return the expected result. Run the code below, check the current result, identify the problem, explain what the problem is, and provide a working solution.

Examples:

```javascript
function penultimate(string) {
  return string.split(' ')[-2];
}

penultimate('last word');                    // expected: "last"
penultimate('Launch School is great!');      // expected: "is"
```

### Solution
The problem with the original code is that it attempts to index into the array using a negative index; this is not an option in JS. To fix the code and allow indexing into the penultimate element of the array returned by the `.split()` call, you'd need to subtract 2 from the array's length;

```javascript
function penultimate(string) {
var words = string.split(' ');
var penultIdx = words.length - 2;

  return words[penultIdx];
}

console.log(penultimate('last word'));                    // expected: "last"
console.log(penultimate('Launch School is great!'));      // expected: "is"
```


## Problem 9:


We can use the number of minutes before or after midnight to represent the time of day. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

The timeOfDay function below takes a time argument using this minute-based format, and returns the time of day in 24-hour format ("hh:mm"). Reimplement the function using JavaScript's Date object.

Examples:
```javascript
timeOfDay(0);          // "00:00"
timeOfDay(-3);         // "23:57"
timeOfDay(35);         // "00:35"
timeOfDay(-1437);      // "00:03"
timeOfDay(3000);       // "02:00"
timeOfDay(800);        // "13:20"
timeOfDay(-4231);      // "01:29"

// Note: Disregard Daylight Saving Time, Standard Time, and other complications.

var MINUTES_PER_HOUR = 60;
var HOURS_PER_DAY = 24;
var MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR;

function timeOfDay(deltaMinutes) {
  var hours;
  var minutes;

  deltaMinutes = deltaMinutes % MINUTES_PER_DAY;
  if (deltaMinutes < 0) {
    deltaMinutes = MINUTES_PER_DAY + deltaMinutes;
  }

  hours = Math.floor(deltaMinutes / MINUTES_PER_HOUR);
  minutes = deltaMinutes % MINUTES_PER_HOUR;

  return padWithZeroes(hours, 2) + ':' + padWithZeroes(minutes, 2);
}

function padWithZeroes(number, length) {
  var numberString = String(number);

  while (numberString.length < length) {
    numberString = '0' + numberString;
  }

  return numberString;
}
```

### Solution

```javascript
function timeOfDay(deltaMinutes) {
  var day = new Date(1970, 0, 1, 0, deltaMinutes);
  var hours = String(day.getHours());
  var minutes = String(day.getMinutes());

  return hours.padStart(2, '0') + ':' + minutes.padStart(2, '0');
}

```


## Problem 10:
Use the `Date` object to refactor the following methods; note that they take a string representing 24hour time and return the number of minutes before or after midnight.

```javascript
afterMidnight('00:00');       // 0
beforeMidnight('00:00');      // 0
afterMidnight('12:34');       // 754
beforeMidnight('12:34');      // 686
```

### Solution

```javascript
function afterMidnight(timeString) {
  var midnight = new Date(2000, 0, 1, 0, 0);
  var parsedTime = timeString.split(':');
  var hours = parsedTime[0];
  var minutes = parsedTime[1];
  var resultTime = new Date(2000, 0, 1, Number(hours), Number(minutes));

  return ((resultTime - midnight) / 1000) / 60;
}

function beforeMidnight(timeString) {
  var MIN_PER_DAY = 1440;
  var timeAfter = afterMidnight(timeString);
  var timeBefore = MIN_PER_DAY - timeAfter;

  return (timeBefore === MIN_PER_DAY ? 0 : timeBefore);
}
```
