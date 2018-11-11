
LS Exercises: [Small Problems Easy 3](https://launchschool.com/exercise_sets/829c41b0)


## Problem 1:
Build a program that randomly generates Teddy's age, and logs it to the console. Have the age be a random number between `20` and `200` (inclusive).


### Solution
```javascript
function randomInRange(min, max) {
  var range = max - min;
  var additive = Math.random() * range;

  return String(Math.ceil(additive + min));
}

console.log('Teddy is ' + randomInRange(20, 200) + ' years old!');

// with template literal and a different formula:
function howOldIsTeddy(min, max) {
  var range = max - min;
  var age = Math.floor(1 + min + (Math.random() * range));

  return `Teddy is ${String(age)} years old!`;
}
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


// using ES6 template literals and `includes`
function collectNumbers() {
  var inputNums = [];
  var order = ['1st', '2nd', '3rd', '4th', '5th', 'last'];
  var i;

  for (i = 0; i < order.length; i += 1) {
    inputNums.push(prompt(`Enter the ${order[i]} number: `));
  }

  return inputNums;
}

function search(collection) {
  var source = collection.slice(0, 5);
  var searchTerm = collection[5];
  var found = source.includes(searchTerm);
  var result = (found ? 'appears' : 'does not appear');

  return `The number ${searchTerm} ${result} in [${source.join(', ')}].`;
}

console.log(search(collectNumbers()));

// Further Exploration: modify to search for number greater than
function search(collection) {
  var source = collection.slice(0, 5);
  var searchTerm = collection[5];
  var found = source.some(function (element) {
    return parseInt(element, 10) > parseInt(searchTerm, 10);
  });
  var result = (found ? 'occurs' : 'does not occur');

  return `A number greater than ${searchTerm} ${result} in [${source.join(', ')}].`;
}
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

// using distinct functions, destructuring, and template literals:
function collectAges() {
  var currentAge = parseInt(prompt('What is your age?:'), 10);
  var retireAge = parseInt(prompt('At what age would you like to retire?'), 10);

  return [currentAge, retireAge];
}

function retirementReport(ageRequirements) {
  var [age, retire] = ageRequirements;
  var yearsUntilRetire = retire - age;
  var currentYear= new Date().getFullYear();
  var retireYear = String(currentYear + yearsUntilRetire);

  return `It's ${String(currentYear)}. You will retire in ${retireYear}.\nYou have only ${String(yearsUntilRetire)} years of work to go!`;
}

console.log(retirementReport(collectAges()));

// using an object to store input data:

function retire() {
  var prospectus = getRetirementPlans();
  var currentDate = new Date();
  var year = currentDate.getFullYear();
  var yearsToRetirement = prospectus.retireAge - prospectus.age;
  var retireYear = new Date();

  retireYear.setFullYear(year + yearsToRetirement);

  console.log(`It is ${year}. Retire in ${retireYear.getFullYear()}`);
  console.log(`You have only ${yearsToRetirement} year of work to go!`);
}

function getRetirementPlans() {
  var age = parseInt(prompt('age'), 10);
  var retireAge = parseInt(prompt('retire age'), 10);

  return { age, retireAge };
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

// or more idiomatically with convenience methods:
function isPalindrome(str) {
var reversed = str.split('').reverse().join('');

return reversed === str;
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

// or self-contained:
function isPalindromicNumber(n) {
  return String(n) === String(n).split('').reverse().join('');
}
```
Further Exploration: Would it make a difference if the numbers had leading zeros?

Solution:
Yes. The key is to note that the methods identify palindromes in the decimal string equivalents of the arguments.  Thus, as leading 0 would indicate octal or hex numbers, so the method would end up declaring palindromes only if the decimal equivalents were palindromic. 

A leading 0 would be indicative of octal numbering, so the conversion to a string would be representing the decimal equivalent of the octal argument.

A leading `0x` would indicate hexadecimal numbering, so the conversion would be representing the decimal equivalent of the hexidecimal argument.

If the decimal equivalent turns out to be palindromic, then the methods would still work, in the sense of identifing the number as a palindrome.

See examples below:

```javascript
console.log(isPalindromicNumber(00400));            // false: leading 0 indicative of octal number, so decimal conversion returns '2304'
console.log(isPalindromicNumber(0044));            // false: leading 0 indicative of octal number, so decimal conversion returns 36
console.log(isPalindromicNumber(0x44));            // false: leading 0x indicative of hexdecimal number, so decimal conversion returns 68
console.log(isPalindromicNumber(0xb));            // true: leading 0x indicative of hexdecimal number, so decimal conversion returns 11
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

// rewritten to make intent more obvious:
function runningTotal(arr) {
  var i;
  var holder = [];
  var sum = 0;

  for (i = 0; i < arr.length; i += 1) {
    holder.push(sum += arr[i]);
  }

  return holder;
}
```

### Further Exploration:
Would `map` be helpful?

### Solution
`map` does not mutate the calling array, so without writing a callback function for `map` that does mutate the array each value visited or indexed into would be the original. The following code would mutate the array, and so would accomplish the goal of the assignment, but mutating the original may not be appropriate.

```javascript
var arr1 = [14, 11, 7, 15, 20];

var out1 = arr1.map(function (value, idx, array) {
  if (idx === 0) {
    return value;
  } else {
    return array[idx] = value + array[idx - 1];
  }
});

```

If one needed a function that left the original array untouched and using `array.map` were a requirement, then a callback function that calculated a running total for each new value by summing all previous values along with the current value would provide a solution.

```javascript
function runningTotal(arr) {
  var sum = 0;

  return arr.map(function (ele) {
    return sum += ele;
  });
}
```


## Problem 8:
Given a string of words separated by spaces, write a function that swaps the first and last letters of every word.

You may assume that every word contains at least one letter, and that the string will always contain at least one word. You may also assume that each string contains nothing but words and spaces, and that there are no leading, trailing, or repeated spaces.

```javascript
swap('Oh what a wonderful day it is');  // "hO thaw a londerfuw yad ti si"
swap('Abcde');                          // "ebcdA"
swap('a');                              // "a"
```

### Solution
```javascript
function swap(string) {
  var words = string.split(' ');
  var i;
  var lastIdx;
  var first;
  var last;
  var middle;

  for (i = 0; i < words.length; i++) {
    if (words[i].length === 1) {
      continue;
    } else {
      lastIdx = words[i].length - 1;
      first = words[i][0];
      last = words[i][lastIdx];
      middle = words[i].slice(1, lastIdx);

      words[i] = last + middle + first;
    }
  }

  return words.join(' ');
}

// using regex:
function swap(words) {
  return words.replace(/\w{2,}/g, function (match) {
    return match.slice(-1) + match.slice(1, -1) + match[0];
  });

}
```

### Further Exploration:
Refactor using `array.prototype.map`.

### Solution
```javascript
function swap(string) {
  var words = string.split(' ');
  var swapped;

  swapped = words.map(function(word) {
    if (word.length === 1) {
      return word;
    } else {
      return word.slice(-1) + word.slice(1, -1) + word[0];
    }
  });

  return swapped.join(' ');
}
```


## Problem 9:
Write a function that takes a string consisting of one or more space separated words, and returns an object that shows the number of words of different sizes.

Words consists of any sequence of non-space characters.
```javascript
wordSizes('Four score and seven.');                       // { "3": 1, "4": 1, "5": 1, "6": 1 }
wordSizes('Hey diddle diddle, the cat and the fiddle!');  // { "3": 5, "6": 1, "7": 2 }
wordSizes("What's up doc?");                              // { "6": 1, "2": 1, "4": 1 }
wordSizes('');                                            // {}
```

### Solution

```javascript
function wordSizes(string) {
  var i;
  var size;
  var words = string.length > 0 ? string.split(' ') : [];
  var lengthCount = {};

  for (i = 0; i < words.length; i++) {
    size = String(words[i].length);

    if (lengthCount[size]) {
      lengthCount[size] += 1;
    } else {
      lengthCount[size] = 1;
    }
  }

  return lengthCount;
}

```


## Problem 10:

Modify the `wordSizes` function from the previous exercise to exclude non-letters when determining word size. For instance, the word size of `"it's"` is `3`, not `4`.
```javascript
wordSizes('Four score and seven.');                       // { "3": 1, "4": 1, "5": 2 }
wordSizes('Hey diddle diddle, the cat and the fiddle!');  // { "3": 5, "6": 3 }
wordSizes("What's up doc?");                              // { "5": 1, "2": 1, "3": 1 }
wordSizes('');                                            // {}
```

### Solution

```javascript
function wordSizes(string) {
  var i;
  var size;
  var words = string.length > 0 ? string.replace(/[^a-z ]/gi, '').split(' ') : [];
  var lengthCount = {};

  for (i = 0; i < words.length; i++) {
    size = String(words[i].length);

    if (lengthCount[size]) {
      lengthCount[size] += 1;
    } else {
      lengthCount[size] = 1;
    }
  }

  return lengthCount;
}
// another option is to determine `size` based on a 'cleaned' string:

size = words[i].replace(/[^a-z]/ig, '').length;


// using reduce:

function wordSizes(string) {
  var words = string.replace(/[^a-z ]/gi, '').split(' ');

  return words.reduce(function (count, word) {
    if (word.length) {
      if (count[String(word.length)]) {
        count[String(word.length)] += 1;
      } else {
        count[String(word.length)] = 1;
      }
    }
    return count;
  }, {});
      
}
```

