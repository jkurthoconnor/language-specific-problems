# LS Practice: [Higher Order Functions](https://launchschool.com/lessons/0b371359/assignments/a4544340)

## Problem 2:

Consider the code below.  Of the two functions invoked, which is a higher-order function and why?

```javascript
var numbers = [1, 2, 3, 4];
function checkEven(number) {
  return number % 2 === 0;
}

numbers.filter(checkEven); // [2, 4]
```

### Solution: 

`filter` is the higher-order function because it accepts a function, `checkEven` as an argument.

## Problem 3:

Implement the function below so the last line returns the expected array.

```javascript
var numbers = [1, 2, 3, 4];
function makeCheckEven() {
  // ... implement this function
}

var checkEven = makeCheckEven();

numbers.filter(checkEven); // [2, 4]
```

### Solution:

```javascript
var numbers = [1, 2, 3, 4];

function makeCheckEven() {
  return function(value) {
    return value % 2 === 0;
  };
}

var checkEven = makeCheckEven();

numbers.filter(checkEven); // [2, 4]

```

## Problem 4:
Implement `execute` below, such that the retunr values for the two function invocations match the commented values.

```javascript
function execute(func, operand) {
  // ... implement this function
}

execute(function(number) {
  return number * 2;
}, 10); // 20

execute(function(string) {
  return string.toUpperCase();
}, 'hey there buddy'); // "HEY THERE BUDDY"
```

### Solution:

```javascript
function execute(func, operand) {
  return func(operand);
}

execute(function(number) {
  return number * 2;
}, 10); // 20

execute(function(string) {
  return string.toUpperCase();
}, 'hey there buddy'); // "HEY THERE BUDDY"
```

## Problem 5:

Implement `makeListTransformer` such that `timesTwo`'s return value matches the commented return value.

```javascript
function makeListTransformer(func) {
  // ... implement this function
}

var timesTwo = makeListTransformer(function(number) {
  return number * 2;
});

timesTwo([1, 2, 3, 4]); // [2, 4, 6, 8]
```

### Solution:

```javascript
function makeListTransformer(func) {
  return function(array) {
    return array.map(func);
  };
}

var timesTwo = makeListTransformer(function(number) {
  return number * 2;
});

console.log(timesTwo([1, 2, 3, 4])); // [2, 4, 6, 8]
```
