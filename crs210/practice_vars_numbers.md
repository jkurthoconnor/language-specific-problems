Practice Problems: [Variables and Numbers](https://launchschool.com/lessons/18c27076/assignments/492016f3)

1. Declare a variable named `numerator` and set it to 10.

```javascript
var numerator;
numerator = 10;
```

2. Declare a variable named `denominator` and set it to 2.

```javascript
var denomenator = 2;
```

3. Declare a variable named `answer` and set it to the result of `numerator` divided by `denominator`. Log the value of `answer`.


```javascript
var numerator = 10;
var denominator = 2;

var answer = numerator / denominator;
console.log(answer);
```

4. Declare a variable named `incrementer` and set it to 1.

```javascript
var incrementer = 1;
```

5. Declare a variable named `start` and set it to `incrementer`

```javascript
var incrementer = 1;
var start = incrementer;
```

6. Declare variables named `end` and `difference`. Leave them undefined.

```javascript
var end;
var difference;
```

7. Increment the `incrementer` variable by 1 three times using the self-addition notation.

```javascript
incrementer += 1;
incrementer += 1;
incrementer += 1;
```

8. Increment the `incrementer` variable by 1 twice using increment operator shorthand.

```javascript
incrementer++;
incrementer++;
```

9. Set the value of `end` to `incrementer` and the value of `difference` to `end` minus `start`. Log the value of `end`; log the value of `difference`.

```javascript
var incrementer = 1;
var start = incrementer;
var end;
var difference;
incrementer += 1;
incrementer += 1;
incrementer += 1;
incrementer++;
incrementer++;
end = incrementer;
difference = end - start;
console.log(end);
console.log(difference);
```

10. Write the arithmetic statement that sets a variable `answer` to the result of 11 plus 31 multiplied by 3 as one statement, then log the result. 


```javascript
var answer = (11 + 31) * 3;
console.log(answer);
```
