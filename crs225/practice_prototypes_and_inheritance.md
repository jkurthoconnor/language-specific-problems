# LS Practice: [Prototypes and Prototypal Inheritance](https://launchschool.com/lessons/24a4613a/assignments/b158be5a)

## Problem 1:

Write a function that retuns the object on a given object's prototype chain where a property is defined. See example code below:

```javascript

function getDefiningObject(object, propKey) {
  // ...
}

var foo = {
  a: 1,
  b: 2,
};

var bar = Object.create(foo);
var baz = Object.create(bar);
var qux = Object.create(baz);

bar.c = 3;

console.log(getDefiningObject(qux, 'c') === bar);     // true
console.log(getDefiningObject(qux, 'e'));             // null
```

### Solution:
```javascript
function getDefiningObject(object, propKey) {
  var checkNext = object;

  while (object[propKey]) {
    if (checkNext.hasOwnProperty(propKey)) {
      return checkNext;
    }

    checkNext = Object.getPrototypeOf(checkNext);
  }

  return null;
}
```

## Problem 2:

Write a function to provide a shallow copy of an object.  The object that you copy should share the same prototype chain as the original object, and it should have the same own properties that return the same values or objects when accesed.  Use the code below to verify implementation:

```javascript
function shallowCopy(object) {
  // ...
}

var foo = {
  a: 1,
  b: 2,
};

var bar = Object.create(foo);
bar.c = 3;
bar.say = function() {
  console.log('c is ' + this.c);
};

var baz = shallowCopy(bar);
console.log(baz.a);       // 1
baz.say();                // "c is 3"

// if specs allow copying only the own enum properties, then this would work:

function shallowCopy(object) {
  var copy = Object.create(Object.getPrototypeOf(object));
  Object.assign(copy, object);

  return copy
}
```

### Solution:
```javascript
function shallowCopy(object) {
  var copy = Object.create(Object.getPrototypeOf(object));

  Object.getOwnPropertyNames(object).forEach(function(name) {
    copy[name] = object[name];
  });

  return copy;
}

var foo = {
  a: 1,
  b: 2,
};

var bar = Object.create(foo);
bar.c = 3;
bar.say = function() {
  console.log('c is ' + this.c);
};

var baz = shallowCopy(bar);
console.log(baz.a);       // 1
baz.say();                // "c is 3"

console.log(baz.hasOwnProperty('c')); // true
console.log(bar.hasOwnProperty('c')); // true
console.log(bar === baz);             // false
console.log(Object.getPrototypeOf(bar) === Object.getPrototypeOf(baz)); // true
console.log(Object.getOwnPropertyNames(baz));
console.log(Object.keys(baz));
```

## Problem 3:

Write a function that extends an object (destination object) with contents from multiple objects (source objects);

```javascript
function extend(destination) {
  // ...
}

var foo = {
  a: 0,
  b: {
    x: 1,
    y: 2,
  },
};

var joe = {
  name: 'Joe'
};

var funcs = {
  sayHello: function() {
    console.log('Hello, ' + this.name);
  },
	  
  sayGoodBye: function() {
    console.log('Goodbye, ' + this.name);
  },
};

var object = extend({}, foo, joe, funcs);

console.log(object.b.x);          // 1
object.sayHello();                // "Hello, Joe"
```

### Solution:

```javascript
function extend(destination) {
  var sources = Array.prototype.slice.call(arguments, 1);

  sources.forEach(function (source) {
    Object.getOwnPropertyNames(source).forEach(function (name) {
      destination[name] = source[name];
    });
  });

  return destination;
}
```
