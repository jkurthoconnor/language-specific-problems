LS Exercises: [JavaScript Functions](https://launchschool.com/exercises/a00f2b05)


## Problem 1

```javascript
var myVar = 'This is global';

function someFunction() {
  var myVar = 'This is local';
}

someFunction();
console.log(myVar);
```

### Solution

Output:
  This is global

Explanation:
  Functions in JS create their own scope. Because `someFunction()` declares its own `myVar`, this function-scoped variable shadows the global `myVar` declared at the top of the program.  As a result, when the function assigns `This is local` to `myVar`, `myVar` resolves to the local function-scoped variable.  `console.log(myVar)` has no access to the local / function scoped variable, so there `myVar` resolves to the global variable, and the line logs `This is global`



## Problem 2

What will the following code log to the console and why? Don't run the code until after you have tried to answer.

```javascript
var myVar = 'This is global';

function someFunction() {
  var myVar = 'This is local';
  console.log(myVar);
}

someFunction();
```

### Solution

Output:
  This is local

Explanation:
  This function declares and assigns its own `myVar` to point to `This is local`. When resolving `myVar` in order to log its value, the interpreter never 'sees' the global-scoped `myVar`, stopping instead at the first identifier that matches. So, because the logging occurs withing the function but after the value assignment, the program logs `This is local`.




## Problem 3

What will the following code log to the console and why? Don't run the code until after you have tried to answer.

```javascript
var myVar = 'This is global';

function someFunction() {
  myVar = 'This is local';
}

someFunction();
console.log(myVar);
```

### Solution

Output:
  This is local

Explanation:
  In this case the assignment of `This is local` within `someFunction` does attach to the global `myVar`.  In fact, there is only one `myVar` in this program because the function does not declare this variable, it merely assigns to it a new value.

## Problem 4
```javascript
var myVar = 'This is global';

function someFunction() {
  console.log(myVar);
}

someFunction();
```

### Solution

Output:
  This is global


Explanation:
  There is only one `myVar` in this program, and it points to `This is global`. Because `myVar` is available to the function and to the logging invoked within the function, the output is `This is global`


## Problem 5

```javascript
function someFunction() {
  myVar = 'This is global';
}

someFunction();
console.log(myVar);
```

### Solution

Output:
  This is global

Explanation:
  `myVar` is never explicity declared in this program. The function code simply assigns a value to `myVar`. Variable reference and variable assignment work differently when the variable is not declared in an available scope.  Referencing an undeclared / unavailable variable results in a ReferenceError, but assigning a value to an undeclared variable simply forces the variable to become a property of the global object, which is almost the same as declaring it in global scope.  Thus, because the logging occurs after the function call that assigns a value to `myVar`, the program outputs `This is global`.


## Problem 6

What will the following code log to the console and why?

```javascript
var a = 7;

function myValue(b) {
  b += 10;
}

myValue(a);
console.log(a);
```

### Solution

Output:
  7

Explanation:
  `myValue` does nothing to reassign the globally-scoped `a`.  Yes, the value to which `a` points is passed in and incremented by 10, but it is only stored as the function-scoped `b`, with no relation to `a`. Thus, when `a` is logged it remains with its originally assigned value of 7.

## Problem 7

What will the following code log to the console and why?

```javascript
var a = 7;

function myValue(a) {
  a += 10;
}

myValue(a);
console.log(a);
```

### Solution

Output:
  7

Explanation:
  Just as in the previous problem, the `myValue` function does nothing to change the value to which global-scoped `a` points. While the function variable is also named `a`, this is not the global `a`, and so the function variable shadows the global variable; incrementing `a` in the function only increments the value passed in, not the actual value to which global-scope `a` points.

## Problem 8

```javascript
var a = [1, 2, 3];

function myValue(b) {
  b[2] += 7;
}

myValue(a);
console.log(a);
```

### Solution

Output:
  [1, 2, 10]

Explanation:
  The value of `a` is passed in, and because `a`'s value is an object, the value passed is reference to the object itself. Thus the incrementation is actually mutating the array object to which both `a` and `b` point. Therefore, logging `a` in global scope thus outputs the value of `a` with the element at index 2 incremented by 7.


## Problem 9

```javascript
console.log(a);

var a = 1;
```

### Solution

Output:
  undefined

Explanation:
  `undefined` is the value of a declared variable that has not been explicitly assigned a value.  In this code, the variable declaration is hoisted to the top but the assignment remains and is executed in its original location, i.e. after the logging. So `undefined` is logged to the console.

## Problem 10

```javascript
logValue();

function logValue() {
  console.log('Hello, world!');
}
```

### Solution

Output:
  Hello, world!

Explanation:
  Because of hoisting, the entire function declaration, block included, is hoisted to the top of the code. Thus the Javascript interpreter already has available to it the `logValue` function at the point in the program when `logValue` is called.

Further Exploration:

What does this code log? What is its hoisted equivalent?

```javascript
var logValue = 'foo';

function logValue() {
  console.log('Hello, world!');
}

console.log(typeof logValue);
```

### Solution

The hoisted equivalent:

```javascript
function logValue() {
  console.log('Hello, world!');
  }

logValue = 'foo';

console.log(typeof logValue);
```

Output:
  String
