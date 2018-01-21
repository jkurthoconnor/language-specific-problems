# [Practice Problems: Intermediate Array Uses](https://launchschool.com/lessons/e2c71a47/assignments/24094ab7)


## 1.
Write a function that creates and returns a new array from its array argument. The new array should contain all values from the argument array whose positions have an odd index.

```javascript
function oddElementsOf(arr) {
  // ...
}

var digits = [4, 8, 15, 16, 23, 42];

oddElementsOf(digits);    // returns [8, 16, 42]
```

### Solution

```javascript
function oddElementsOf(arr) {
  var odds = [];
  var i;

  for (i = 1; i < arr.length; i += 2) {
    odds.push(arr[i]);
  }

  return odds;
}

// or without reliance on `push`:
function oddElementsOf(arr) {
  var odds = [];
  var i;

  for (i = 1; i < arr.length; i += 2) {
    odds[odds.length] = arr[i];
  }

  return odds;
}
```


## 2.
Write a function that takes two arrays and returns a new array whose even positions come from the first array, and whose odd positions come from the second array. Assume that both arrays have equal length.

### Solution
```javascript
function combinedArray(even, odd) {
  var combined = [];
  var i;

  for (i = 0; i < even.length; i++) {
    combined.push(even[i], odd[i]);
  }

  return combined;
}
```


## 3.
Write a function that takes an array argument and returns a new array that contains all the argument's elements in their original order followed by all the argument's elements in reverse order.


```javascript
function forwardBackward(arr) {
  var result = arr.slice();
  var i;

  for (i = arr.length - 1; i >= 0; i--) {
    result.push(arr[i]);
  }

  return result;
}

```



## 4.
User the array sort method to create a function that takes an array of numbers and returns a new array of the mumbers sorted in descending order. Don not alter the original array.


```javascript
function sortDescending(arr) {
  // ...
}

var array = [23, 4, 16, 42, 8, 15];
var result = sortDescending(array);  // returns [42, 23, 16, 15, 8, 4]
console.log(result);                 // logs    [42, 23, 16, 15, 8, 4]
console.log(array);                  // logs    [23, 4, 16, 42, 8, 1
```
### Solution

```javascript
function sortDescending(arr) {
  var arrCopy = arr.slice();

  arrCopy.sort(function (a, b) {
    return b - a;
  });

  return arrCopy;
}
```



## 5.
Write a function that takes an array of arrays as an argument, and returns a new array that contains the sums of each of the sub-arrays.

```javascript
function matrixSums(arr) {
  // ...
}

matrixSums([[2, 8, 5], [12, 48, 0], [12]]);  // returns [15, 60, 12]
```

### Solution

```javascript
// using nested loops
function matrixSums(arr) {
  var sums = [];
  var i;
  var j;

  for (i = 0; i < arr.length; i++) {
    var memo = 0;
    var subArr = arr[i];

      for (j = 0; j < subArr.length; j++) {
        memo += subArr[j];
      }

    sums.push(memo);
  }

  return sums;
}
// using `reduce`:

function matrixSums(arr) {
  var sums = [];
  var i;

  for (i = 0; i < arr.length; i++) {
    var subArrSum = arr[i].reduce(function (a, b) {return a + b;});

    sums.push(subArrSum);
  }

  return sums;
}
```



## 6.
Write a function that takes ana array, and returns a new array with duplicate elements removed.

```javascript
function uniqueElements(arr) {
  // ...
}

uniqueElements([1, 2, 4, 3, 4, 1, 5, 4]);  // returns [1, 2, 4, 3, 5]
```

### Solution

```javascript
// with nested loops:
  var i;
  var j;
  var unique = [];

  for (i = 0; i < arr.length; i++) {
    var push = true;

    for (j = 0; j < unique.length; j++) {
      if (unique[j] === arr[i]) {
        push = !push;
        break;
      }
    }

    if (push) {
      unique.push(arr[i]);
    }
  }
  
  return unique;
}

// with `include`:
function uniqueElements(arr) {
  var i;
  var unique = [];

  for (i = 0; i < arr.length; i++) {
    if (unique.includes(arr[i])) {
      continue;
    }

    unique.push(arr[i]);
  }

  return unique;
}
```
