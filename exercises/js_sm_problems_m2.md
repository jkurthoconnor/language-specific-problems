

LS Exercises: [Medium Problems 2](https://launchschool.com/exercise_sets/69a8c66a)

## Problem 1:

Write a function that takes a string, and returns an object containing the following three properties:

    the percentage of characters in the string that are lowercase letters
    the percentage of characters that are uppercase letters
    the percentage of characters that are neither

You may assume that the string will always contain at least one character.

Examples:
```javascript
letterPercentages('abCdef 123');
// { lowercase: "50.00", uppercase: "10.00", neither: "40.00" }

letterPercentages('AbCd +Ef');
// { lowercase: "37.50", uppercase: "37.50", neither: "25.00" }

letterPercentages('123');
// { lowercase: "0.00", uppercase: "0.00", neither: "100.00" }
```

### Solution

```javascript
// with named callback for reduce

function letterPercentages(str) {
  var chars = str.split('');
  var count;

  count = chars.reduce(countChars, {lowercase: 0, uppercase: 0, neither: 0});

  Object.keys(count).forEach(function (charType) {
    return count[charType] = ((count[charType] / chars.length) * 100).toFixed(2);
  });

  return count;
}

function countChars(totals, char) {
  if (char.match(/[a-z]/)) {
    totals.lowercase += 1;
  } else if (char.match(/[A-Z]/)) {
    totals.uppercase += 1;
  } else {
    totals.neither += 1;
  }
  return totals;
};

// or more declarative style:
function letterPercentages(str) {
  var size = str.length
  var count = {
    lowercase: (((str.match(/[a-z]/g) || []).length / size) * 100).toFixed(2),
    uppercase: (((str.match(/[A-Z]/g) || []).length / size)* 100).toFixed(2),
    neither: (((str.match(/[^a-z]/ig) || []).length / size)* 100).toFixed(2),
  };

  return count;
}
console.log(letterPercentages('abCdef 123'));
// { lowercase: "50.00", uppercase: "10.00", neither: "40.00" }

console.log(letterPercentages('AbCd +Ef'));
// { lowercase: "37.50", uppercase: "37.50", neither: "25.00" }

console.log(letterPercentages('123'));
// { lowercase: "0.00", uppercase: "0.00", neither: "100.00" }

console.log(letterPercentages('AbCd \t+Ef'));
// {lowercase: "33.33", uppercase: "33.33", neither: "33.33"}
```


## Problem 2:

A triangle is classified as follows:

    Equilateral: All three sides are of equal length.
    Isosceles: Two sides are of equal length, while the third is different.
    Scalene: All three sides are of different lengths.

To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and every side must have a length greater than 0. If either of these conditions is not satisfied, the triangle is invalid.

Write a function that takes the lengths of the three sides of a triangle as arguments, and returns one of the following four strings representing the triangle's classification: 'equilateral', 'isosceles', 'scalene', or 'invalid'.

Examples:

```javascript
triangle(3, 3, 3);        // "equilateral"
triangle(3, 3, 1.5);      // "isosceles"
triangle(3, 4, 5);        // "scalene"
triangle(0, 3, 3);        // "invalid"
triangle(3, 1, 1);        // "invalid"
```

### Solution

```javascript
function triangle(s1, s2, s3) {
  if (!validNumbers(s1, s2, s3)) {
    return 'invalid arguments';
  }

  var evaluation;
  var sides = [s1, s2, s3].sort(function (a, b) {
    return a - b;
    });

  if (sides[0] <= 0 || (sides[0] + sides[1]) <= sides[2]) {
    evaluation = 'invalid';
  } else if (sides[0] === sides[2]) {
    evaluation = 'equilateral';
  } else if ((sides[0] === sides[1]) || (sides[1] === sides[2])) {
    evaluation = 'isosceles';
  } else {
    evaluation = 'scalene';
  }

  return evaluation;
}

function validNumbers(arg1, arg2, arg3) {
  var i;
  var args = [arg1, arg2, arg3];

  for (i = 0; i < args.length; i += 1) {
    if (Number(args[0]) !== args[0]) {
      return false;
    }
  }
  
  return true;
}

console.log(triangle(3, 3, 3));        // "equilateral"
console.log(triangle(3, 3, 1.5));      // "isosceles"
console.log(triangle(3, 4, 5));        // "scalene"
console.log(triangle(0, 3, 3));        // "invalid"
console.log(triangle(3, 1, 1));        // "invalid"
console.log(triangle(-3, 1, 1));        // "invalid"
console.log(triangle(3, Infinity, 1));        // "invalid arguments"
```


## Problem 3:

A triangle is classified as follows:

    Right: One angle is a right angle (exactly 90 degrees).
    Acute: All three angles are less than 90 degrees.
    Obtuse: One angle is greater than 90 degrees.

To be a valid triangle, the sum of the angles must be exactly 180 degrees, and every angle must be greater than 0. If either of these conditions is not satisfied, the triangle is invalid.

Write a function that takes the three angles of a triangle as arguments, and returns one of the following four strings representing the triangle's classification: 'right', 'acute', 'obtuse', or 'invalid'.

You may assume that all angles have integer values, so you do not have to worry about floating point errors. You may also assume that the arguments are in degrees.

Examples:

```javascript
triangle(60, 70, 50);       // "acute"
triangle(30, 90, 60);       // "right"
triangle(120, 50, 10);      // "obtuse"
triangle(0, 90, 90);        // "invalid"
triangle(50, 50, 50);       // "invalid"

```

### Solution

```javascript
function triangle(a1, a2, a3) {
  var evaluation;
  var angles = [a1, a2, a3].sort(function (a, b) {return a - b;});
  var sum = angles.reduce(function (total, angle) {return total + angle;});

  if (sum !== 180 || angles[0] <= 0) {
    evaluation = 'invalid';
  } else if (angles[2] === 90) {
    evaluation = 'right';
  } else if (angles[2] < 90) {
    evaluation = 'acute';
  } else {
    evaluation = 'obtuse';
  }

  return evaluation;
}

// without sorting

function triangle(a1, a2, a3) {
  var maxAngle = Math.max(a1, a2, a3);
  var minAngle = Math.min(a1, a2, a3);
  var assessment;

  if ((a1 + a2 + a3) !== 180 || minAngle <= 0) {
    assessment = 'invalid';
  } else if (maxAngle === 90) {
    assessment = 'right';
  } else if (maxAngle < 90) {
    assessment = 'acute';
  } else {
    assessment = 'obtuse';
  }

  return assessment;

}
```


## Problem 4:

Write a function that takes a year as an argument, and returns the number of 'Friday the 13ths' in that year. You may assume that the year is greater than 1752 (when the modern Gregorian Calendar was adopted by the United Kingdom). You may also assume that the same calendar will remain in use for the foreseeable future.

Examples:

```javscript
fridayThe13ths(1986);      // 1
fridayThe13ths(2015);      // 3
fridayThe13ths(2017);      // 2
```

### Solution

```javascript
function fridayThe13ths(year) {
  var thirteenth;
  var friday13ths = 0;
  var month;

  for (month = 0; month < 12; month += 1) {
    thirteenth = new Date(year, month, 13);
    if (thirteenth.getDay() === 5) {
      friday13ths += 1;
    }
  }

  return friday13ths;
}
```


## Problem 5:

A 'featured number' (something unique to this exercise) is an odd number that is a multiple of 7, with all of its digits occuring exactly once each. For example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

Write a function that takes an integer as an argument, and returns the next featured number greater than the integer. Issue an error message if there is no next featured number.

Examples:
```javascript
featured(12);           // 21
featured(20);           // 21
featured(21);           // 35
featured(997);          // 1029
featured(1029);         // 1043
featured(999999);       // 1023547
featured(999999987);    // 1023456987
```

### Solution

```javascript
function featured(num) {
  var checkNext = findNextOdd7(num + 1);

  for (; checkNext < 9876543210; checkNext += 14) {
    if (!findDupes(checkNext)) {
      return checkNext;
    }
  }

  return 'No next featured number';
}

function findDupes(number) {
  return String(number).match(/(.).*\1/);
}

function findNextOdd7(number) {
  while ((number % 7 !== 0) || (number % 2 !== 1)) {
    number += 1;
  }

  return number;
}

console.log(featured(12));           // 21
console.log(featured(20));           // 21
console.log(featured(21));           // 35
console.log(featured(997));          // 1029
console.log(featured(1029));         // 1043
console.log(featured(999999));       // 1023547
console.log(featured(999999987));    // 1023456987
console.log(featured(9876543210));    // Error
console.log(featured(10000000000));    // Error

```


## Problem 6:
Write a function that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.

Examples:

```javascript
sumSquareDifference(3);      // 22 --> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sumSquareDifference(10);     // 2640
sumSquareDifference(1);      // 0
sumSquareDifference(100);    // 25164150
```

### Solution

```javascript
function sumSquareDifference(n) {
  var sqSums;
  var sumSqs;
  var i = 1;
  var firstNs = [];

  for (; i <= n; i += 1) firstNs.push(i);

  sqSums = square(firstNs.reduce(sum));

  sumSqs = firstNs.map(square).reduce(sum);

  return sqSums - sumSqs;
}

function square(a) {
  return Math.pow(a, 2);
}

function sum(a, b) {
  return a + b;
}
```


## Problem 7:

Write a function that takes an array as an argument and sorts that array using the bubble sort algorithm described above. The sorting should be done "in-place" — that is, the function should mutate the array. You may assume that the array contains at least two elements.

Examples:
```javascript
var array = [5, 3];
bubbleSort(array);
console.log(array);    // [3, 5]

var array = [6, 2, 7, 1, 4];
bubbleSort(array);
console.log(array);    // [1, 2, 4, 6, 7]

var array = ['Sue', 'Pete', 'Alice', 'Tyler', 'Rachel', 'Kim', 'Bonnie'];
bubbleSort(array);
console.log(array);    // ["Alice", "Bonnie", "Kim", "Pete", "Rachel", "Sue", "Tyler"]
```

### Solution

```javascript
// `splice()` evaluates arguments before execution, the indices reflect pre-spliced state
// and we don't need temporary holder variables
function bubbleSort(arr) {
  var i;
  var swapped;
  
  do {
    swapped = false;
    for (i = 0; i <= arr.length - 2; i += 1) {
      if (arr[i] > arr[i + 1]) {
        arr.splice(i, 2, arr[i + 1], arr[i]);
        swapped = true;
      }
    }
  } while (swapped);

  return arr;
}


/* strictly imperative version of swapping mechanism
    for (i = 0; i <= arr.length - 2; i += 1) {
      if (arr[i] > arr[i + 1]) {
        swap = arr[i + 1];
        arr[i + 1] = arr[i];
        arr[i] = swap;
        swapped = true;
      }
    }
*/
```



