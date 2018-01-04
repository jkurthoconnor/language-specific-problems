# LS Exercises: [JS Small Problems, Easy 1](https://launchschool.com/exercise_sets/7907e797)


## 1. Odd Numbers
Log all odd numbers from `1` to `99`, inclusive, to the console. Log all numbers on separate lines.


### Solution

```javascript
// simple version
function logOdds(start, stop) {
  var i;

  for (i = start; i <= stop; i++) {
    if (i % 2 === 1) {
      console.log(i);
    }
  }
}
logOdds(1, 99);


// faster: only requires remainder check once
function logOdds(start, stop) {
  var i;
  var firstOdd;

  firstOdd = (start % 2 === 1) ? start : start + 1;

  for (i = firstOdd; i <= stop; i += 2) {
    console.log(i);
  }
}


logOdds(1, 99);
logOdds(2, 292);
```

## 2. Even Numbers

```javascript

```


### Solution

```javascript

```
## 3.How Big is the Room

```javascript

```


### Solution

```javascript

```
## 4.Tip Calculator

```javascript

```


### Solution

```javascript

```
## 5.Sum or Product of Consecutive Integers

```javascript

```


### Solution

```javascript

```
## 6.Short Long Short

```javascript

```


### Solution

```javascript

```
## 7.Leap Years Part 1

```javascript

```


### Solution

```javascript

```
## 8.Leap Years Part 2

```javascript

```


### Solution

```javascript

```
## 9.Multiples of 3 and 5

```javascript

```


### Solution

```javascript

```
## 10.ASCII String Value

```javascript

```


### Solution

```javascript

```
