# [Practice Problems: Basic Array Uses](https://launchschool.com/lessons/e2c71a47/assignments/24094ab7)


## 1.

Write a function that returns the first element of an array passed in a an argument.

```javascript
function firstElementOf(arr) {
  // ...
}

firstElementOf(['U', 'S', 'A']);  // returns "U"
```

### Solution

```javascript
function firstElementOf(arr) {
  return arr[0];
}

console.log(firstElementOf(['U','S','A']));                               // true
```



## 2.
Write a function that returns the last element of an array passed in as an argument.

### Solution
```javascript
function lastElementOf(arr) {
  return arr[arr.length - 1];
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



## 1.

```javascript
```

### Solution

```javascript
```



## 1.

```javascript
```

### Solution

```javascript
```



## 1.

```javascript
```

### Solution

```javascript
```



