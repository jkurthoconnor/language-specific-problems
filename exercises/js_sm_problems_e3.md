
LS Exercises: [Small Problems Easy 3](https://launchschool.com/exercise_sets/829c41b0)


## Problem 1:
Build a program that randomly generates Teddy's age, and logs it to the console. Have the age be a random number between `20` and `200` (inclusive).


### Solution
```javascript
function randomInRange(min, max) {
  var range = max - min;
  var additive = Math.random() * range;

  return Math.ceil(additive + min);
}

console.log('Teddy is ' + randomInRange(20, 200) + ' years old!');
```
### Further Exploration
Would it make a difference if `Math.round()` were used in the sample solution?

Solution: yes; the sample relies on `Math.floor()` to level any potential fractional values above the maximum.  Given the right random input, `Math.round()` would potentially round up to the integer one greater than the maximum.

What could be done to make the code more robust, for example, to allow for inadvertantly passing arguments out of order?

Solution: The values for `max` and `min` could be reassigned if the arguments wereout of order. See below.
```javascript
function randomInRange(min, max) {
  var swap;
  var range;
  var additive;

  if (max < min) {
    swap = max;
    max = min;
    min = swap;
  }

  range = max - min;
  additive = Math.random() * range;

  return Math.ceil(additive + min);
}


```

## Problem 2:
Write a program tha solicits six numbers from the user, then logs a message that describes whether or not the sixth number appears among the first five numbers.

```javascript
Enter the 1st number: 25
Enter the 2nd number: 15
Enter the 3rd number: 20
Enter the 4th number: 17
Enter the 5th number: 23
Enter the last number: 17

The number 17 appears in [25, 15, 20, 17, 23].

-----

Enter the 1st number: 25
Enter the 2nd number: 15
Enter the 3rd number: 20
Enter the 4th number: 17
Enter the 5th number: 23
Enter the last number: 18

The number 18 does not appear in [25, 15, 20, 17, 23].
```

### Solution

```javascript
function collectNumbers() {
  var ordinals = ['1st', '2nd', '3rd', '4th', '5th', 'last'];
  var numbers = [];
  var i;

  for (i = 0; i < 6; i++) {
    numbers[i] = prompt('Enter the ' + ordinals[i] + ' number: ');
  }

  return numbers;
}

function isTheLastRepeated() {
  var numbers = collectNumbers();
  var terminus = numbers.length - 1;
  var searchNum = numbers[terminus];
  var source = numbers.slice(0, terminus)


  if (source.indexOf(searchNum) !== -1) {
    console.log('The number ' + searchNum + ' appears in [' + String(source) + '].');
  } else {
    console.log('The number ' + searchNum + ' does not appear in [' + String(source) + '].');
  }
}

isTheLastRepeated();
```


## Problem 3:
Build a program that logs when the user will retire and how many more years the user has to work until retirement.

```javascript
What is your age? 30
At what age would you like to retire? 70

It's 2017. You will retire in 2057.
You have only 40 years of work to go!
```

### Solution

```javascript
function retirementAdvisor() {
  var CURRENT_YEAR = 2018;
  var currentAge = parseInt(prompt('What is your age? '), 10);
  var retireAge = parseInt(prompt('At what age would you like to retire? '), 10);
  var yearsTillRetire = retireAge - currentAge; 
  var retireYear = CURRENT_YEAR + yearsTillRetire;

  console.log('It\'s ' + CURRENT_YEAR + '. You will retire in ' + retireYear + '.'); 
  console.log('You have only ' + yearsTillRetire + ' years of work to go!');
}

// and using the `Date` object:
function retirementAdvisor() {
  var currentDate = new Date();
  var currentYear = currentDate.getFullYear();
  var currentAge = parseInt(prompt('What is your age? '), 10);
  var retireAge = parseInt(prompt('At what age would you like to retire? '), 10);
  var yearsTillRetire = retireAge - currentAge; 
  var retireYear = currentYear + yearsTillRetire;

  console.log('It\'s ' + currentYear + '. You will retire in ' + retireYear + '.'); 
  console.log('You have only ' + yearsTillRetire + ' years of work to go!');
}
```

Further Exploration:
What would happen if the `new` keyword weren't used when calling `Date`?

Answer: Then instead of `currentDate` pointing to a `Date` object, it would point to a string representation of the date. That would also break the `getFullYear` invocation as well


## Problem 4:
Write a function that returns `true` if the string passed as an argument is a palidrome, or `false` otherwise. A palindrome reads the same forwards and backwards. For this problem, the case matters and all characters matter.

```javascript
isPalindrome('madam');               // true
isPalindrome('Madam');               // false (case matters)
isPalindrome("madam i'm adam");      // false (all characters matter)
isPalindrome('356653');              // true
```

### Solution

```javascript
function isPalindrome(string) {
  var i;
  var reversed = '';

  for (i = 0; i < string.length; i++) {
    reversed = string[i] + reversed;
  }

  return string === reversed;
}
```


## Problem 5:


Write another function that returns true if the string passed as an argument is a palindrome, or false otherwise. This time, however, your function should be case-insensitive, and should ignore all non-alphanumeric characters. If you wish, you may simplify things by calling the isPalindrome function you wrote in the previous exercise.

Examples:

```javascript
isRealPalindrome('madam');               // true
isRealPalindrome('Madam');               // true (case does not matter)
isRealPalindrome("Madam, I'm Adam");     // true (only alphanumerics matter)
isRealPalindrome('356653');              // true
isRealPalindrome('356a653');             // true
isRealPalindrome('123ab321');            // false
```

### Solution

```javascript
function isPalindrome(string) {
  var i;
  var reversed = '';

  for (i = 0; i < string.length; i++) {
    reversed = string[i] + reversed;
  }

  return string === reversed;
}

function isRealPalindrome(string) {
  var cleanString = string.toLowerCase().replace(/[^0-9a-z]/g, '');

  return isPalindrome(cleanString);
}
```


## Problem 6:
Write a function that returns `true` if its integer argument is palindromic, or false otherwise. A palindromic number reads the same forwards and backwards.
```javascript
isPalindromicNumber(34543);        // true
isPalindromicNumber(123210);       // false
isPalindromicNumber(22);           // true
isPalindromicNumber(5);            // true
```

### Solution

```javascript
function isPalindromicNumber(number) {
  return isPalindrome(String(number));
}
```


## Problem 7:
Write a function that takes an array of numbers and returns an array with the same number of elements, with each elements's value being the running total from the original array.

```javascript
runningTotal([2, 5, 13]);             // [2, 7, 20]
runningTotal([14, 11, 7, 15, 20]);    // [14, 25, 32, 47, 67]
runningTotal([3]);                    // [3]
runningTotal([]);                     // []
```

### Solution

```javascript
function runningTotal(numbers) {
  var runningTotals;
  var i;

  runningTotals = numbers.length > 0 ? [numbers[0]] : [];

  for (i = 1; i < numbers.length; i++) {
    runningTotals.push(runningTotals[i - 1] + numbers[i]);
  } 

  return runningTotals;
}
```


## Problem 8:

```javascript
```

### Solution

```javascript

```


## Problem 9:

```javascript
```

### Solution

```javascript

```


## Problem 10:

```javascript
```

### Solution

```javascript

```
