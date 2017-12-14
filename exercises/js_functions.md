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
  Because `someFunction()` declares its own `myVar`, this function-scoped variableshadows the global `myVar`.  As a result, when the function assigns `This is local` the value is attached only to the local variable.  `console.log(myVar)` has no access to the local / function scoped variable, so it logs `This is global`
  


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
  This function declares and assigns its own `myVar` to point to `This is local`. So, because the logging occurs withing the function but after the value assignment, the program logs `This is local`.




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


## Problem

```javascript

```

### Solution

```javascript

```


## Problem

```javascript

```

### Solution

```javascript

```


## Problem

```javascript

```

### Solution

```javascript

```


## Problem

```javascript

```

### Solution

```javascript

```


## Problem

```javascript

```

### Solution

```javascript

```
