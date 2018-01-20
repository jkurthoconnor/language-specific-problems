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
Write a function that accepts two arguments, an array and an integer index, and returns the elements at the given index. What happens if the index is greater than the length of the array? What happens if it is a negative integer?

```javascript
function nthElementOf(arr, index) {
  // ...
}

var digits = [4, 8, 15, 16, 23, 42];

nthElementOf(digits, 3);   // returns 16
nthElementOf(digits, 8);   // what does this return?
nthElementOf(digits, -1);  // what does this return?
```

### Solution

```javascript
// accessing a non-existent index will return `undefined`
function nthElementOf(arr, idx) {
  return arr[idx];
}

var digits = [4, 8, 15, 16, 23, 42];
```



## 4.
Can we insert data into an array at a negative index? If so, why is this possible?

### Solution
Yes, it can be done.  It has to do with the fact that an array is an object. But note that the data can be added at a negative index, but it won't appear as an element; rather it appears as part of the array object.
```javascript
```



## 5.
Write a function that accepts an array as the first argument and an integer value, `count`, as the second. It should return a new array that contains the first `count` elments of the array.

```javascript
function firstNOf(arr, count) {
  // ...
}

var digits = [4, 8, 15, 16, 23, 42];
firstNOf(digits, 3);    // returns [4, 8, 15]
```

### Solution

```javascript
function firstNOf(arr, count) {
  var selection = [];
  var i;

  for (i = 0; i < count; i++) {
    selection[selection.length] = arr[i];
  }

  return selection;
}
```



## 6.
Write a function like the previous one, except this time return the last `count` elements as a new array.

```javascript
function lastNOf(arr, count) {
  // ...
}

var digits = [4, 8, 15, 16, 23, 42];
lastNOf(digits, 3);    // returns [16, 23, 42]
```

### Solution

```javascript
function lastNOf(arr, count) {
  var selection = [];
  var i;

  for (i = arr.length - count; i < arr.length; i++) {
    selection.push(arr[i]);
  }

  return selection;
}

// or more succinctly with `slice`:
function lastNOf(arr, count) {
  return arr.slice(arr.length - count);
}
```


## 7.
Using the function from the previous problem, what happens if you pass a `count` greater than the length of the array? How can you fix the function so it returns  a new instance of the entire array when `count` is greater than the array length?

### Solution
If `count` is greater than the array's length, then the `slice` method will be passed a negative value for the `begin` parameter. This will be interpreted as a negative index for the start, so, for example `-3` will be taken to mean 'start at the third element from the end of the array'.

To prevent this from occurring, and to return a new instance of the array under such conditions, a guard clause could be introduced as below:

```javascript
function lastNOf(arr, count) {
  return (count > arr.length ? arr.slice() : arr.slice(arr.length - count));
}
```


## 8.
Write a function that accepts two arrays as arguments and returns an array with the first element from the first array and the last element from the second array.
```javascript
function endsOf(beginningArr, endingArr) {
  // ...
}

endsOf([4, 8, 15], [16, 23, 42]);  // returns [4, 42]
```

### Solution

```javascript
function endsOf(beginningArr, endingArr) {
  return [beginningArr[0], endingArr[endingArr.length - 1]];
}
```



