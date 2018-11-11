# Practice Problems: [Operators and Conditionals](https://launchschool.com/lessons/18c27076/assignments/0a12e3a8)


1. Set a variable, `apples`, to 3. Set a second variable `bananas` to 5. Write a conditional using `==` that checks whether `apples` is equal to `bananas`. Log a message if true.

```javascript
var apples = 3;
var bananas = 5;

if (apples == bananas) {
  console.log('They are equal!!!');
}
```


2. Set the value of `bananas` to the string value `"3"`.


```javascript
var apples = 3;
var bananas = "3";

if (apples == bananas) {
  console.log('They are equal!!!');
}                                 // They are equal!!!
                                  // `==` employs implicit type coercion
```


3. Change the previous problem to use `===`. Why doesn't this one output a message?


```javascript
var apples = 3;
var bananas = "3";

if (apples === bananas) {
  console.log('They are equal!!!');
}                                 // no logged message because `===` does not coerce types
```


4. Create an `else` statement that logs a different message if false.


```javascript
var apples = 3;
var bananas = "3";

if (apples === bananas) {
  console.log('They are equal!!!');
} else { 
  console.log('not equal');
}
```


5. Between the if and else statements, insert an else if statement that checks whether apples == bananas. Log a message stating that the two are the same number but different types.


```javascript
var apples = 3;
var bananas = "3";

if (apples === bananas) {
  console.log('They are equal, and of the same data type!!!');
} else if (apples == bananas) {
  console.log('There is the same number of each, but the data is stored in different types.');
} else { 
  console.log('not equal');
}
```


6. Move the else if statement into the else statement and change to an if statement. After your if statement, append an else statement that outputs your "not strictly equal" message as before.


```javascript
var apples = 3;
var bananas = "3";

if (apples === bananas) {
  console.log('They are equal, and of the same data type!!!');
} 
else {
  if (apples == bananas) {
console.log('There is the same number of each, but the data is stored in different types.');
  }
  else {
  console.log('not equal');
  }
}
```


7. Set the variables apples and bananas to 3. Set a variable, areEqual, to the value of apples compared to bananas. This works the same way as the if statements we have been writing, but instead of an if and the condition in parentheses, we just use the condition from within the parentheses as the new value for our variable. Log the value of areEqual. 


```javascript
var apples = 3;
var bananas = undetermined;
var areEqual = (apples === bananas);
var eitherOr = (apples || bananas);


console.log(areEqual);
console.log(eitherOr);

if (apples === bananas) {
  console.log('They are equal, and of the same data type!!!');
} 
else {
  if (apples == bananas) {
console.log('There is the same number of each, but the data is stored in different types.');
  }
  else {
  console.log('not equal');
  }
}
```


9.Set the value of bananas to 1. Perform the same assignment for eitherOr. Log the value of eitherOr. Afterward, assign bananas || apples to the eitherOr variable. Note that the value is now the bananas variable instead of apples. JavaScript reads this statement from left to right. If the left-side has a truthy value, it is used. Otherwise, the right-side value is used. 


```javascript
var apples = 3;
var bananas = 1;
var eitherOr = (apples || bananas);

console.log(eitherOr);

eitherOr = (bananas || apples);

console.log(eitherOr);
```

10. The ternary operator is another useful method for defining a variable to one of two possible values. This can also replace an if and else statement, but can sometimes be confusing when used that way.

Create two new variables, lastName and familyMessage. Set lastName to your last name, then use a ternary that checks whether lastName is equal to your last name to set familyMessage to either "You're part of the family!" or "You're not family."


```javascript
var lastName = 'Smith';
var familyMessage = lastName === 'Smith' ? 'You\'re family.' : 'You aren\'t family';

console.log(familyMessage);
```
