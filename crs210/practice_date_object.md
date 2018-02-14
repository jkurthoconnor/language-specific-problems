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
Change your output to include the value from the `getMonth` method. Thus, the logged string will read "Today's date is Mon, 11 6th", where `11` is  the month number returned by `getMonth`.
### Solution
```javascript
var today = new Date();
var day = today.getDay();
var daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
var dayName = daysOfWeek[day];
var dayOfMonth = today.getDate();
var monthNum = String(today.getMonth());


function dateSuffix(dayNumber) {
  var suffix = 'th';

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
    }

  suffix = (dayNumber >= 11 && dayNumber <= 13) ? 'th' : suffix;


  return String(dayNumber) + suffix;
}
  
console.log("Today's date is " + dayName + ', ' + monthNum + ' ' + dateSuffix(dayOfMonth));
```

## Problem 7.
Let's make the month readable. Using the same technique we used in problem 3, convert the month number in the output string to a 3-letter month name abbreviation. Use the following array:

### Solution
```javascript
var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];


```
## Problem 8.
Our call to console.log is getting cluttered. Let's clean things up a bit and refactor the code into a few formatting functions that we can call from anywhere in our code. Create formattedMonth and formattedDay functions to format the month and day, then write a formattedDate function that pulls everything together and logs the fully formatted date.

### Solution
```javascript
function formattedDate(dateObject) {

  console.log("Today's date is " + formattedDay(dateObject) + ', ' + formattedMonth(dateObject) + ' ' + dateSuffix(dateObject.getDate()));
}

function formattedMonth(dateObject) {
  var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

  return months[dateObject.getMonth()];
}

function formattedDay(dateObject) {
  var daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  return daysOfWeek[dateObject.getDay()];
}

function dateSuffix(dayNumber) {
  var suffix = 'th';

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
    }

  suffix = (dayNumber >= 11 && dayNumber <= 13) ? 'th' : suffix;
  return String(dayNumber) + suffix;
}

var today = new Date();

formattedDate(today);
```
