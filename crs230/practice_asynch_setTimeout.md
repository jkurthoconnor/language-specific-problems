# LS Exercises: [Asynchronous Programming with `setTimeout`]()

## Problem 1:

Write a JavaScript function named delayLog that loops through the numbers from 1 to 10, and logs each number after that number of seconds. It should log 1 after 1 second, 2 after 2 seconds, etc.

```
> delayLog();
1  // 1 second later
2  // 2 seconds later
3  // 3 seconds later
4  // etc...
5
6
7
8
9
10
```

### Solution:

```javascript
// the key is to see that the callback accesses the variables (`counter`) at
// the time of callback execution, not `setTimeout` execution
function delayLog() {
  var timer = 1;
  var counter = 1;

  for (; timer < 11; timer += 1) {
    setTimeout(function () {
      console.log(counter);
      counter += 1;
    }, timer * 1000);
  }

}

// or for fun:
function delayLog() {
  var id;
  var count = 1;

  id = setInterval(function() {
      console.log(count);
      count += 1;
    }, 1000);

  setTimeout(function() {
    clearInterval(id);
  }, 10000);
}


// using ES6's block-scoped `let`
function setTimer() {
  for (let delay = 1; delay <= 30; delay++) {
    setTimeout(function() {
      console.log(delay);
    }, delay * 1000);
  }
}

// or using an IIFE
function setTimer() {
  for (var delay = 1; delay <= 30; delay++) {
    (function (n) {
      return setTimeout(function() {
        console.log(n);
        }, n * 1000);
    })(delay);
  }
}

```

## Problem 2:


In what sequence will the JavaScript runtime run the following lines of code? Number them from 1-8 to show the order of execution.

### Solution:
```javascript
setTimeout(function() {   // 1
  console.log('Once');    // 5
}, 1000);

setTimeout(function() {   // 2
  console.log('upon');    // 7
}, 3000);

setTimeout(function() {   // 3
  console.log('a');       // 6
}, 2000);

setTimeout(function() {   // 4
  console.log('time');    // 8
}, 4000);
```


## Problem 3:

In what sequence does the JavaScript runtime run the functions q(), d(), n(), z(), s(), f(), and g() in the following code?


### Solution:
```javascript
setTimeout(function() {
  setTimeout(function() {
    q(); //  7 (25 millisecond delay)
  }, 15);

  d();  // 3 (10 millisecond delay, comes before z)

  setTimeout(function() {
    n();  // 5 (15 millisecond delay
  }, 5);

  z();  // 4 (10 millisecond delay, but comes afer d)
}, 10);

setTimeout(function() {
  s();
}, 20);   //  6 (20 millisecond delay)

setTimeout(function() {
  f();   // 2 (no delay argument, so defaults to 0 delay, _but delay may be
          //   longer than specified)
});

g();  // 1
```

## Problem 4:

Write a function named afterNSeconds that takes two arguments: a callback and a time duration in seconds. The function should wait for the indicated period, then invoke the callback function.

### Solution:

```javascript
function afterNSeconds(callback, seconds) {
  setTimeout(callback, seconds * 1000)
}

function log(n) {
  return function() {
    console.log(n);
  }
}

var log10 = log(10);
var logHello = log('hello');

afterNSeconds(log10, 10);
afterNSeconds(logHello, 15);
```
