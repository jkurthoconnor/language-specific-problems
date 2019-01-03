# Practice: [Dealing with Context Loss](https://launchschool.com/lessons/c9200ad2/assignments/92892280)

## Problem 1:

Our desired output for the code below is: Christopher Turk is a Surgeon. What will the code output, and what explains the difference, if any, between the actual and desired outputs?

```javascript
var turk = {
  firstName: 'Christopher',
  lastName: 'Turk',
  occupation: 'Surgeon',
  getDescription: function() {
    return this.firstName + ' ' + this.lastName + ' is a ' + this.occupation + '.';
  }
};

function logReturnVal(func) {
                          // turk.getDescription is taken out of context;
  var returnVal = func();//the anon function which `turk.getDescription`
                         //evaluates to is called; thus it is a function
                         //invocation and by default the execution 
                         //context is the global object; as there are no
                         //lastName etc vars on this object, 
  console.log(returnVal);// this logs 2 undefineds, ' is a ' undefined
}

logReturnVal(turk.getDescription);
```

## Problem 2:
Alter logReturnVal such that it takes an additional context argument, and use one of the methods we've learned in this lesson to invoke func inside of logReturnVal with context as its function execution context. Alter the invocation of logReturnVal and supply turk as the context argument.

```javascript
var turk = {
  firstName: 'Christopher',
  lastName: 'Turk',
  occupation: 'Surgeon',
  getDescription: function() {
    return this.firstName + ' ' + this.lastName + ' is a ' + this.occupation + '.';
  }
};

// deal with lost context strategy: pass context as an argument
function logReturnVal(func, context) {
  var returnVal = func.call(context);
  console.log(returnVal);
}

logReturnVal(turk.getDescription, turk);

```

## Problem 3:
Suppose that we want to extract getDescription from turk, but always have it execute with turk as context. Use one of the methods we've learned in the last lesson to assign such a permanently bound function to a new variable, getTurkDescription.

```javascript
var turk = {
  firstName: 'Christopher',
  lastName: 'Turk',
  occupation: 'Surgeon',
  getDescription: function() {
    return this.firstName + ' ' + this.lastName + ' is a ' + this.occupation + '.';
  }
};

// context loss strategy: bind context to function
var getTurkDescription = turk.getDescription.bind(turk);

console.log(getTurkDescription());

```

## Problem 4:
Consider the code below, and our desired output. Will this code log our desired output? Explain.

```javascript
var TESgames = {
  titles: ['Arena', 'Daggerfall', 'Morrowind', 'Oblivion', 'Skyrim'],
  seriesTitle: 'The Elder Scrolls',
  listGames: function() {
    this.titles.forEach(function(title) {
      console.log(this.seriesTitle + ' ' + title);
    });
  }
};

TESgames.listGames();

```

Desired output:

The Elder Scrolls Arena
The Elder Scrolls Daggerfall
The Elder Scrolls Morrowind
The Elder Scrolls Oblivion
The Elder Scrolls Skyrim


In original version, the call would return a series of `undefined <title Value>` . The `undefined` results from the fact that `this.seriesTitle` evaluates to `window.seriesTitle` because the callback function, as an inner function, loses its context. 

The proper titles do appear however, because they are being passed to the callback from `this.titles`, which evaluates to TESgames.titles because the listGames function is being invoked via method invocation

## Problem 5:

Use the var self = this fix (introduced in Dealing with Context Loss (2)) to alter TESgames.listGames such that it logs our desired output to the console.

```javascript
var TESgames = {
  titles: ['Arena', 'Daggerfall', 'Morrowind', 'Oblivion', 'Skyrim'],
  seriesTitle: 'The Elder Scrolls',
  listGames: function() {
    var self = this;
    this.titles.forEach(function(title) {
      console.log(self.seriesTitle + ' ' + title);
    });
  }
};

TESgames.listGames();
```

## Problem 6:

If we don't want to rely on var self = this, forEach provides us with an alternative means of supplying execution context to the inner function. Use this means to achieve our desired output.

```javascript
var TESgames = {
  titles: ['Arena', 'Daggerfall', 'Morrowind', 'Oblivion', 'Skyrim'],
  seriesTitle: 'The Elder Scrolls',
  listGames: function() {
    this.titles.forEach(function(title) {
      console.log(this.seriesTitle + ' ' + title);
   }, this);       // the optional `thisArg` param allows setting context
  }               // for the inner function
};

TESgames.listGames();
```

## Problem 7:

Consider the code below. What will the value of `foo.a` be after the code executes?

```javascript

var foo = {
  a: 0,
  incrementA: function() {
    function increment() {
      this.a += 1;         // `this` appears in an inner function, so it looses
    }                     // the outer object as context

    increment();         // as a function invocation without explicit context
  }                      // `increment()` context is `window` (global object)
};

foo.incrementA();// instead of incrementing `foo.a`, increments 
foo.incrementA();// global `a`, but there is none, so `undefined`
foo.incrementA();// is passed into the incrementer, returning `NaN`

console.log(foo.a);// 0  the original value b/c `foo.a` was never incremented
console.log(a); // NaN
```

## Problem 8:

Use one of the methods we learned in this lesson to invoke increment with explicit context such that foo.a is incremented with each invocation of incrementA.

```javascript
var foo = {
  a: 0,
  incrementA: function() {
    function increment() {
      this.a += 1;         // `this` appears in an inner function, so it looses
    }                     // outer object as context, ... but

    increment.call(this);  // `call` allows explicit identification of the 
  }                      // execution context to be `this`, and inside of the
                        // method but outside of the inner function, `this`
                        // evaluates to the containing object (assuming
                        // the method is called via method invocation)
};

foo.incrementA();
foo.incrementA();
foo.incrementA();

console.log(foo.a);// 3
```

## Problem 9:

We decide that we want each invocation of foo.incrementA to increment foo.a by 3, rather than 1, and alter our code accordingly:
```javascript
var foo = {
  a: 0,
  incrementA: function() {
    function increment() {
      this.a += 1;
    }

    increment.apply(this);
    increment.apply(this);
    increment.apply(this);
  }
};
```
Calling apply three times seems repetitive, though. Use bind to permanently set foo as increment's execution context.

### Solution:
```javascript
var foo = {
  a: 0,
  incrementA: function() {
    var increment = function () {
      this.a += 1;
    }.bind(this);

    increment();
    increment();
    increment();
  }
};

foo.incrementA();
foo.incrementA();
foo.incrementA();

console.log(foo.a);// 9
```
