# LS Exercises: [JS Small Problems, Easy 1](https://launchschool.com/exercise_sets/7907e797)


## 1. Odd Numbers
Log all odd numbers from `1` to `99`, inclusive, to the console. Log all numbers on separate lines.


### Solution

```javascript
// simple version
function logOdds(start, stop) {
  var i;

  for (i = start; i <= stop; i++) {
    if (i % 2 === 1) {
      console.log(i);
    }
  }
}
logOdds(1, 99);


// faster: only requires remainder check once
function logOdds(start, stop) {
  var i;
  var firstOdd;

  firstOdd = (start % 2 === 1) ? start : start + 1;

  for (i = firstOdd; i <= stop; i += 2) {
    console.log(i);
  }
}


logOdds(1, 99);
logOdds(2, 292);
```

## 2. Even Numbers
Log all even numbers from `1` to `99`. inclusive, to the console. Log all numbers on separate lines.

### Solution

```javascript
function logEvens(start, stop) {
  var i;
  var firstEven;

  firstEven = (start % 2 === 0) ? start : start + 1;

  for (i = firstEven; i <= stop; i += 2) {
    console.log(i);
  }
}

logEvens(1, 99);
logEvens(2, 292);
```


## 3.How Big is the Room


Build a program that asks a user for the length and width of a room in meters, and then logs to the console the area of the room in both square meters and square feet.

Note: 1 square meter == 10.7639 square feet

Do not worry about validating the input at this time. Use the prompt() function to collect user input.

Example:

Enter the length of the room in meters:
10
Enter the width of the room in meters:
7
The area of the room is 70.00 square meters (753.47 square feet).



### Solution

```javascript
var FEET_PER_METER = 10.7639;
var meterLength;
var meterWidth;

function roomDimensions(length, width) {
  var meterArea = (length * width).toFixed(2);
  var feetArea =(meterArea * FEET_PER_METER).toFixed(2);
  return 'The area of the room is ' + meterArea + ' square meters (' + feetArea + ' square feet).'
}

meterLength = parseInt(prompt('Enter the length of the room in meters:'), 10);
meterWidth = parseInt(prompt('Enter the width of the room in meters:'), 10);

console.log(roomDimensions(meterLength, meterWidth));

// further exploration: add unit selection
var SQMETER_TO_FEET = 10.7639;
var SQFEET_TO_METERS = 0.0929;
var conversionFormula;
var length;
var width;
var entryUnit;
var displayUnit;
var convertedDisplayUnit;

function setUnits(units) {
  if (units === 'm') {
    conversionFormula = SQMETER_TO_FEET;
    displayUnit = 'meters';
    convertedDisplayUnit = 'feet';
  } else if (units === 'f') {
    conversionFormula = SQFEET_TO_METERS;
    displayUnit = 'feet';
    convertedDisplayUnit = 'meters';
  }
}

function roomDimensions(l, w) {
  var area = (l * w).toFixed(2);
  var convertedArea =(area * conversionFormula).toFixed(2);
  return 'The area of the room is ' + area + ' square ' + displayUnit + ' (' + convertedArea + ' square ' + convertedDisplayUnit + ' ).';
}

entryUnit = prompt('Enter "m" for meters, "f" for feet.');

setUnits(entryUnit);

length = parseInt(prompt('Enter the length of the room in ' + displayUnit + ':'), 10);
width = parseInt(prompt('Enter the width of the room in ' + displayUnit + ':'), 10);

console.log(roomDimensions(length, width));
    

```
## 4.Tip Calculator

Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip, and then log both the tip and the total amount of the bill to the console. Your can ignore input validation and assume that the user will put in numbers.

```bash
What is the bill? 200
What is the tip percentage? 15

The tip is $30.00
The total is $230.00

```


### Solution

```javascript
function tipCalculator() {
  var billAmount;
  var tipPercent;
  var TIP;
  var BILL_TOTAL; 

  billAmount = parseFloat(prompt('What is the bill?'));
  tipPercent = parseFloat(prompt('What is the tip percentage?'));
  TIP = billAmount * (tipPercent / 100);
  BILL_TOTAL = TIP + billAmount; 

  console.log('The tip is $' + TIP.toFixed(2));
  console.log('The total is $' + BILL_TOTAL.toFixed(2));
}

tipCalculator();
    

```
## 5.Sum or Product of Consecutive Integers
Write a program that asks the user to enter an integer greater than `0`, then asks if the user wants to determine the sum or the product of all numbers between `1` and the entered integer, inclusive.

```bash
Please enter an integer greater than 0: 5
Enter "s" to compute the sum, or "p" to compute the product. s

The sum of the integers between 1 and 5 is 15.

Please enter an integer greater than 0: 6
Enter "s" to compute the sum, or "p" to compute the product. p

The product of the integers between 1 and 6 is 720.

```


### Solution

```javascript
var end;
var operation;
var result;
var message;

function retrieveInteger() {
  var digit;

  while (true) {
    digit = prompt('Please enter an integer greater than 0:');

    if (!!digit.match(/^\d+$/) && !digit.match(/0/)) {
      break;
    }

    alert('Invalid entry. Please try again.');
  }

  return parseInt(digit, 10);
}

function retrieveOperation() {
  var letter;

  while (true) {
    letter = prompt('Enter "s" to compute the sum, or "p" to compute the product.');

    if (!!letter.match(/^[sSpP]$/)) {
      break;
    }

    alert('Invalid entry. Please try again.');
  }

  if (letter.toLowerCase() === 's') {
    return 'sum';
  } else {
    return 'product';
  }
}

function calculate(endPoint, process) {
  var i;
  var total = 1;

  for (i = 2; i <= endPoint; i++) {
    if (process === 'sum') {
      total += i;
    } else if (process === 'product') {
      total *= i;
    }
  }

  return total;
}

end = retrieveInteger();
operation = retrieveOperation();
result = calculate(end, operation);
message = 'The ' + operation + ' of the integers between 1 and ' + end.toFixed() + ' is ' + result.toFixed() + '.';

console.log(message);
```

## 6.Short Long Short
Write a function that takes two strings as arguments, determines the longer of the two strings, and then returns the result of concatenating the shorter string, the longer string, and the shorter string once again. You may assume that the strings are of different lengths.

```javascript
shortLongShort('abc', 'defgh');    // "abcdefghabc"
shortLongShort('abcde', 'fgh');    // "fghabcdefgh"
shortLongShort('', 'xyz');         // "xyz"
```


### Solution

```javascript
function shortLongShort(str1, str2) {
  if (str1.length > str2.length) {
    return str2 + str1 + str2;
  } else {
    return str1 + str2 + str1;
  }
}

```
## 7.Leap Years Part 1
Leap years occur in every year that is evenly divisible by 4, unless the year is also divisible by 100. If the year is evenly divisible by 100, then it is not a leap year, unless the year is also evenly divisible by 400.

Assume this rule is valid for any year greater than year 0. Write a function that takes any year greater than 0 as input and returns `true` if the year is a leap year, or `false` if it is not a leap year.

```bash
isLeapYear(2016);      // true
isLeapYear(2015);      // false
isLeapYear(2100);      // false
isLeapYear(2400);      // true
isLeapYear(240000);    // true
isLeapYear(240001);    // false
isLeapYear(2000);      // true
isLeapYear(1900);      // false
isLeapYear(1752);      // true
isLeapYear(1700);      // false
isLeapYear(1);         // false
isLeapYear(100);       // false
isLeapYear(400);       // true

```


### Solution

```javascript
function isLeapYear(year) {
  return ((year % 4 === 0 && year % 100 !== 0) || year % 400 === 0);
}
```
## 8.Leap Years Part 2
Adapt the above solution to account for the following new data:

  - Under the Julian Calendar, leap years occurred in any year evenly divisible by 4;
  - Under the Gregorian Calendar, adopted in 1752, leap years occur as described in the previous exercise.


```bash
isLeapYear(2016);      // true
isLeapYear(2015);      // false
isLeapYear(2100);      // false
isLeapYear(2400);      // true
isLeapYear(240000);    // true
isLeapYear(240001);    // false
isLeapYear(2000);      // true
isLeapYear(1900);      // false
isLeapYear(1752);      // true
isLeapYear(1700);      // true
isLeapYear(1);         // false
isLeapYear(100);       // true
isLeapYear(400);       // true

```


### Solution

```javascript
function isLeapYear(year) {
  if (year >= 1752) {
  return ((year % 4 === 0 && year % 100 !== 0) || year % 400 === 0);
  }

  return year % 4 === 0;
}
```
## 9.Multiples of 3 and 5
Write a function that computes the sum of all numbers between `1` and some other number, inclusive, that are multiples of `3` or `5`. For instance, if the supplied number is `20`, the result should be `98`

```bash
multisum(3);       // 3
multisum(5);       // 8
multisum(10);      // 33
multisum(1000);    // 234168
```


### Solution

```javascript
function multisum(int) {
  var multiples = [];
  var i;

  for (i = 1; i <= int; i++) {
    if (i % 3 === 0 || i % 5 === 0) {
      multiples.push(i);
    }
  }

  function sum(a, b) {
    return a + b;
  }

  return multiples.reduce(sum);
}
```
## 10.ASCII String Value
Write a function that determines and returns the ASCII string value of a string passed in as an argument. The ASCII string value is the sum of th ASCII values of every character in the string. (You may use `String.prototype.charCodeAt()` to determine the ASCII value of a character.)

```bash
asciiValue('Four score');         // 984
asciiValue('Launch School');      // 1251
asciiValue('a');                  // 97
asciiValue('');                   // 0
```


### Solution

```javascript
function asciiValue(str) {
  var i;
  var value = 0;

  for (i = 0; i < str.length; i++) {
    value += str.charCodeAt(i);
  }

  return value;
}

```
