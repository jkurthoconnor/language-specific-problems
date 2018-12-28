# LS 210 Practice Problems: [Variable Scopes in JavaScript1](https://launchschool.com/lessons/511a561c/assignments/ce95611e)


Please predict the output of the following programs, and explain why they output what they do.

### Problem 1

```javascript
var a = 'outer';

function testScope() {
  var a = 'inner';
  console.log(a);
}

console.log(a);
testScope();
console.log(a);
```

#### Solution:

The first and the final invocations of `console.log(a)` will output `outer`, because in each case `a` is the outer, global `a`.  Invoking `testScope()` will log `inner`, but the `a` in the `testScope` shadows the outer `a`, so setting it to `inner` has no effect on the value of `a` in global scope.

Thus, the program should output:
outer
inner
outer


### Problem 2.

```javascript
var a = 'outer';

function testScope() {
  a = 'inner';
  console.log(a);
}

console.log(a);
testScope();
console.log(a);
```

#### Solution:

Output:
  outer
  inner
  inner

Explanation:
The first invocation of `console.log(a)` outputs the original assignment of `a` in global scope.

  With the invocation of `testScope` the global `a` is reassigned to `inner`, and it remains as such for the final invocation of `console.log(a)`


### Problem 3

```javascript
var basket = 'empty';

function goShopping() {
  function shop1() {
    basket = 'tv';
  }

  console.log(basket);

  function shop2() {
    basket = 'computer';
  }

  function shop3() {
    var basket = 'play station';
    console.log(basket);
  }

  shop1();
  shop2();
  shop3();

  console.log(basket);
}

goShopping();
```

#### Solution:

Output:
  empty
  play station
  computer

Explanation:
The `empty` is logged from line 8, where `basket` resolves to the global scope `basket`, which retains its original assignment value of `empty`.

`play station` is the output of line 21, where `shop3` is invoked. In this function, `basket` is a newly declared function-scoped variable with an assigned value of `play station`.  Because `basket` here is not the global `basket`, this assignment never alters the global `basket`

`computer` is output by line 23 because the invocation of `shop2()` on line 20 reassigns the global `basket` to `computer`


### Problem 4

```javascript
function hello() {
  a = 'hello';
}

hello();
console.log(a);
```

#### Solution:

Output
  hello

Explanation
  The code outputs `hello` because when it goes to assign `hello` to `a` (line 2) JS is unable to find any declaration for `a`, so it initializes `a` in global scope. Thus when the hello function sets `a` to `hello`, this is setting the value of a global variable, even though `a` first appears inside a function and would normally have function scope.

  When `console.log(a)` has `a` passed in, the `a` is a globally-scoped variable, so its value (`hello`) is available and logged.


### Problem 5

```javascript
function hello() {
  var a = 'hello';
}

hello();
console.log(a);
```

#### Solution

Output:
  ReferenceError

Explanation
  Although invoking `hello()` on line 5 does initialize `a` to `hello`, it does so as a function-scoped variable. Thus, when `console.log()` is called in global scope with `a` as its argument, `a` is unavailable


### Problem 6

```javascript


console.log(a);

var a = 1;
```

#### Solution

Output
  undefined 

Explanation
  Because hoisting only hoists the variable declaration, not its assignment, `console.log(a)` only has access to `a` with the default initialization value of `undefined`. The assignment `a = 1` occurs after the logging.


### Problem 7

```javascript
console.log(a);

function hello() {
  a = 1;
}
```

#### Solution

Output
  ReferenceError: a is not defined

Explanation
  `hello()` is never called in this program, but `a` is only assigned in `hello` so when the attempt is made to log `a`, there is no such variable to reference
