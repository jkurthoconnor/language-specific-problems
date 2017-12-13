# LS 210 Practice Problems: [Variable Scopes in JavaScript2](https://launchschool.com/lessons/511a561c/assignments/9dcef864)


Please predict the output of the following programs, and explain why they output what they do.

### Problem 1

```javascript
function say() {
  if (false) {
    var a = 'hello from inside a block';
  }

  console.log(a);
}

say();
```

#### Solution

Output:
  undefined

Explanation:
  The declaration `var a;` is hoisted to the top of the function `say`, but `a` is not explicitly assigned a value until the block, which is never run. As a result, the value of `a` remains at its default initialization value of `undefined`

### Problem 2

```javascript
function hello() {
  a = 'hello';
  console.log(a);

  if (false) {
    var a = 'hello again';
  }
}

hello();
console.log(a);
```

#### Solution

Output:
  hello
  Uncaught ReferenceError: a is not defined

Explanation:
  The declaration `var a;` is hoisted from the conditional block to the top of the function `hello`. Thus, when `hello` is run `a` is initialized as a function-level variable. In line 2, `a` is assigned to point to `hello`. This is the value that is logged when `hello()` is called, as appears on the first line of the output. 

  The ReferenceError occurs because `a` is only initialized in the `hello()` function scope, and the final `console.log(a)` appears in global scope.

### Problem 3

```javascript
var a = 'hello';

for (var i = 0; i < 5; i += 1) {
  var a = i;
}

console.log(a);
```

#### Solution

Output:
  4

Explanation:
  Since JS scoping is function-level, not block-level, in each of its appearances, `a` is the same variable, i.e. the `a` within the `for` loop does not shadow the global `a`, it _is_ the global `a`. Thus, the `console.log(a)` run at the end of the program will reflect the value of `a` having been set to the value of `i` as it was at the top of the block the last time it was run.


### Problem 4

```javascript
var a = 1;

function foo() {
  a = 2;
  function bar() {
    a = 3;
    return 4;
  }

  return bar();
}

console.log(foo());
console.log(a);
```

#### Solution

Output:
  4
  3

Explanation:
  The return value of `bar()` becomes the return value of `foo()`, so 4 is the value logged by `console.log(foo());`.

  That said, 4 is never set as the value of `a`. Instead, `a` remains with the value of its final reassignment in `bar()`, i.e. 3. Thus 3 is the final line of output

### Problem 5

```javascript
var a = 'global';

function checkScope() {
  var a = 'local';
  function nested() {
    var a = 'nested';
    function superNested() {
      a = 'superNested';
      return a;
    }

    return superNested();
  }

  return nested();
}

console.log(checkScope());
console.log(a);
```

#### Solution

Output:
  superNested
  global

Explanation:
  `console.log(checkScope())` outputs `superNested` because that is the return value of `nested`, and the return value of `checkScope` is the return value of `nested`.

  `console.log(a)` logs the value of the global `a`, which is `global`.  Global `a` value is never altered by the function calls because the `a` variables in function scope end up shadowing the global `a`.

### Problem 6

```javascript
var a = 'outer';
var b = 'outer';

console.log(a);
console.log(b);
setScope(a);
console.log(a);
console.log(b);

function setScope(foo) {
  foo = 'inner';
  b = 'inner';
}
```

#### Solution

Output:
 outer
 outer
 outer
 inner

Explanation:
  The first logging of `a` outputs `outer` and the first logging of `b` also outupts `outer`.  In bothe cases that is because these are the values given in their original assignments, and there has yet to be any attempt at reassignment.

  The second loggings of `a` and of `b` occur after the invocation of `setScope`, so their values will reflect how (if at all) this funciton affects the variable values.  `a`, it turns out, is unaffected by `setScope`, because `a` is passed in as an argument, it is immediately taken up as the function-scoped `foo`.  So, while `foo` is set to `inner`, this value is never attached to the global `a`. The two are completely separate variables. Thus `outer` is logged.
  The value of `b`, though, is reset in `setScope` because the `b` within the function is the global `b`. Thus the final value logged to the screen is `inner`

### Problem 7

```javascript
var total = 50;
var increment = 15;

function incrementBy(increment) {
  total += increment;
}

console.log(total);
incrementBy(10);
console.log(total);
console.log(increment);
```

### Solution

Output:
  50
  60
  15

Explanation:
  The first logging of `total` outputs `50` because that is the value associated with the global variable originally.

  The second logging of `total` is `60` because `incrementBy` does have available to it this global `total`, so `total` is reset to the newly incremented value `60`.
  The logging of `increment` is `15` because `incrementBy` never reassigns the global `increment`.  Instead, its `increment` is a function-scoped variable, so the fact that it is set to `10` has no relevance to the value of the global `increment` being logged in the last line.:

### Problem 8

```javascript
var a = 'outer';

console.log(a);
setScope();
console.log(a);

var setScope = function () {
  a = 'inner';
};
```

#### Solution

Output:
  outer
  TypeError: setScope not a function

Explanation:
  Because `setScope` is declared in a Function Expression that includes its variable declareation, only the variable declaration is hoisted.  In this case, that entails that the value of the variable is never explicitly assigned to point to the actual function until after all the logging and the attempt to call `setScope`.

  Thus, the value for `a` remains at its original assigned value of `outer` throughout the program, and the attempt to call `setScope` before the var is given the value results in a TypeError.
