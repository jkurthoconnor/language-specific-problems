# LS Practice: [Garbage Collection](https://launchschool.com/lessons/0b371359/assignments/d5156138)

## Problem 2:
Are either of the values `1` of `"A strring"` eligible for garbage collection at the marked locations?

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
//      A: because `foo` has returned `myStr` no longer references anything, so 'A string' is eligible for GC
//      However, the program is not complete, so `1` which is referenced by a global var is
//      still in use
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
    //    is a globally-scoped var and its reference persists after assignment

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

    // A: No. Although `makeEvenCounter()` has returned, and the `0` is the value
    //  of `index` which is scoped to `makeEvenCounter`, the function it returned
    // is now stored in `evenCounter`, and that function closes over the scope in
    // which `index` is assigned `0`. Thus `index` still is in use, and it still
    // holds `0`

// more code
```

## Problem 5:

This is a script.  Will 'Some val' ever be eligible for GC?

```javascript
var bash = "Some val";
```

### Solution:

Yes, once the script completes.
