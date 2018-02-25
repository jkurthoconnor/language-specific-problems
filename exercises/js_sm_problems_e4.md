
LS Exercises: [JS Small Problems: Easy 4](https://launchschool.com/exercise_sets/b1647500)


## Problem 1:

Write a function that takes a floating point number representing an angle between 0 and 360 degrees, and returns a string representing that angle in degrees, minutes, and seconds. You should use a degree symbol to represent degrees, a single quote to represent minutes, and a double quote to represent seconds. There are 60 minutes ina degree, and 60 seconds in a minute.

```javascript
dms(30);           // 30°00'00"
dms(76.73);        // 76°43'48"
dms(254.6);        // 254°35'59"
dms(93.034773);    // 93°02'05"
dms(0);            // 0°00'00"
dms(360);          // 360°00'00" or 0°00'00"
```

### Solution

```javascript
function dms(angle) {
  var degMark = String.fromCharCode(0x00B0);
  var degrees = String(Math.floor(angle));
  var minutes = String(Math.floor((angle % 1) * 60)).padStart(2, '0');
  var seconds = String(Math.floor(((angle % 1) * 60) % 1 * 60)).padStart(2, '0');

  return degrees + degMark + minutes + '\'' + seconds + '"';
}
// refactored with constants for clarity
function dms(angle) {
  var DEG_MARK = String.fromCharCode(0x00B0);
  var MIN_PER_DEG = 60;
  var SEC_PER_DEG = 3600;
  var degrees = Math.floor(angle);
  var fractionalDeg = angle - degrees;
  var minutes = String(Math.floor(fractionalDeg * MIN_PER_DEG)).padStart(2, '0');
  var seconds = String(Math.floor((fractionalDeg * SEC_PER_DEG) % MIN_PER_DEG)).padStart(2, '0');

  return String(degrees) + DEG_MARK + minutes + '\'' + seconds + '"';
}
```


## Problem 2:
Write a function that takes two arrays as arguments, and returns an array containing the union of the values from the two. There should be no duplication of values in the returned array, even if there are duplicates in the original arrays. You may assume that both arguments will always be arrays.
```javascript
union([1, 3, 5], [3, 6, 9]);    // [1, 3, 5, 6, 9]
```

### Solution

```javascript
function union(arr1, arr2) {
  var joinedEle = arr1.slice();
  var i;

  for (i = 0; i < arr2.length; i++) {
    if (joinedEle.indexOf(arr2[i]) === -1) {
      joinedEle.push(arr2[i]);
    }
  }

  return joinedEle;
}
```


## Problem 3:
Write a function that takes an array as an argument, and returns an array that contains two elements, each of which is an array. Put the first half of the original array elements in the first element of the  return value, and put the second half in the second element. If the original array contains an odd number of elements, place the middle element in the first half array.

```javascript
halvsies([1, 2, 3, 4]);       // [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]);    // [[1, 5, 2], [4, 3]]
halvsies([5]);                // [[5], []]
halvsies([]);                 // [[], []]

```

### Solution

```javascript
function halvsies(arr) {
  var i;
  var halved = [ [], [] ];
  var secondHalfIdx = Math.ceil(arr.length / 2);
  
  for (i = 0; i < arr.length; i++) {
    i < secondHalfIdx ? halved[0].push(arr[i]) : halved[1].push(arr[i]);
  }

  return halved;
}

// or more idiomatically:
function halvsies(arr) {
  var halved = [ [], [] ];
  var secondHalfIdx = Math.ceil(arr.length / 2);

  halved[0] = arr.slice(0, secondHalfIdx);
  halved[1] = arr.slice(secondHalfIdx);

  return halved;
}
```


## Problem 4:
Given an unordered array and the information that exactly one value in the array occurs twice (every other value occurs exactly once), determine which value occurs twice. Write a function that will find and return the duplicate value that is in the array.
```javascript
findDup([1, 5, 3, 1]);                                // 1
findDup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
         38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
         14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
         78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
         89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
         41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
         55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
         85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
         40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7, 34, 57, 74, 45, 11, 88, 67,  5, 58]);    // 73
```

### Solution

```javascript
// brute force with nested loops
function findDup(arr) {
  var i;
  var j;

  for (i = 0; i < arr.length; i++) {
    for (j = i + 1; j < arr.length; j++) {
      if (arr[i] === arr[j]) {
        return arr[j];
      }
    }
  }
}

// using `indexOf()`
function findDup(arr) {
  var i;

  for (i = 0; i < arr.length; i++) {
    if (arr.indexOf(arr[i], i + 1) !== -1) {
      return arr[i];
    }
  }
}
```


## Problem 5:
Write a function that combines two arrays passed as arguments, and returns a new array that contains all elements from both array arguments, with each element taken in alternation.

You may assume that both input arrays are non-empty, and that they have the same number of elements.
```javascript
interleave([1, 2, 3], ['a', 'b', 'c']);    // [1, "a", 2, "b", 3, "c"]
```

### Solution

```javascript
function interleave(arr1, arr2) {
  var i;
  var interleaved = [];

  for (i = 0; i < arr1.length; i++) {
    interleaved.push(arr1[i], arr2[i]);
  }

  return interleaved;
}
```


## Problem 6:

Write a function that takes an array of integers as input, multiplies all of the integers together, divides the result by the number of entries in the array, and returns the result as a string with the value rounded to three decimal places.

```javascript
showMultiplicativeAverage([3, 5]);                   // "7.500"
showMultiplicativeAverage([2, 5, 7, 11, 13, 17]);    // "28361.667"
```

### Solution

```javascript
function showMultiplicativeAverage(numbers) {
  var i;
  var numbersProduct = numbers[0];
  var length = numbers.length;

  for (i = 1; i < length; i++) {
    numbersProduct *= numbers[i];

  }

  return (numbersProduct / length).toFixed(3);
}

// with `reduce`
function showMultiplicativeAverage(numbers) {
  var numbersProduct;
  var length = numbers.length;

  numbersProduct = numbers.reduce(function (accum, currVal) {
    return accum * currVal;
  });

  return (numbersProduct / length).toFixed(3);
}
```


## Problem 7:
Write a function that takes two array arguments, each containing a list of numbers, and returns a new array that contains the product of each pair of numbers from the qarguments that have the same index.
You may assume that the arguments contain the same number of elements.

```javascript
multiplyList([3, 5, 7], [9, 10, 11]);    // [27, 50, 77]
```

### Solution

```javascript
function multiplyList(arr1, arr2) {
var i;
var products = [];

  for (i = 0; i < arr1.length; i++) {
    products[i] = arr1[i] * arr2[i];
  }

  return products;
}

```


## Problem 8:
Write a function that takes one argument, a positive integer, and returns a list of the digits in the number.

```javascript
digitList(12345);       // [1, 2, 3, 4, 5]
digitList(7);           // [7]
digitList(375290);      // [3, 7, 5, 2, 9, 0]
digitList(444);         // [4, 4, 4]
```

### Solution

```javascript
// using type conversion:
function digitList(number) {
  var i;
  var digits = [];
  var numerals = String(number);

  for (i = 0; i < numerals.length; i++) {
    digits.push(parseInt(numerals[i], 10));
  }

  return digits;
}

// using `.map`
function digitList(number) {
  var numerals = String(number).split('');
  var digits;

  digits = numerals.map(function (numStr) {
    return parseInt(numStr, 10);
  });

  return digits;
}
```


## Problem 9:
Write a function that counts the number of occurrences of each element in a given array. Once counted, log each element alongside the number of occurrences.
```javascript
var vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
                'motorcycle', 'motorcycle', 'car', 'truck'];

countOccurrences(vehicles);

// console output
car => 4
truck => 3
SUV => 1
motorcycle => 2
```

### Solution

```javascript
function countOccurrences(collection) {
  var i;
  var vehicle;
  var count = {};

  for (i = 0; i < collection.length; i++) {
    if (count[collection[i]]) {
      count[collection[i]] += 1;
    } else {
      count[collection[i]] = 1;
    }
  }

  for (vehicle in count) {
    console.log(vehicle + ' => ' + String(count[vehicle]));
  }
}

var vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
                'motorcycle', 'motorcycle', 'car', 'truck'];

countOccurrences(vehicles);
```


## Problem 10:
Write a functin that takes one argument, an array containing integers, and returns the average of all the integers in the array, rounded down to the integer component of the average. The array will never be empty, and the numbers will always be positive integers.
```javascript
average([1, 5, 87, 45, 8, 8]);       // 25
average([9, 47, 23, 95, 16, 52]);    // 40
```

### Solution

```javascript
function average(numbers) {
  var length = numbers.length;
  var sum;

  sum = numbers.reduce(function (currTotal, currValue) {
    return currTotal + currValue;
  });

  return Math.floor(sum / length);
}
```
