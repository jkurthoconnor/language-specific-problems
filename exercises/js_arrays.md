LS Exercises: [Arrays](https://launchschool.com/exercise_sets/75d23811)


## Problem 1: Array copy 1
Read through the code shown below. What does it log to the console at lines 5 and 8?
```javascript
var myArray = [1, 2, 3, 4];
var myOtherArray = myArray;

myArray.pop();
console.log(myOtherArray); // [1, 2, 3]

myArray = [1, 2];
console.log(myOtherArray); // [1, 2, 3]
```

### Solution
Both lines in question log `[1, 2, 3]`.

At line 2, `myOtherArray` is initialized to point to `myArray`, but since `myArray` is an object, the value being passed is reference to the object itself. Thus both variables reference the identical object / array.

Thus when the last element is popped off of the object to which both `myArray` and `myOtherArray` point, this affects the logging, regardless of the argument used in line 5 to reference the object (i.e. `myArray` or `myOtherArray`) `[1, 2, 3]` would be logged.

However, in line 7 `myArray` is reassigned to point to the array `[1, 2]`. As a result of the reassignment, the two variables no longer point to the same object; `myOtherArray` remains pointing to `[1, 2, 3]`. Thus in line 8 the logging does not reflect the new value of `myArray`, as this is entirely distinct from that of `myOtherArray`

## Problem 2: Array copy 2
In the previous exercise, the value of the reference gets copied. For this exercise, only the values of the array should be copied, but not the reference. Implement two alternative ways of doing this.

### Solution

```javascript
// one way would be to iterate through the original array and push the values to a new array. This works because the elements are all primitives, so it is merely a copy of the value that is ending up in the destination array.
var myArray = [1, 2, 3, 4];
var myOtherArray = [];
var i;

for (i = 0; i < myArray.length; i++) {
  myOtherArray.push(myArray[i]);
}

console.log(myArray);
console.log(myOtherArray);

myArray.pop();
console.log(myArray);
console.log(myOtherArray);

myOtherArray.push(6);
console.log(myArray);
console.log(myOtherArray);

// one could accomplish the same using the `slice()` method, which makes a shallow copy, and since the elements are all primitives, the values are copied
var myArray = [1, 2, 3, 4];
var myOtherArray = myArray.slice();

console.log(myArray);
console.log(myOtherArray);

myArray.pop();
console.log(myArray);
console.log(myOtherArray);

myOtherArray.push(6);
console.log(myArray);
console.log(myOtherArray);
```

## Problem 3
n this exercise, you will learn more about Arrays by implementing your own version of the Array.prototype.concat method. Write a function that returns a new array composed of all values from the first array argument and the second array or value argument. Take note of the following specifications when writing your concat function.

    The first argument will always be an array.
    The second argument can be either an array or another value.
    The function should return a new array.
    The elements in the new array should be in the same order as they appear in the arguments.
    The function should copy any object references from the arguments into the new array — i.e., if you make a change to a reference object from one of the arguments after calling concat, those changes should show up in the output array as well.
    The function should copy the values of primitives (e.g., strings, numbers, and booleans).

```javascript
function concat(array1, secondArgument) {
  // ...
}

concat([1, 2, 3], [4, 5, 6]);          // [1, 2, 3, 4, 5, 6]
concat([1, 2], 3);                     // [1, 2, 3]
concat([2, 3], ['two', 'three']);      // [2, 3, "two", "three"]
concat([2, 3], 'four');                // [2, 3, "four"]


var obj = { a: 2, b: 3 };
var newArray = concat([2, 3], obj);
newArray;                              // [2, 3, { a: 2, b: 3 }]
obj.a = 'two';
newArray;                              // [2, 3, { a: "two", b: 3 }]

var arr1 = [1, 2, 3];
var arr2 = [4, 5, obj];
var arr3 = concat(arr1, arr2);
arr3;                                  // [1, 2, 3, 4, 5, { a: "two", b: 3 }]
obj.b = 'three';
arr3;                                  // [1, 2, 3, 4, 5, { a: "two", b: "three" }]

arr3[5].b = 3;                         // or, `arr3[5]['b'] = 3;`
obj;                                   // { a: "two", b: 3 }
```

### Solution
```javascript
function concat(array1, secondArgument) {
  // ...
}

concat([1, 2, 3], [4, 5, 6]);          // [1, 2, 3, 4, 5, 6]
concat([1, 2], 3);                     // [1, 2, 3]
concat([2, 3], ['two', 'three']);      // [2, 3, "two", "three"]
concat([2, 3], 'four');                // [2, 3, "four"]


var obj = { a: 2, b: 3 };
var newArray = concat([2, 3], obj);
newArray;                              // [2, 3, { a: 2, b: 3 }]
obj.a = 'two';
newArray;                              // [2, 3, { a: "two", b: 3 }]

var arr1 = [1, 2, 3];
var arr2 = [4, 5, obj];
var arr3 = concat(arr1, arr2);
arr3;                                  // [1, 2, 3, 4, 5, { a: "two", b: 3 }]
obj.b = 'three';
arr3;                                  // [1, 2, 3, 4, 5, { a: "two", b: "three" }]

arr3[5].b = 3;                         // or, `arr3[5]['b'] = 3;`
obj;                                   // { a: "two", b: 3 }
```

## Problem 4
The `concat` function from the previous exercise could only concatenate a maximum of two arrays. For this exercise, you are going to extend that functionality. Refactor the `concat` function to allow for the concatenation of two or more arrays or values.

```javascript
concat([1, 2, 3], [4, 5, 6], [7, 8, 9]);    // [1, 2, 3, 4, 5, 6, 7, 8, 9]
concat([1, 2], 'a', ['one', 'two']);        // [1, 2, "a", "one", "two"]
concat([1, 2], ['three'], 4); 
```

### Solution
```javascript
function concat() {
  var concatenated = arguments[0].slice();
  var size = arguments.length;
  var i;

  for (i = 1; i < size; i++) {
    if (Array.isArray(arguments[i])) {
      var j;
      for (j = 0; j < arguments[i].length; j++) {
        concatenated.push(arguments[i][j]);
      }
    } else {
      concatenated.push(arguments[i]);
    }
  }
  return concatenated;
}

console.log(concat([1, 2, 3], [4, 5, 6], [7, 8, 9]));    // [1, 2, 3, 4, 5, 6, 7, 8, 9]
console.log(concat([1, 2], 'a', ['one', 'two']));        // [1, 2, "a", "one", "two"]
console.log(concat([1, 2], ['three'], 4)); 
```

## Problem 5
In this exercise, you will implement your own version of two Array methods: Array.prototype.pop and Array.prototype.push. The pop method removes the last element from an array and returns that element. If pop is called on an empty array, it returns undefined. The push method, on the other hand, adds one or more elements to the end of an array and returns the new length of the array.
```javascript
// pop
var array = [1, 2, 3];
pop(array);                        // 3
console.log(array);                // [1, 2]
pop([]);                           // undefined
pop([1, 2, ['a', 'b', 'c']]);      // ["a", "b", "c"]

// push
var array = [1, 2, 3];
push(array, 4, 5, 6);              // 6
console.log(array);                // [1, 2, 3, 4, 5, 6]
push([1, 2], ['a', 'b']);          // 3
push([], 1);                       // 1
push([]);                          // 0

```

### Solution
```javascript
function pop(arr) {
  var arrLength = arr.length;
  var popped = arr[arrLength - 1];

  if (arrLength > 0) {
    arr.length = arrLength - 1;
  }

  return popped;
}
    // pop
var array = [1, 2, 3];
console.log(pop(array));                        // 3
console.log(array);                // [1, 2]
console.log(pop([]));                           // undefined
console.log(pop([1, 2, ['a', 'b', 'c']]));      // ["a", "b", "c"]

function push(arr) {
  var i;

  for (i = 1; i < arguments.length; i++) {
    arr[arr.length] = arguments[i];
  }

  return arr.length;
}

var array = [1, 2, 3];
console.log(push(array, 4, 5, 6));              // 6
console.log(array);               // [1, 2, 3, 4, 5, 6]
console.log(push([1, 2], ['a', 'b']));          // 3
console.log(push([], 1));                       // 1
console.log(push([]));                          // 0
```

## Problem 6


```javascript
```

### Solution
## Problem 7
Implement your own version of the `Array.prototype.reverse` method. Your implementation should differ from the built-in method in the following two ways:
  - It should accept either string or an array as an argument.
  - It should return a new string or array.

```javascript
function reverse(inputForReversal) {
  // ...
}

reverse('Hello');           // "olleH"
reverse('a');               // "a"
reverse([1, 2, 3, 4]);      // [4, 3, 2, 1]
reverse([]);                // []

var array = [1, 2, 3];
reverse(array);             // [3, 2, 1]
array;                      // [1, 2, 3]
```

### Solution
```javascript
// initial solution
function reverse(input) {
  var i;
  var arrayInput = Array.isArray(input);
  var output = arrayInput ? [] : '';

  for (i = input.length - 1; i >= 0; i--) {
    if (arrayInput) {
      output[output.length] = input[i];
    } else {
      output += input[i];
    }
  }

  return output;
}

// refactored to allow building arrays only
function reverse(input) {
  var i;
  var arrayOutput = Array.isArray(input);
  var reversed = [];

  for (i = input.length - 1; i >= 0; i--) {
    reversed[reversed.length] = input[i];
  }

    return (arrayOutput ? reversed : reversed.join(''));
}
```
## Problem 8
In this exercise, you will implement your own versions of the Array.prototype.shift and Array.prototype.unshift methods. These methods manipulate the contents of an array starting from the first index.

The shift method removes the first element from an array and returns that element; if the array is empty, shift returns undefined. The unshift method adds one or more elements to the start of an array and returns the new length of the array. Both methods mutate the original array.
```javascript
shift([1, 2, 3]);                // 1
shift([]);                       // undefined
shift([[1, 2, 3], 4, 5]);        // [1, 2, 3]

unshift([1, 2, 3], 5, 6);        // 5
unshift([1, 2, 3]);              // 3
unshift([4, 5], [1, 2, 3]);      // 3

var testArray = [1, 2, 3];
shift(testArray);                // 1
testArray;                       // [2, 3]
unshift(testArray, 5);           // 3
testArray;                       // [5, 2, 3]
```

### Solution
```javascript
function shift(arr1) {
  var i;
  var firstElement = arr1[0];
  var origLength = arr1.length;

  for (i = 0; i < origLength - 1; i++) {
    arr1[i] = arr1[i + 1];
  }

  if (origLength > 0) {
    arr1.length = origLength - 1;
  }

  return firstElement;
}

function unshift(arr, addition) {
  var i;
  var add = [];
  var offSet = arguments.length - 1;

  for (i = 1; i < arguments.length; i++) {
    add.push(arguments[i]);
  }

  for (i = arr.length - 1; i >= 0; i--) {
    arr[i + offSet] = arr[i];
  }

  for (i = 0; i < offSet; i++) {
    arr[i] = add[i];
  }

  return arr.length;
}

// refactored for variable name clarity and to avoid need for separate additions array
function shift(arr) {
  var i;
  var firstElement = arr[0];
  var origLength = arr.length;

  for (i = 0; i < origLength - 1; i++) {
    arr[i] = arr[i + 1];
  }

  if (origLength > 0) {
    arr.length = origLength - 1;
  }

  return firstElement;
}


function unshift(arr) {
  var i;
  var additionsCount = arguments.length - 1;

  for (i = arr.length - 1; i >= 0; i--) {
    arr[i + additionsCount] = arr[i];
  }

  for (i = 0; i < additionsCount; i++) {
    arr[i] = arguments[i + 1];
  }

  return arr.length;
}

```
## Problem 9

```javascript
```

### Solution
## Problem 10

```javascript
```

### Solution


```javascript
```

