LS Exercises: [Regex](https://launchschool.com/books/regex/read/using#match)


## Problem 1:

Write a method that returns true if is argument looks like a URL, false if it does not.


```javascript
isUrl('http://launchschool.com');   // -> true
isUrl('https://example.com');       // -> true
isUrl('https://example.com hello'); // -> false
isUrl('   https://example.com');    // -> false
```

### Solution

```javascript
function isUrl(str) {
  return !!str.match(/^https?:\/\/\S+$/);
}
```


## Problem 2:
Write a method that returns all of the fields in a haphazardly formatted string. A variety of spaces, tabs, and commas separate the fields, with possibly multiple occurrences of each delimiter.

```javascript
fields("Pete,201,Student");
// -> ['Pete', '201', 'Student']

fields("Pete \t 201    ,  TA");
// -> ['Pete', '201', 'TA']

fields("Pete \t 201");
// -> ['Pete', '201']```
```
### Solution

```javascript
function fields(str) {
  return str.split(/[\t ,]+/);
}
```


## Problem 3:
Write a method that changes the first arithmetic operator (`+`, `-`, `*`, `/`) in a string to a '?' and returns the resulting string. Don't modify the original string.
```javascript
mysteryMath('4 + 3 - 5 = 2');
// -> '4 ? 3 - 5 = 2'

mysteryMath('(4 * 3 + 2) / 7 - 1 = 1');
// -> '(4 ? 3 + 2) / 7 - 1 = 1'
```

### Solution

```javascript
function mysteryMath(str) {
  return str.replace(/[+\-\/*]/, '?');
}
```


## Problem 4:
Write a method that changes every arithmetic operator (`+`, `-`, `*`, `/`) to a '?' and returns the resulting string. Don't modify the original string.
```javascript
```

### Solution

```javascript
function mysteriousMath(str) {
  return str.replace(/[+\-\/*]/g, '?');
}
```


## Problem 5:
Write a method that changes the first occurrence of the word `apple`, `blueberry`, or `cherry` in a string to `danish`.

```javascript
danish('An apple a day keeps the doctor away');
// -> 'An danish a day keeps the doctor away'

danish('My favorite is blueberry pie');
// -> 'My favorite is danish pie'

danish('The cherry of my eye');
// -> 'The danish of my eye'

danish('apple. cherry. blueberry.');
// -> 'danish. cherry. blueberry.'

danish('I love pineapple');
// -> 'I love pineapple'
```

### Solution

```javascript
function danish(str) {
  return str.replace(/\b(apple|blueberry|cherry)\b/, 'danish');
}
```


## Problem 6:
Challenge: write a method that changes dates in the format `2016-06-17`(to the format `17.06.2016`. You must use a regular expression and should use methods described in this section.

```javascript
formatDate('2016-06-17'); // -> '17.06.2016'
formatDate('2016/06/17'); // -> '2016/06/17' (no change)
```
### Solution

```javascript
function formatDate(dateStr) {
  return dateStr.replace(/\b(\d{4})-(\d{2})-(\d{2})\b/, '$3.$2.$1');
}
```


## Problem 7:
Challenge: write a method that changes dates in the format 2016-06-17 or 2016/06/17 to the format 17.06.2016. You must use a regular expression and should use methods described in this section.

```javascript
formatDate('2016-06-17'); // -> '17.06.2016'
formatDate('2017/05/03'); // -> '03.05.2017'
formatDate('2015/01-31'); // -> '2015/01-31' (no change)
```

### Solution

```javascript
function formatDate(dateStr) {
  return dateStr.replace(/^(\d{4})(\/|-)(\d{2})\2(\d{2})$/, '$4.$3.$1');
}
```
