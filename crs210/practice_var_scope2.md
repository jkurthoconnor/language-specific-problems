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

### Problem

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

### Problem

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


### Problem

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

  That said, 4 is never set as the value of `a`. Instead, `a` remains with the value of its final reassignment in `bar()`, i.e. 3. Thus 3 is the final line of output.

### Problem



#### Solution


Output:


Explanation:

### Problem



#### Solution


Output:


Explanation:

### Problem



### Solution


Output:


Explanation:

### Problem



#### Solution


Output:


Explanation:

### Problem



#### Solution


Output:


Explanation:
