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

## Problem 9.
Log the values returned from the `getFullYear` and `getYear` methods. Note how these values differ. Note especially that `getYear` is deprecated: yu should avoid using deprecated methods as they may oneday disappear.

### Solution

```javascript
var day = new Date();

console.log(day.getFullYear()); // 2018
console.log(day.getYear()); // 118
```

## Problem 10.
Use the `getTime` method and log the current date and time in total milliseconds since Jan. 1st 1970.

### Solution

```javascript
var day = new Date();

console.log(day.getTime()); //1518660309064
```

## Problem 11.
Create a new date object variable named tomorrow that contains a Date object. Initialize the variable by setting it to the value of today. You can get the value of today using the getTime method. Next, change the date on the tomorrow object to the day after today: you should use setDate to change the date. Finally, log the tomorrow object with your formattedDate function.

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


var day = new Date();
var tomorrow = new Date(day.getTime()); // parameter allows setting based on time value

tomorrow.setDate(day.getDate() + 1); // parameter represents date of currently set month

formattedDate(tomorrow);
  ```


## Problem 12.
Create a new variable named `nextWeek` that is a new Date copied from the `today` object. Compare `nextWeek` and `today`, and log the results. Are they equal? Why or why not?

### Solution
```javascript
var today = new Date();
var nextWeek = today;
var nextWeekValue = new Date(today.getTime()); // parameter using value of `today`

console.log(today === nextWeek); // true
console.log(today === nextWeekValue); // false -- as with all Objects, identity of object, not merely value, is required for comparison
```

## Problem 13.
Compare the values returned by toDateString to determine whether the two objects are equal. Finally, add 7 days to the nextWeek date and compare the two objects again.

### Solution
```javascript
var today = new Date();
var nextWeekValue = new Date(today.getTime());

console.log(today === nextWeekValue); // false
console.log(today.toDateString() === nextWeekValue.toDateString()); // true

nextWeekValue.setDate(nextWeekValue.getDate() + 7);
```

## Problem 14.


Finally, write a function named formatTime that takes a date object as an argument and returns a string formatted with the hours and minutes as "15:30". Make sure you handle the case where the hours or minutes has only one digit: you need to pad the value with a leading zero in such cases, e.g., "03:04". You can use the getHours and getMinutes methods to obtain the hours and minutes.

### Solution
```javascript
var today = new Date();

function formatTime(date) {
  var minutes = String(date.getMinutes()).padStart(2, '0');
  var hours = String(date.getHours()).padStart(2, '0');

  return hours + ':' + minutes;
}

console.log(formatTime(today));
```
