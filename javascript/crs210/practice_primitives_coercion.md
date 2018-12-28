# Practice Problems: [Primitive Types and Type Coercion](https://launchschool.com/lessons/18c27076/assignments/ece2ce42 )

1. Using type coercion, correct the calculation to produce the numeric result instead.

```javascript
var x = '13';
var y = 9;

console.log(x + y);
```

Solution:

```javascript
var x = '13';
var y = 9;

console.log(Number(x) + y);
```


2. Using the same block of JS, change the addition operator to a multiplication operator and leave `x` as a string. Will the result be a string or a number?

```javascript
var x = '13';
var y = 9;

console.log(x * y);
```

Solution:
It will be a number.


3. Convert the three parts of this telephone number to strings to produce a valid phone number.

```javascript
var npa = 212;
var nxx = 555;
var num = 1212;

console.log(npa + nxx + num);
```

Solution:

```javascript
var npa = 212;
var nxx = 555;
var num = 1212;

npa = String(npa) + ' ';
nxx = String(nxx) + '-';
num = String(num);
console.log(npa + nxx + num);
```

4. Use `String()` to do the above.

Solution:
See 3.


5. Try using `toString()` to convert a boolean and an array to a String. Did you get the result you expected?

```javascript
var bool = true;
var arr = [1, 2, 3];
```

Solution:

```javascript
var bool = true;
var arr = [1, 2, 3];

var boolConverted = bool.toString();
var arrConverted = arr.toString();

console.log(boolConverted);
console.log(arrConverted);

```

