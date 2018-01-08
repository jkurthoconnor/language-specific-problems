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

```javascript

```


### Solution

```javascript

```
## 6.Short Long Short

```javascript

```


### Solution

```javascript

```
## 7.Leap Years Part 1

```javascript

```


### Solution

```javascript

```
## 8.Leap Years Part 2

```javascript

```


### Solution

```javascript

```
## 9.Multiples of 3 and 5

```javascript

```


### Solution

```javascript

```
## 10.ASCII String Value

```javascript

```


### Solution

```javascript

```
