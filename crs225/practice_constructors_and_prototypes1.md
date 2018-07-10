# LS Practice: [Constructor Functions and Prototypes 1](https://launchschool.com/lessons/24a4613a/assignments/2d53f659)

## Problem 1:

What does the following  code log to the console?

```javascript
var a = 1;
var foo;
var obj;

function Foo() {
  this.a = 2;
  this.bar = function() {
    console.log(this.a);
  };
  this.bar();
}

foo = new Foo();

foo.bar();
Foo();

obj = {};
Foo.call(obj);
obj.bar();

console.log(this.a);
```

### Solution:
It logs a series of 6 '2's. Explanation in comments.

```javascript
var a = 1;
var foo;
var obj;

function Foo() {
  this.a = 2;
  this.bar = function() {
    console.log(this.a);
  };
  this.bar();
}

foo = new Foo();// 2  `this.bar()` executes at end of construction
                //      and when a constructor is called with `new`
                //      `this` refers to the new object, or `foo`

foo.bar();// 2        as expected for method invocation
Foo();// 2            `Foo()` without `new` executes as any other function;
        //            in this case that means `this` refers to global object
        //            so global `a` is reassigned to 2, and `bar` becomes a
        //            method on the global object. `this.bar()` thus logs 2
        //            as the value of _global_ `a`

obj = {};
Foo.call(obj);// 2   with the execution context of an empty object, `Foo`
              //    ends up assigning the properties in its body to `obj`
              //    so on its last line, `this.bar()` is equivalent to
              //    `obj.bar()`, and `this.a` is `obj.a`, or `2`
obj.bar();//2        as in explanation above, `obj.bar()` accesses `obj.a`
          //        and thus logs `2`

console.log(this.a);// 2  global `a` was assigned `2` with `Foo()` above
```

## Problem 2:

What does the following log to the console?

```javascript
var RECTANGLE = {
  area: function() {
    return this.width * this.height;
  },
  circumference: function() {
    return 2 * (this.width + this.height);
  },
};

function Rectangle(width, height) {
  this.width = width;
  this.height = height;
  this.area = RECTANGLE.area();
  this.circumference = RECTANGLE.circumference();
}

var rect1 = new Rectangle(2, 3);
console.log(rect1.area);
console.log(rect1.circumference);
```

### Solution:

`NaN`
`NaN`

In constructing the `rect1` object, `RECTANGLE.area` and `RECTANGLE.circumference`
are called; in each case they depend on the value of `this.width` and `this.height`
, where `this` resolves to `RECTANGLE`; but `RECTANGLE` has no properties. With
a failed property lookup, the return is `undefined`, and throwing that into 
a math operation returns `NaN`

How to fix this?

Explicitly calling `area` and `circumference` from `this` inside `Rectangle` will work.

```javascript
function Rectangle(width, height) {
  this.width = width;
  this.height = height;
  this.area = RECTANGLE.area.call(this);
  this.circumference = RECTANGLE.circumference.call(this);
}
```

## Problem 3:

Write a constructor function Circle, that takes a radius as an argument. You should be able to call an area method on the created objects to get the circle's area. Test your implementation with the following code:

```javascript
var a = new Circle(3);
var b = new Circle(4);

console.log(a.area().toFixed(2)); // 28.27
console.log(b.area().toFixed(2)); // 50.27
```

### Solution:

```javascript
function Circle(radius) {
  this.radius =  radius;
  this.area = function() {
    return Math.PI * (Math.pow(this.radius, 2));
  };
}

var a = new Circle(3);
var b = new Circle(4);
```

A better solution would avoid requiring each circle object to hold the shared behavior.

```javascript
function Circle(radius) {
  this.radius =  radius;
}

Circle.prototype.area = function () {
  return Math.PI * Math.pow(this.radius, 2);
};

var a = new Circle(3);
var b = new Circle(4);
```

## Problem 4:

What will the followng code log out and why?

```javascript
var ninja;

function Ninja() {
   this.swung = true;
 }

 ninja = new Ninja();

 Ninja.prototype.swingSword = function() {
   return this.swung;
 };

 console.log(ninja.swingSword());
```

### Solution:

The code logs `true`. Explanation below.

```javascript
var ninja;

function Ninja() {
 this.swung = true;
}

ninja = new Ninja();              // new object `ninja` is created; since the 
                            // constructor is properly called with `new`, `this`
                            // in the function evaluates to the `ninja` object
                            // so `ninja.swung = true` is assigned; 

Ninja.prototype.swingSword = function() { // `Ninja.prototype` object is assigned
 return this.swung;                       // a `swingSword` function
};

console.log(ninja.swingSword());  // true
                                  // `swingSword` is invoked via method invocation
                                  // so `this` in the function evaluates to the 
                                  // calling object, or `ninja`. `ninja.swung` is `
                                  // `true`, so that is the return value.
```

## Problem 5:

What will the following code log out and why?

```javascript
var ninja;

function Ninja() {
 this.swung = true;
}

ninja = new Ninja();

Ninja.prototype = {
 swingSword: function() {
   return this.swung;
 },
};

console.log(ninja.swingSword());
```

### Solution:

TypeError: `ninja.swingSword` is not a function.

```javascript
var ninja;

function Ninja() {
 this.swung = true;
}

ninja = new Ninja();

Ninja.prototype = {           // `Ninja.prototype` object is replaced with a new one;
 swingSword: function() {     // `ninja` keeps the original prototype object as
   return this.swung;         // its reference for inheritance/delegation.
 },                           // With `Ninja.prototype` pointing to an object, 
};                            // not in `ninja`s prototype chain, `swingSword` 
                              // is not inherited by `ninja`

console.log(ninja.swingSword());// TypeError: `ninja.swingSword` is not a function
```

## Problem 6:

Implement the method described in the comments.

```javascript
var ninjaA;
var ninjaB;

function Ninja() {
 this.swung = false;
}

ninjaA = new Ninja();
ninjaB = new Ninja();

// Add a swing method to the Ninja prototype which
// returns itself and modifies swung

console.log(ninjaA.swing().swung);      // this needs to be true
console.log(ninjaB.swing().swung);      // this needs to be true
```

### Solution:

```javascript
var ninjaA;
var ninjaB;

function Ninja() {
 this.swung = false;
}

ninjaA = new Ninja();
ninjaB = new Ninja();

Ninja.prototype.swing = function () {
  this.swung = true;
  return this; // method is made chainable by returning `this`
};
```

## Problem 7:

In this problem, we ask you to create a new instance of an object, without having direct access to the constructor function:

```javascript
var ninjaA = (function() {
  function Ninja(){};
  return new Ninja();
})();

// create a ninjaB object

console.log(ninjaB.constructor === ninjaA.constructor);    // this should be true
```

### Solution:

```javascript
var ninjaA = (function() {
  function Ninja(){};
  return new Ninja();
})();

var ninjaB = Object.create(ninjaA.__proto__);

// var ninjaB = new ninjaA.constructor();     // also works NB: () are optional
                                              // if no args are passed; 
                                              // `new` is doing the work
                                              // of creating a new instance

// why does it work? `constructor` points
// to the constructor function itself; since `ninjaA.constructor` evaluates
// to its constructor function, `Ninja`, it can be called with 
// the `new` operator

console.log(ninjaB.constructor === ninjaA.constructor);    //  true
```
