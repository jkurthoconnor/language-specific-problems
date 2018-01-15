# Practice Problems: [Arrays](https://launchschool.com/lessons/e2c71a47/assignments/f5ea4b58)


## Problem 1.
Write a function named `lastInArray`that returns the value of the last element in the aray provided by the function's argument. Do not use any methods or properites other than the `length` property and the `[]` operator.


### Solution

```javascript
function lastInArray(arr) {
  var lastIdx = arr.length - 1;

  return arr[lastIdx];
}

console.log(lastInArray([1, 23, 100]));
console.log(lastInArray([1, 23, 200]));
console.log(lastInArray([1, 23, 77]));
console.log(lastInArray([1, 23, 100, 20123, 'h3llo']));
```

## Problem 2.
Create a function named `rollCall` that takes an array of first names as an argument and logs all the names to the console, one name per line. You should log the names in the same sequence they appear in the array. Use a `for` loop to process the array.



### Solution

```javascript
function rollCall(names) {
  var i;

  for (i = 0; i < names.length; i++) {
    console.log(names[i]);
  }
}

rollCall(['harry', 'lilly', 'gertrude', ' ', 'timmy']);

```
## Problem 3.
Write a function that returns the content of the array it receives as an argument, but with the values in reversed order. Use a `for` loop that iterates over the elements from the end of the array to the beginning, and pushes each element's value to a new result array.

### Solution

```javascript
function reverse(arr) {
  var i;
  var reversed = [];

  for (i = arr.length - 1; i >= 0; i--) {
    reversed.push(arr[i]);
  }

  return reversed;
}

  console.log(reverse(['harry', 'lilly', 'gertrude', ' ', 'timmy']));
```

## Problem 4.
Create a function that find the first instance of a value in an array and returns the index position of the value, or -1 if the value is not in the array. The function should take two arguments: the value to search for, and the array to search. Use the `break` keyword to exit the loop immediately when you find the first instance of the value. If ou don't find the value, make sure you don't use the final index value as your return value.


### Solution

```javascript
function firstInstance(value, arr) {
  var i;

  for (i = 0; i < arr.length; i++) {
    if (arr[i] === value) {
      break;
    }
  }

  return ((i === arr.length) ? -1 : i);
}

console.log(firstInstance('lilly', ['harry', 'lilly', 'gertrude', ' ', 'timmy']));
console.log(firstInstance('gertrude', ['harry', 'lilly', 'gertrude', ' ', 'timmy']));
console.log(firstInstance('patrick', ['harry', 'lilly', 'gertrude', ' ', 'timmy']));

```
## Problem 5.
Write a function that returns a string of all the values in an array with no intervening content. For example, your function should return `'1a4'` if the argument is `[1, 'a', 4]`. Use a `for` loop to process the array elements in sequence, and coerce eah value in the array to a String before concatenating it to the result string.


### Solution

```javascript
function compress(arr) {
  var i;
  var compressed = '';

  for (i = 0; i < arr.length; i++) {
    compressed += String(arr[i]);
  }

  return compressed;
}

console.log(compress(['harry', 'lilly', 'gertrude', ' ', 'timmy']));
console.log(compress(['thisis', 'areall  y', 100]));
```
