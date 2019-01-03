# LS Practice Problems: [Partial Function Application]()

## Problem 1:

Implement `sub5` below such tha the invocation returns `5`.

```javascript
function subtract(a, b) {
  return a - b;
}

function sub5(a) {
  // implement this function using partial function application
}

sub5(10); // 5
```
### Solution:

```javascript
function subtract(a, b) {
  return a - b;
}

function sub5(a) {
  return subtract(a, 5);
}

console.log(sub5(10)); // 5
```

## Problem 2:

Implement the `makeSubN` function below so that we can supply any value we want to be subtracted from `a` and get a new function that will always subtract this value.

```javascript
function subtract(a, b) {
  return a - b;
}

function makeSubN(n) {
  // implement this function...
}

var sub5 = makeSubN(5);
sub5(10); // 5```
```

### Solution:

```javascript
function subtract(a, b) {
  return a - b;
}

function makeSubN(n) {
  return function (arg) {
   return subtract(arg, n);
  };
}

var sub5 = makeSubN(5);
console.log(sub5(10)); // 5
```

## Problem 3:

Now implement `makePartialFunc` to allow us to supply any operation, not just subtraction.

```javascript
function makePartialFunc(func, b) {
  // implement this function...
}

function multiply(a, b) {
  return a * b;
}

var multiplyBy5 = makePartialFunc(multiply, 5);

multiplyBy5(100); // 500
```

### Solution:

```javascript
function makePartialFunc(func, b) {
  return function (n) {
    return func(n, b);
  };
}

function multiply(a, b) {
  return a * b;
}

var multiplyBy5 = makePartialFunc(multiply, 5);

console.log(multiplyBy5(100)); // 500
```

## Problem 4:

In our previous solution, `multiplyBy5` retains access to `func` and `b` long after `makePartialFunc` has finished execution. What makes this possible?

### Solution:

This access is possible becasue `multiplyBy5` closes over the scope of `makePartialFunc`, and `func` and `b` are arguments in that scope.

## Problem 5:

Implement `makeMathRollCall` such that it retuns a partially applied `rollCall` function, with the `subjext` as `'Math'`.

```javascript
var subjects = {
  English: ['Bob', 'Tyrone', 'Lizzy'],
  Math: ['Fatima', 'Gary', 'Susan'],
  Biology: ['Jack', 'Sarah', 'Tanya'],
};

function rollCall(subject, students) {
  console.log(subject + ':');
  students.forEach(function(student) {
    console.log(student);
  });
}

function makeMathRollCall() {
  // implement this function...
}

var mathRollCall = makeMathRollCall();
mathRollCall(subjects['Math']);
// Math:
// Fatima
// Gary
// Susan
```

### Solution:

```javascript
var subjects = {
  English: ['Bob', 'Tyrone', 'Lizzy'],
  Math: ['Fatima', 'Gary', 'Susan'],
  Biology: ['Jack', 'Sarah', 'Tanya'],
};

function rollCall(subject, students) {
  console.log(subject + ':');
  students.forEach(function(student) {
    console.log(student);
  });
}

function makeMathRollCall() {
  return function (students) {
    return rollCall('Math', students);
  };
}
```
