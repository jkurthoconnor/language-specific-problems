# LS Exercises: [Repeating Execution with `setInterval`]()

## Problem 1:

Write a function named startCounting that logs a number to the console every second, starting with 1. Each number should be one greater than the previous number.

### Solution:

```javascript
function startCounting() {
  var count = 1;
  var id = setInterval(function() {
    console.log(count);
    count += 1;
  }, 1000);
}
```

## Problem 2:

Extend the code from the previous problem with a `stopCounting` function that stops the logger when called.

### Solution:

```javascript
function startCounting() {
  let n = 1;

  let stopId = setInterval(function() {
    console.log(n);
    n++;
  }, 1000);

  return function() {
    clearInterval(stopId);
  }
}

var stopCounting = startCounting();
stopCounting();
```
