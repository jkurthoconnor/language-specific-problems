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

```javascript
```

### Solution
## Problem 6


```javascript
```

### Solution
## Problem 7


```javascript
```

### Solution
## Problem 8

```javascript
```

### Solution
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

