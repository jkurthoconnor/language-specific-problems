
LS Exercises: [JS Fundamentals: Medium 1](https://launchschool.com/exercise_sets/41f68c21)


## Problem 1:
What will each line of the following code return? Don't run the code until after you have tried to answer.

```javascript
(false && undefined);
(false || undefined);
((false && undefined) || (false || undefined));
((false || undefined) || (false && undefined));
((false && undefined) && (false || undefined));
((false || undefined) && (false && undefined));
('a' || (false && undefined) || '');
((false && undefined) || 'a' || '');
('a' && (false || undefined) && '');
((false || undefined) && 'a' && '');
```

### Solution

```javascript
console.log((false && undefined));   // false
console.log((false || undefined));   // undefined
console.log(((false && undefined) || (false || undefined))); // undefined
console.log(((false || undefined) || (false && undefined)));   // false
console.log(((false && undefined) && (false || undefined)));   // false
console.log(((false || undefined) && (false && undefined)));   // undefined
console.log(('a' || (false && undefined) || ''));    // "a"
console.log(((false && undefined) || 'a' || ''));    // "a"
console.log(('a' && (false || undefined) && ''));    // undefined
console.log(((false || undefined) && 'a' && ''));    // undefined
```


## Problem 2:


The following program is expected to log each number between 0 and 9 (inclusive) that is a multiple of 3. Read through the code shown below. Will it produce the expected result? Why or why not?

```javascript
var i = 0;
while (i < 10) {
  if (i % 3 === 0) {
    console.log(i);
  } else {
    i += 1;
  }
}
```

### Solution
No, the code will produce an infinite loop of logging `0`. See comments below:

```javascript
var i = 0;
while (i < 10) {
  if (i % 3 === 0) {  // when i = 0, the conditional expression evaluates to true
    console.log(i);   // thus logging 0
  } else {
    i += 1;           // this incrementing statement will never be executed
  }                   // and the conditional expressin will continue to evaluate
}                     // to true; 
                      // side effect: infinite logging of 0
```


## Problem 3:


The following program is expected to log a multiplication table for the numbers from 1 to 10 to the console. Read through the code shown below. Will it produce the expected result? Why or why not?

```javascript
var row;
var i;
var j;

function padLeft(number) {
  var stringNumber = String(number);
  return stringNumber.length <= 1 ? ' ' + stringNumber : stringNumber;
}

for (i = 1; i < 10; i += 1) {
  row = '';
  for (j = 1; j <= 10; j += 1) {
    row += padLeft(i * j) + ' ';
  }

  console.log(row + '\n');
}

```

### Solution
No. The program will log a multiplication table for 1 through 9. The following `for` loop expressions (particularly the condition expression) will ensure the loop quits after logging the 9s line.
```javascript
for (i = 1; i < 10; i +=1)
```


## Problem 4:
The getSelectedColumns function selects and extracts specific columns to a new array. Currently, the function is not producing the expected result. Go over the function and the sample runs shown below. What do you think the problem is?

```javascript
function getSelectedColumns(numbers, cols) {
  var result = [];

  for (var i = 0, length = numbers.length; i < length; i += 1) {
    for (var j = 0, length = cols.length; j < length; j += 1) {
      if (!result[j]) {
        result[j] = [];
      }

      result[j][i] = numbers[i][cols[j]];
    }
  }

  return result;
}

// given the following arrays of number arrays
var array1 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
var array2 = [[1, 2, 3], [1, 2, 3], [1, 2, 3]];

// `array1` in row/column format
// [[1, 2, 3],
//  [4, 5, 6],
//  [7, 8, 9]]

getSelectedColumns(array1, [0]);     // [[1]];            expected: [[1, 4, 7]]
getSelectedColumns(array1, [0, 2]);  // [[1, 4], [3, 6]]; expected: [[1, 4, 7], [3, 6, 9]]
getSelectedColumns(array2, [1, 2]);  // [[2, 2], [3, 4]]; expected: [[2,
```

### Solution
The error in the given code is due to not distinguishing between the variable names that point to/hold the different values `numbers.length` and `cols.length`. Both values are expected to be held by a variable named `length`. As the inner loop is initialized, the value of `cols.length` is assigned to `length`, but this is simply a reassignment of the existing `length` variable, which had been initialized in the outer loop to hold the value of `numbers.length`. For the code to work as expected, these two values must be maintained in separate variables. The following coe is an example of how to accomplish this with different initialization expressions for the outer and the inner loops.

```javascript
for (var i = 0, lengthNum = numbers.length; i < lengthNum; i += 1) {
  for (var j = 0, lengthCol = cols.length; j < lengthCol; j += 1) {
```


## Problem 5:
what will the following code snippets log?

### Solution

```javascript
// Code Snippet 1 logs "The total value is 15"

var counter = 5;
var rate = 3;
console.log('The total value is ' + String(counter * rate));

function counter(count) {
  // ...
}
/* hoisted, snippet 1 would be:
function counter(count) {
}
var counter;
var rate;

counter = 5; // `counter` now points to `5`, and not the function
rate = 3;
console.log(....);
*/

// Code Snippet 2 will log "The total value is NaN" because the declarations are hoisted, but for the vars the assignments are not, so `rate` will return `undefined`, an `undefined` times any value returns `NaN`. Furthermore, `counter` is notbeing invoked as a method, so there wouldn't be any numeric return value to multiply at all; so two paths to the same result: logging "The total value is NaN"

function counter(count) {
  // ...
}

console.log('The total value is ' + String(counter * rate));

var counter = 5;
var rate = 3;

// Code Snippet 3 logs "The total value is 15" for the same reasons as in snippet 1. After hoisting, the function declaration (with body) is at the top, followed by the other variable declarations. Then the variable assignments occur, overwriting`counter` and reassigning it to now hold `5`

var counter = 5;
var rate = 3;

function counter(count) {
  // ...
}

console.log('The total value is ' + String(counter * rate));
```

## Problem 6:
Why will the following code log `debugging`?

```javascript
function debugIt() {
  var status = 'debugging';
  function logger() {
    console.log(status);
  }

  logger();
}

debugIt();
```

### Solution

The final line invokes the `debugIt()` function. `debugIt()`, in turn contains a function declaration for `logger()`, and logger logs the value of the `status` variable. `status` is declared and assigned inside the scope of `debugIt()`, and it holds `'debugging'`, so an invocation of `logger()`, which is itself enclosed within `debugIt()` and thus has access to the `status` variable, will log `'debugging'`. The last line of `debugIt()` is an invocation of `logger()`, so when `debugIt()` is called, `'debugging'` is logged.

## Problem 7:
The invoiceTotal function in the code below computes the total amount for an invoice containing four "line items". How can you refactor the function so that it will work with invoices containing any number of line items?

```javascript
function invoiceTotal(amount1, amount2, amount3, amount4) {
  return amount1 + amount2 + amount3 + amount4;
}

invoiceTotal(20, 30, 40, 50);          // works as expected
invoiceTotal(20, 30, 40, 50, 40, 40);  // does not work; how can you ma
```

### Solution
Replacing an itemized list of arguments with access to the `arguments` object will do the trick

```javascript
function invoiceTotal() {
  var sum = 0;
  var i;

  for (i = 0; i < arguments.length; i++) {
    sum += arguments[i];
  }

  return sum;
}
```


## Problem 8:

The productOfSums function shown below is expected to return the product of the sums of two arrays of numbers. Read through the following code. Will it produce the expected result? Why or why not?

```javascript
function productOfSums(array1, array2) {
  var result;
  result = total(array1) * total(array2);
  return result;
}

function total(numbers) {
  var sum;
  var i;

  for (i = 0; i < numbers.length; i += 1) {
    sum += numbers[i];
  }

  sum;
}


```

### Solution
The program will not produce the expected result. It will return `NaN`. See comments for explanation.
```javascript
function productOfSums(array1, array2) {
  var result;
  result = total(array1) * total(array2); // assuming the `total()` function
  return result;                          // works, the `productOfSums()` should
}                                         // work as well; but `total()` will
                                          // return `undefined`, so `result`
                                          // will be `NaN`

function total(numbers) {
  var sum;          // `sum` is not assigned a value, so it is undefined
  var i;

  for (i = 0; i < numbers.length; i += 1) {
    sum += numbers[i];  // attempting to add a value to `sum` will return `NaN`
  }                     // because `sum` is undefined

  sum;                  // no return statement; function will return `undefined`
}

```


## Problem 9:

```javascript
```

### Solution

```javascript

```


## Problem 10:

```javascript
```

### Solution

```javascript

```
