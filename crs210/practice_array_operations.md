# [Array Operations: push, pop, shift, unshift](https://launchschool.com/lessons/e2c71a47/assignments/24094ab7)


## 1.
Write funciton named `push` that accepts two arguments: an Array and any other value. The function should append the second argument to the end of the Array, and return the new length of the Array.

```javascript
var count = [0, 1, 2];
push(count, 3);  // 4
count;          //[0, 1, 2, 3]
```

### Solution

```javascript
function push(arr, value) {
  var newIdx = arr.length;
  arr[newIdx] = value;
  return arr.length;
}
```

## 2.
Write a function named `pop` that accepts one argument: an Array. The function should remove th last element from th array and return it.

```javascript
var count = [1, 2, 3];
pop(count);   [[ 3
count;    // [1, 2]
```

### Solution

```javascript
function pop(arr) {
  var popped = arr[arr.length - 1];
  arr.length -= 1;
  return popped;
}

```

## 3.
Write a function named `unshift` that accepts two arguments: an Array and a value. The function should insert the value at the beginning of the Array, and return the new `length` of the array. You will need a `for` loop for this problem.

```javascript
var count = [1, 2, 3];
unshift(count, 0);    // 4
count;    // [0, 1, 2, 3]
```

### Solution

```javascript
function unshift(arr, value) {
  var i;

  for (i = arr.length - 1; i >= 0; i--) {
    arr[i + 1] = arr[i];
  }

  arr[0] = value;
  return arr.length;
}
```

## 4.
Write a function named `shift` that accepts one argument: an Array. The function should remove the first value from the beginning of the Array and return it.

```javascript
var count = [1, 2, 3];
shift(count);   // 1
count;    //[2, 3]
```

### Solution

```javascript
function shift(arr) {
  var i;
  var shiftedOff = arr[0];

  for (i = 0; i < arr.length - 1; i++) {
    arr[i] = arr[i + 1];
  

  arr.length -= 1;
  return shiftedOff;
}
```

# Array Operations: [indexOf, lastIndexOf](https://launchschool.com/lessons/e2c71a47/assignments/7b3f4a97)

## 1.
Write a function `indexOf` that accepts two arguments: an Array and a value. The function should return the index of the first element that contains the value, or `-1` if the value is not present.

```javascript
// example

indexOf([1, 2, 3, 3], 3);         // 2
indexOf([1, 2, 3], 4);            // -1

```

### Solution

```javascript
function indexOf(arr, value) {
  var i;
  for (i = 0; i < arr.length; i++) {
    if (value === arr[i]) {
      return i;
    }
  }

  return -1;
}
```

## 2. 
Write a function `lastIndexOf` that accepts two arguments: an Array and a value. The function should return the index of the last element that contains the value, or `-1` if the value is not present

```javascript
// example
lastIndexOf([1, 2, 3, 3], 3);     // 3
lastIndexOf([1, 2, 3], 4);        // -1
```

# Array Operations: [slice, cplice, concat, and join](https://launchschool.com/lessons/e2c71a47/assignments/74373a7e)

## 1. Write a function named `slice` that accepts three arguments: an Array, a start index, and an end index. The function should return a a new Array that contains values from the original Array starting with values at the starting index, and including all values up to but not including the end index. Do not modify the original Array.

```javascript
slice([1, 2, 3, 4, 5], 0, 2);                      // [ 1, 2 ]
slice(['a', 'b', 'c', 'd', 'e', 'f', 'g'], 1, 3);  // [ 'b', 'c' ]
```

### Solution

```javascript
function slice(arr, start, end) {
  var i;
  var sliced = [];
  for (i = start; i < end; i++) {
    sliced[sliced.length] = arr[i];
  }

  return sliced;
}
```


## 2.
Write a function named `splice` that accepts three arguments: an Array, a start index, and the number of values to remove. The function should remove values from the original Array, starting with the first index and removing the specified number of values The function should return the removed values in a new Array.

```javascript
var count = [1, 2, 3, 4, 5, 6, 7, 8];
splice(count, 2, 5);                   // [ 3, 4, 5, 6, 7 ]
count;                                 // [ 1, 2, 8 ]
```

### Solution

```javascript
function splice(arr, start, num) {
  var i;
  var splicedOut = [];
  var endSlice = [];
  for (i = start; i < arr.length; i++) {
    if (i < start + num) {
      splicedOut[splicedOut.length] = arr[i];
    } else {
      endSlice[endSlice.length] = arr[i];
    }
  }

  arr.length = start;
  for (i = 0; i < endSlice.length; i++) {
    arr[arr.length] = endSlice[i];
  }

  return splicedOut;
}

```

## 3.
Write a function named `concat` that accepts two Array arguments. The function should return a new Array that contains the values from each of the original Arrays.


```javascript
concat([1, 2, 3], [4, 5, 6]);       // [ 1, 2, 3, 4, 5, 6 ]
```


### Solution

```javascript
function concat(arr1, arr2) {
  var i;
  var concatenated = [];

  for (i = 0; i < arr1.length; i++) {
    concatenated[concatenated.length] = arr1[i];
  }

  for (i = 0; i < arr2.length; i++) {
    concatenated[concatenated.length] = arr2[i];
  }

  return concatenated;
}

var first = [1, 2, 3];
console.log(concat(first, [4, 5, 6]));       // [ 1, 2, 3, 4, 5, 6 ]
console.log(first);                         // [1, 2, 3]
```

## 4.
Write a function named `join` that accepts two arguments: an Array and a String. The function should coerce each value in the Array to a String, and then join those values together using the second argument as a separator. You  may assume tha a separator will lways be passed.
```javascript
join(['bri', 'tru', 'wha'], 'ck ');       // 'brick truck wha'
join([1, 2, 3], ' and ');                 // '1 and 2 and 3'
```

### Solution

```javascript
function join(arr, separator) {
  var i;
  var joined = '';

  for (i = 0; i < arr.length; i++) {
    joined += String(arr[i]);
    if (i < arr.length - 1) {
      joined += separator;
    }
  }
  
  return joined;
}
```
