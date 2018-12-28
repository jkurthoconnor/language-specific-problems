# Practice Problems: [Working with the Math Object](https://launchschool.com/lessons/0539330a/assignments/f4c06667)


## Problem 1.
The `Math` methods that deal with angle measurements all expect and return values in radians instead of degrees.  ... Use the `Math.PI` property to create a function that converts radians to degrees.

### Solution

```javascript
function radToDegrees(radians) {
  return (radians * 180) / Math.PI;
}

function degToRadians(degrees) {
  return (degrees * Math.PI) / 180;
}
```

## Problem 2.
To convert a positive integer to a negative integer, you can just place a minus sign in front of the variable that contains the integer. However, if you don't know whether the original values is negative, you may inadvertently convert your variable to the wrong value.  You can use the `Math.abs` method to simplify matters by forcing a positive value. For this problem, create a variable with a value of `-180`, then use `Math.abs` to log the positive value of the variable.


### Solution

```javascript
var num = -180;
console.log(Math.abs(num));
```

## Problem 3.
Use the `Math.sqrt` method to find the wquare root of `16777216`.

### Solution

```javascript
var num = 16777216;
console.log(Math.sqrt(num));
```

## Problem 4.
`Math.pow` thkes two arguments,  the base and the exponent, and return the result.  Use `Math.pow` to compute and log the value of 16 to the 6th power.

### Solution
```javascript
var num = 16;
console.log(Math.pow(num, 6));
```

## Problem 5.
Three methods perform different types of rounding. `Math.round` takes any decimal value and rounds it to the nearest integer. If the fractional part is less than `0.5`, `Math.round` rounds the value down; otherwise it rounds the value up. `Math.floor` rounds any number down to the next lower integer.[i.e. greatest int less than or equal to the argument] `Math.ceil` rounds any number up to the next higher integer [i.e. smallest int greater than or equal to the argument]. Use the appropriate method on each of these variables to return a value of 50;

```javascript
var a = 50.72;
var b = 49.2;
var c = 49.86;
```

### Solution

```javascript
var a = 50.72;
var b = 49.2;
var c = 49.86;

console.log(Math.floor(a));
console.log(Math.ceil(b));

```
## Problem 6.
`Math.random` return a random floating-point number between `0` and `1`, excluding the exact value of `1`.This isn't helpful on its own, since you usually want a random integer between two other integer values. Create a function that takes two arguments, a minimum and a maximum value, and returns a random integer between those numbers (including both of the numbers). Your solution should handle the scenario that the user inadvertently swaps the positions of the min and max values or the scenario that the min and max values are equal. You may assume that the user always provides the min and max values.
### Solution
```javascript
function randomBtwn(min, max) {
  var trueMin = (max > min ? min : max);
  var diff = Math.abs(max - min);
  var factor = Math.random() * diff;

  return Math.round(factor + trueMin);
}
```

