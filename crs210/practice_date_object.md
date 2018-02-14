# Practice Problems: [Working with Dates](https://launchschool.com/lessons/0539330a/assignments/ba1faa1f)


## Problem 1.
Create a variable named `today` with the current date and time as its value.

### Solution

```javascript
var today = new Date(); // without arguments, the contstructor creates a `Date` for current date and time
```

## Problem 2.
Log a string, "Today's day is 5", that tells the current day of the week as a number between 0 and 6 (Sunday is 0, Saturday is 6). Use the `getDay` method to obtain the number of the day of week.

### Solution
```javascript
var today = new Date();
var day = today.getDay();

console.log("Today's day is " + String(day));
```

## Problem 3.
The `getDay` method, like many of the get methods on the date object, returns a zero-based index of the current day of week instead of the day name. This enables support for multiple locales and formats. Modify the output message of the previous problem to show the 3-letter day name abbreviation. You may use the following array:


### Solution

```javascript
var today = new Date();
var day = today.getDay();
var daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
var dayName = daysOfWeek[day];

console.log("Today's day is " + dayName);
```

## Problem 4.
Let's add the calendar date (the day of month) to our log message: "Today's day is Mon, the 6th". Use the `getDate` method to obtain the current day of month. Don't worry about using different suffixes for numbers that end with `1`, `2`, or `3` just yet; we'll deal with that in the next problem.

### Solution
```javascript
var today = new Date();
var day = today.getDay();
var daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
var dayName = daysOfWeek[day];
var dayOfMonth = String(today.getDate());

console.log("Today's day is " + dayName + ' the ' + dayOfMonth + 'th.');
```

## Problem 5.
Ideally, the suffix on the day number needs to adjust to the proper suffix for days like the `1st`, `22nd`, and `3rd`. Write a function named `dateSuffix` that takes the day of month as a numeric value and returns the formatted day of month and suffix. Make sure you use the correct suffixes.

### Solution

```javascript
var today = new Date();
var day = today.getDay();
var daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
var dayName = daysOfWeek[day];
var dayOfMonth = today.getDate();

function dateSuffix(dayNumber) {
  var suffix;

  switch (dayNumber % 10) {
    case 1:
      suffix = 'st';
      break;
    case 2:
      suffix = 'nd';
      break;
    case 3:
      suffix = 'rd';
      break;
    default:
      suffix = 'th';
  }

  suffix = (dayNumber >= 11 && dayNumber <= 13) ? 'th' : suffix;

  return String(dayNumber) + suffix;
}
  
console.log("Today's day is " + dayName + ' the ' + dateSuffix(dayOfMonth));

```
## Problem 6.
`Math.random` return a random floating-point number between `0` and `1`, excluding the exact value of `1`.This isn't helpful on its own, since you usually want a random integer between two other integer values. Create a function that takes two arguments, a minimum and a maximum value, and returns a random integer between those numbers (including both of the numbers). Your solution should handle the scenario that the user inadvertently swaps the positions of the min and max values or the scenario that the min and max values are equal. You may assume that the user always provides the min and max values.
### Solution
```javascript
function randomBtwn(min, max) {
  var trueMin = (max > min ? min : max);
  var diff = Math.abs(max - min);
  var factor = Math.random() * diff;

  return Math.round(factor + trueMin);
}
```

