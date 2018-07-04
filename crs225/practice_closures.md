# LS Practice: [Closures]()

## Problem 1:

Write a function that, when invoked and passed a number, returns a function that logs every positive integer multiple of the number less than 100. Usage looks like:

```javascript
> var lister = makeMultipleLister(13);
> lister();
13
26
39
52
65
78
91
```
### Solution:

```javascript
function makeMultipleLister(n) {
  return function () {
    var i = 1;

    while (n * i < 100) {
      console.log(n * i);
      i += 1;
    }
  }
}
```

## Problem 2:

Write a program that uses two functions, `add` and `subtract`, to manipulate a running total value. When you invoke either function with a number, it should add or subtract that number from the running total and log the new total to the console. Usage:

```javascript
> add(1);
1
> add(42);
43
> subtract(39);
4
> add(6);
10
```

### Solution:

```javascript
var total = 0;

function add(n) {
  console.log(total += n);
}

function subtract(n) {
  console.log(total -= n);
}

add(1);
add(42);
subtract(39);
add(6);
```

## Problem 3:

Write a function named `later` that takes two aruments: a function and an argument for that function. The return value should be a new function that calls the imput function with the provided argument, like this:

```javascript
> var logWarning = later(console.log, 'The system is shutting down!');
> logWarning();
The system is shutting down!
```

### Solution:

```javascript
function later(func, arg) {
  return function () {
    func(arg);
  };
}

var logWarning = later(console.log, 'The system is shutting down!');
logWarning();
// The system is shutting down!

```

## Problem 4:

Given the code below, how can you set the value of `systemStatus` to the value of the inner variable `status` without changing `startup` in any way?

```javascript
function startup() {
  var status = 'ready';
  return function() {
    console.log('The system is ready.');
  };
}

var ready = startup();
var systemStatus = // ?
```

### Solution:

It can't be done. `status` is within `startup` scope; altough the returned function could access it (as a closure), `status` is de facto _private_
