# LS Practice: [Constructor Functions and Prototypes 2](https://launchschool.com/lessons/24a4613a/assignments/cbb1afa7)

## Problem 1:

Follow the steps below:

    - Create an object called shape that has a getType method.
    - Define a Triangle constructor function whose prototype is shape. Objects created with Triangle should have four own properties: a, b, c (representing the sides of a triangle), and type.
    - Add a new method to the prototype called getPerimeter.

Test your implementation with the following code:

```javascript
var t = new Triangle(1, 2, 3);

t.constructor;                 // Triangle(a, b, c)
shape.isPrototypeOf(t);        // true
t.getPerimeter();              // 6
t.getType();                   // "triangle"
```

### Solution:

```javascript
var shape = {
  getType: function () {
    return this.type;
  },
};

function Triangle(a, b, c) {
  this.a = a;
  this.b = b;
  this.c = c;
  this.type = 'triangle';
}

Triangle.prototype = Object.create(shape);
Triangle.prototype.getPerimeter = function () {
  return this.a + this.b + this.c;
};
Triangle.prototype.constructor = Triangle;// must reassign constructor;
                                          // otherwise `shape`s constructor
                                          // would be used, and as an object
                                          // literal, that would be `Object()`
```

## Problem 2:

Since a constructor is just a function, it can be called without the new operator, and this can lead to unexpected results and errors especially for inexperienced programmers.

Write a constructor function that can be used with or without the new operator, and return the same result in either form. Use the code below to check your solution:

```javascript
function User(first, last) {
  // ...
}

var name = 'Jane Doe';
var user1 = new User('John', 'Doe');
var user2 = User('John', 'Doe');

console.log(name);         // Jane Doe
console.log(user1.name);   // John Doe
console.log(user2.name);   // John Doe
```

### Solution:

```javascript
// this 'scope-safe' constructor ensures the desired result even if the function
// is called without the `new` operator
// The key is that when called with `new`, `this` is set to point to the new object

function User(first, last) {
  // if (this.constructor !== User) { // << also works
  if (!(this instanceof User)) {
    return new User(first, last);
  }

  this.first = first;
  this.last = last;
  this.name = this.first + ' ' + this.last;
}

var name = 'Jane Doe';
var user1 = new User('John', 'Doe');
var user2 = User('John', 'Doe');

console.log(name);         // Jane Doe
console.log(user1.name);   // John Doe
console.log(user2.name);   // John Doe

```

## Problem 3:

Create a function that can create an object with a given object as its prototype, without using Object.create.

### Solution:

```javascript
function createObject(obj) {
  function MakeWithPrototype() {}

  MakeWithPrototype.prototype = obj;
  return new MakeWithPrototype();
}

var foo = {
  a: 1
};

var bar = createObject(foo);
console.log(foo.isPrototypeOf(bar));         // true

// also works:

function createObject(obj) {
  var newObj = {};

  newObj.__proto__ = obj;

  return  newObj;
}

```

## Problem 4:

Similar to the problem above, create a `begetObject` method that you can call on any object to create an object inherited from it:

```javascript
var foo = {
  a: 1,
};

var bar = foo.begetObject();
foo.isPrototypeOf(bar);         // true
```

### Solution:

As a `foo` method, the solution below would require extracting the method to be called on other objects

```javascript
var foo = {
  a: 1,
};

foo.begetObject = function () {
  return Object.create(this);
}

var bar = foo.begetObject();
console.log(foo.isPrototypeOf(bar));         // true
console.log(bar);                           // {}
console.log(bar.__proto__);                 // {a: 1, begetObject: f}
```

The preferred solution would assign the method to `Object.prototype` so that it could immediately be called on any object.

```javascript
var foo = {
  a: 1,
};

var baz = {
  b: 2,
};


Object.prototype.begetObject = function () {
  return Object.create(this);
}

var bar = foo.begetObject();
var qux = baz.begetObject();
console.log(foo.isPrototypeOf(bar));         // true
console.log(baz.isPrototypeOf(qux));         // true
```

## Problem 5:

Create a function `neww`, so that it works like the `new` operator:

```javascript
function neww(constructor, args) {
  // ..
}

function Person(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
}

Person.prototype.greeting = function() {
  console.log('Hello, ' + this.firstName + ' ' + this.lastName);
};

var john = neww(Person, ['John', 'Doe']);
john.greeting();          // Hello, John Doe
john.constructor;         // Person(firstName, lastName) {...}
```

### Solution:

```javascript
function neww(constructor, args) {
  var obj = {};

  obj.__proto__ = constructor.prototype;
  constructor.apply(obj, args);
  return obj;
}

function Person(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
}

Person.prototype.greeting = function() {
  console.log('Hello, ' + this.firstName + ' ' + this.lastName);
};

var john = neww(Person, ['John', 'Doe']);
console.log(john.greeting());          // Hello, John Doe
console.log(john.constructor);         // Person(firstName, lastName) {...}

```
