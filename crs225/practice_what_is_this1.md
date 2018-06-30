# LS Practice: [What is this (1)](https://launchschool.com/lessons/c9200ad2/assignments/82f593ef)

## Problem 1:

What does this point to in the code below?

```javascript
function whatIsMyContext() {
  return this;
}
```

### Solution:

Indeterminate.  One can't tell what `this` is without considering the invocation type.

## Problem 2:

What does `this` point to in the code below?

```javascript
function whatIsMyContext() {
  return this;
}

whatIsMyContext();
```

### Solution:

The function is invoked using function invocation, so `this` refers to the global object. If this is a browser environment, this === window; else this === global.

## Problem 3:

What does `this` point to here?

```javascript
function foo() {
  function bar() {
    function baz() {
      console.log(this);
    }

    baz();
  }

  bar();
}

foo();
```

### Solution:

`this`  is inside the `baz` function, which is invoked via function invocation, so the execution context is the implicit global object, i.e. in a browser environment, it is the window

## Problem 4:

What does `this` point to here?

```javascript
var obj = {
  count: 2,
  method: function() {
    return this.count;
  },
};

obj.method();
```

### Solution:

`this` is in the `method` method, which is invoked via method invocation. Thus
`this` points to the object that owns the method.  In this case that is `obj`

## Problem 5:

What does the following program log to the console?

```javascript
function foo() {
  console.log(this.a);
}

var a = 2;
foo();
```

### Solution:

`foo` is the contains `this`, and since `foo` is invoked with function invocation the execution context will be the implicit global object. The global var `a` is a property on the global object, so the program will log the value of global `a` (`window.a`), i.e. 2.


## Problem 6:

What does the following log to the console?

```javascript
var a = 1;
function bar() {
  console.log(this.a);
}

var obj = {
  a: 2,
  foo: bar,
};

obj.foo();
```

### Solution:

`this` appears within the `bar` function, but it is invoked as a method on the `foo` object. Thus, `this.a` evaluates to `obj.a`, which in turn evaluates to 2. 2 is logged.

## Problem 7:

What does the following log to the console?

```javascript
var foo = {
  a: 1,
  bar: function() {
    console.log(this.baz());
  },

  baz: function() {
    return this;
  },
};

foo.bar();
var qux = foo.bar;
qux();
```

### Solution:

`foo` is logged from line 12 because `bar` is invoked as a method on `foo`, which ultimately logs the return value of `this.baz()` [i.e. foo.baz()], which is `foo`.

line 14 logs TypeError, because `this` in an extracted method called as a function is the global object, and `baz` is not a property/function on the global object
