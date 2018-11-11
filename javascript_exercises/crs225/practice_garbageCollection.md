# LS Practice: [Garbage Collection](https://launchschool.com/lessons/0b371359/assignments/d5156138)

## Problem 2:
Are either of the values `1` of `"A string"` eligible for garbage collection at the marked locations?

### Solution:

```javascript
var myNum = 1;

function foo() {
  var myStr = 'A string';
  // what is eligible for GC here?
  //      A: neither value is eligible here. `myNum` is still a reference to `1`
  //        and because `foo` hasn't returned `myStr` still references 'A string'
}

foo();

// what is eligible for GC here?
//
//      A: because `foo` has returned `myStr` no longer references anything,
//        and without access to 'A string', that value is eligible for GC.
//        However, the program is not complete, so `1` which is referenced by a 
//        global var is still accessible, so it is _not_ eligible for GC
//
// more code```

```

## Problem 3:

Is the value referenced by `outerFoo` eligible for garbage collection at the marked point?

### Solution:

```javascript
var outerFoo;

function bar() {
  var innerFoo = 0;
  outerFoo = innerFoo;
}

bar();

// can outerFoo's 0 be garbage collected here?

    // A: No, the 0 held by `outerFoo` is still in use b/c `outerFoo`
    //    is a globally-scoped var and its reference persists after assignment.
    //    `0` is still accessible, and as such is _not_ eligible for GC.

// more code
```

## Problem 4:

Is `0` eligible for GC at the marked point?

### Solution:

```javascript
function makeEvenCounter() {
  var index = 0;
  return function() {
    return index += 2;
  };
}

var evenCounter = makeEvenCounter();

// is 0 eligible for GC here?
//
//    A: No, it is not eligible. Although `makeEvenCounter` has returned, its
//        return value is another function which is now referenced by `evenCounter`.
//        `evenCounter` closes over `makeEvenCounter`'s scope, so it has access
//        to the current value of `index`, which until `evenCounter` is itself
//        invoked, is `0`.
//
//        So, while `index` (and its value of 0) is not accessible from the noted
//        point in the code, it _is accessible_ from `evenCounter`. Because there
//        is current access to `0`, it cannot be freed up for GC.
//
// more code
```

## Problem 5:

This is a script.  Will 'Some val' ever be eligible for GC?

```javascript
var bash = "Some val";
```

### Solution:

Yes, once the script completes.
