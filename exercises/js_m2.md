LS Exercises: [JS Fundamentals: Medium 2](https://launchschool.com/exercise_sets/646ece8b)


## Problem 1:

The processOrder function shown below accepts the following arguments: price, quantity, discount, serviceCharge and tax. Any arguments other than price may be omitted when calling the function, in which case, default values will be assigned.

```javascript
function processOrder(price, quantity, discount, serviceCharge, tax) {
  if (!quantity) {
    quantity = 1;
  }

  if (!discount) {
    discount = 0;
  }

  if (!serviceCharge) {
    serviceCharge = 0.1;
  }

  if (!tax) {
    tax = 0.15;
  }

  return (price * quantity) * (1 - discount) * (1 + serviceCharge) * (1 + tax);
}

processOrder(100);      // 126.5
```

This function uses conditional statements to test whether arguments have been omitted. When an argument is omitted, JavaScript automatically initializes it to a value of undefined. The function takes advantage of this behavior by setting undefined arguments to a default value.

The following variation of the processOrder function has the same behavior as the first:

```javascript
function processOrder(price, quantity, discount, serviceCharge, tax) {
  quantity = quantity || 1;
  discount = discount || 0;
  serviceCharge = serviceCharge || 0.1;
  tax = tax || 0.15;

  return (price * quantity) * (1 - discount) * (1 + serviceCharge) * (1 + tax);
}
```

However, both of these solutions have a limitation that can lead to an incorrect result for certain inputs. What is this limitation and how does it affect the result?


### Solution

If one were to enter `0` for one of the arguments beyond `price` then the `0` would evaluate to `false` in the conditional or assignments expressions. That's not a problem in `discount`, as `0` is the default anyway. But for `serviceCharge` and `tax` that evaluation would ultimately result in the intended value `0` being overridden by the default value. As a result, the calculation would apply the default values instead of the intended / entered values, and the order's price would be incorrect

## Problem 2:

Read through the following code. Currently it does not log the expected result.
Explain why this happens, then refactor the code so that it works as expected.

```javascript
var person = { name: 'Victor' };
var otherPerson = { name: 'Victor' };

console.log(person === otherPerson);    // false -- expected: true
```

### Solution

The problem is that `person` and `otherPerson` are separate objects (despite having equivalent content), so neither of the comparison operators (`==` or `===`) will return `true` when comparing literally different objects.

Under the assumption these objects do not need to literally be different objects, and that it is sufficient for two variables to point to the same object, the simplest solution would be to initialize `otherPerson` to refer to the same object as does `person`.

```javascript
var otherPerson = person;
```
But if that was not the point of the original code, then one could write a function to compare the contents of two objects.

## Problem 3:

What does the following code log? Why is this so?

```javascript
var startingBalance = 1;
var chicken = 5;
var chickenQuantity = 7;

var totalPayable = function (item, quantity) {
  return startingBalance + (item * quantity);
};

startingBalance = 5;
console.log(totalPayable(chicken, chickenQuantity));

startingBalance = 10;
console.log(totalPayable(chicken, chickenQuantity));
```

### Solution

The first logging of `totalPayable()` is `40`. The second logging of `totalPayable()` is `45`. The key to understanding these results is in the fact that the function depends upon the value of `startingBalance` to produce its return value. `startingBalance` is in outer scope, so the subsequent assignments of `startingBalance` update the value that is to be applied in invoking `totalPayable`.


## Problem 4:

The doubler function in the code below takes two arguments: a number to double and return, and a string containing the name of the function's caller.

```javascript
function doubler(number, caller) {
  console.log('This function was called by ' + caller + '.');
  return number + number;
}

doubler(5, 'Victor');                   // returns 10
// logs:
// This function was called by Victor.
```

Write a makeDoubler function that takes a caller name as an argument, and returns a function that has the same behavior as doubler, but with a preset caller.

Example:

```javascript
var doubler = makeDoubler('Victor');
doubler(5);                             // returns 10
// logs:
// This function was called by Victor.
```

### Solution

```javascript
function makeDoubler(callerName) {
  return function (number) {
    console.log('This function was called by ' + callerName + '.');
    return number * 2;
  }
}
```


## Problem 5:

What will the following probram log to the console? Can you explain why?

```javascript
var array = ['Apples', 'Peaches', 'Grapes'];

array[3.4] = 'Oranges';
console.log(array.length);
console.log(Object.keys(array).length);

array[-2] = 'Watermelon';
console.log(array.length);
console.log(Object.keys(array).length);
```

### Solution

The first logging of `array.length` is `3`; the second is also `3`. The first logging of `Object.keys(array).length` is `4`; the second is `5`. 

Why? The array length does not change because the `.length` property of an array is one greater than the highest value index. Throughout, the highest value index is `2`. While there are two additions to the array, they are not additions to its elements; rather, they are additions to the object itself. This is because neither key/name, `3.4` or `-2` are valid indices, as an index must be a non-negative integer. Thus `3.4` becomes the key for `'Oranges'` and `-2` becomes the key for `'Watermelon'`. Both new properties are included in the corresponding loggings of the keys, but as their names/keys are not indices, they are not included in the loggings of the array's length.


## Problem 6:

Read through the code below. What values will be logged to the console? Can you explain these results?

```javascript
var languages = ['JavaScript', 'Ruby', 'Python'];
console.log(languages);
console.log(languages.length);

languages.length = 4;
console.log(languages);
console.log(languages.length);

languages.length = 1;
console.log(languages);
console.log(languages.length);

languages.length = 3;
console.log(languages);
console.log(languages.length);

languages.length = 1;
languages[2] = 'Python';
console.log(languages);
console.log(languages[1]);
console.log(languages.length);
```

### Solution

```javascript
var languages = ['JavaScript', 'Ruby', 'Python'];
console.log(languages); // ['JavaScript', 'Ruby', 'Python']
console.log(languages.length); // 3

languages.length = 4;
console.log(languages); /// ['JavaScript', 'Ruby', 'Python', empty]
// length is extended without assigning any key or value, spot is empty;
// the spot holds no value, and the corresponding index does not appear in
// `Object.keys(array)`;
console.log(languages.length); // 4

languages.length = 1;
console.log(languages); // ['JavaScript']
// by shortening the length, the array is cut to only a single element
console.log(languages.length); // 1

languages.length = 3;
console.log(languages); // ['JavaScript', empty, empty]
// as above, length is extended without adding any values
console.log(languages.length); // 3

languages.length = 1;
languages[2] = 'Python'; // 'Python' is assigned to index `2`, which is created
// to hold the value
console.log(languages); // ['JavaScript', empty, 'Python']
console.log(languages[1]); // undefined -- the standard return for access to
// non-existent indices (or empty spots)
console.log(languages.length); // 3

```


## Problem 7:

```javascript
function one() {
  function log(result) {
    console.log(result);
  }

  function anotherOne() {
    var result = '';
    var i;
    for (i = 0; i < arguments.length; i += 1) {
      result += String.fromCharCode(arguments[i]);
    }

    log(result);
  }

  function anotherAnotherOne() {
    console.log(String.fromCharCode(87, 101, 108, 99, 111, 109, 101));
    anotherOne(116, 111);
  }

  anotherAnotherOne();
  anotherOne(116, 104, 101);
  return anotherOne;
}

one()(77, 97, 116, 114, 105, 120, 33);
```

### Solution

```javascript
function one() {
  function log(result) {
    console.log(result);
  }

  function anotherOne() {
    var result = '';
    var i;
    for (i = 0; i < arguments.length; i += 1) {
      result += String.fromCharCode(arguments[i]);
    }

    log(result);
  }

  function anotherAnotherOne() {
    console.log(String.fromCharCode(87, 101, 108, 99, 111, 109, 101));
    // Welcome
    anotherOne(116, 111);
    // to
  }

  anotherAnotherOne(); // Welcome
                       // to
  anotherOne(116, 104, 101); // the
  return anotherOne; // Matrix!  (arguments in second set of `one`)
}

one()(77, 97, 116, 114, 105, 120, 33);
```
