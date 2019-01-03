
LS Practice Problems: [Strings](https://launchschool.com/lessons/4f7d463e/assignments/25e9e019)


## Problem 1:
Create a variable named firstName and set it equal to your first name. Set another variable named lastName to your last name. Join the two together, separated by a space, and store the result in a variable named fullName. Log the value of fullName.

### Solution

```javascript
var firstName = 'Kurth';
var lastName = 'O\'Connor';
var fullName = `${firstName} ${lastName}`;

console.log(fullName);
```


## Problem 2:
Call concat on firstName using lastName as an argument. Log the return value.


### Solution

```javascript
console.log(firstName.concat(' ', lastName));
```


## Problem 3:

Split the fullName variable into an array that contains the first and last names as separate strings. Log the value of the array.

### Solution

```javascript
var names = fullName.split(' ');
```


## Problem 4:

Create a variable named language and set it equal to 'JavaScript'. Find the index of the first occurrence of the letter 'S' and save it to a variable named idx variable. Log the value of idx.

### Solution

```javascript
var language = 'JavaScript';
var idx = language.indexOf('S');

console.log(idx);
```


## Problem 5:

Call charCodeAt on the language variable with an argument of idx. Save the return value to a variable named charCode, then log the value of charCode.


### Solution

```javascript
var language = 'JavaScript';
var idx = language.indexOf('S');
var charCode = language.charCodeAt(idx);

console.log(charCode);
```


## Problem 6:

Log the return value of String.fromCharCode when you pass it charCode as an argument.


### Solution

```javascript
console.log(String.fromCharCode(charCode));
```


## Problem 7:

Find the index of the last occurrence of the letter 'a' in the language variable and log the result.

### Solution

```javascript
var lastA = language.lastIndexOf('a');

console.log(lastA);
```


## Problem 8:

Create two variables, a = 'a' and b = 'b'. Log a "greater than" comparison between the two variables. Reassign the value 'B' to variable b, then compare the two variables again, and log the comparison value.

### Solution

```javascript
var a = 'a';
var b = 'b';

console.log(a > b);
console.log(a.charCodeAt(0), b.charCodeAt(0));

b = 'B';

console.log(a > b);
console.log(a.charCodeAt(0), b.charCodeAt(0));
```


## Problem 9:

Create variables aIndex and vIndex and store the index of the first occurrences of letters 'a' and 'v' in the language string. Call the substr method on language with aIndex as the first argument, and 4 as the second argument, e.g., language.substr(aIndex, 4). Log the return value. Repeat the operation using vIndex as the first argument.

### Solution

```javascript
var aIndex = language.indexOf('a');
var vIndex = language.indexOf('v');

console.log(language.substr(aIndex, 4)); // avaS  // note: 2nd arg is number
                                        // of characters, not idx
console.log(language.substr(vIndex, 4)); // vaSc
```


## Problem 10:

Repeat the previous problem, but this time use substring instead of substr. Note how the results differ because of the different ways these methods interpret the second argument:

### Solution

```javascript
console.log(language.substring(aIndex, 4)); // ava // 2nd arg is idx to stop 
                                            // before
console.log(language.substring(vIndex, 4)); // va
```

## Problem 11:

Create variables named fact1 and fact2 and set them equal to 'JavaScript is fun' and 'Kids like it too', respectively. Combine the values of the two variables with the string ' and ' between them, and store the result in a variable named compoundSentence. Make sure the first letter of fact2 shows up as lowercase in compoundSentence. Log the value of compoundSentence.

### Solution

```javascript
var fact1 = 'JavaScript is fun';
var fact2 = 'Kids like it too';
var compoundSentence = fact1 + ' and ' + fact2.slice(0, 1).toLowerCase() + fact2.slice(1);

console.log(compoundSentence);
```

## Problem 12:

Log the first letter of fact1 and fact2 using bracket notation.

### Solution

```javascript
console.log(fact1[0], fact2[0]);
```

## Problem 13:

Create a variable named pi and set it to the result of 22 / 7. Convert pi to a String using the toString method. Search the resulting string for the final occurrence of '14', and log its index position.

### Solution

```javascript
var pi = 22 / 7;
var piStr = (pi).toString(10);

console.log(piStr);
console.log(piStr.lastIndexOf('14'));
```

## Problem 14

Create a variable named boxNumber and set it to the result of 356.toString(), and log the result. Before moving on, try to run your program.

### Solution

```javascript
var boxNumber = (365).toString(); // parens or `..` is necessary to keep interpreter from confusing the `.` with a decimal

console.log(boxNumber);

```

## Problem 15

Convert the boxNumber variable back to a number using parseInt. To make sure the result is a number, you can log typeof boxNumber to verify the type of the result. Now convert the number back to a String by using the String() function and log the typeof of the result to verify it is now a String.

### Solution

```javascript
var boxNumber = (365).toString();

boxNumber = parseInt(boxNumber, 10);
console.log(typeof boxNumber);

boxNumber = String(boxNumber);
console.log(typeof boxNumber);

```

## Problem 16

Write a program that asks for a user's name, then greets the user with that name. If the user appends a ! to his name (e.g., 'Bill!'), the computer should "yell" its greeting: that is, it should log everything to the console in uppercase. You can check whether the name ends with a ! using String.prototype.endsWith() (ES6 only). You can remove the ! from the user's name with String.prototype.slice().

### Solution

```javascript

```
