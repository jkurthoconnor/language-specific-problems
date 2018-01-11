# LS Exercises: [JS Small Problems, Easy 2](https://launchschool.com/exercise_sets/0cfd16b0)



## 1. Ddaaiillyyddoouubbllee

Write a function that takes a string argument, and returns a new string that contains the value of the original string with all consecutive duplicate characters collased into a single character.

```bash
crunch('ddaaiillyy ddoouubbllee');    // "daily double"
crunch('4444abcabccba');              // "4abcabcba"
crunch('ggggggggggggggg');            // "g"
crunch('a');                          // "a"
crunch('');                           // ""
```
### Solution

```javascript
function crunch(str) {
  var cleanStr = '';
  var lastIdx;
  var i;

  for (i = 0; i < str.length; i++) {
    lastIdx = cleanStr.length - 1;
    if (cleanStr[lastIdx] !== str[i]) {
      cleanStr += str[i];
    }
  }

  return cleanStr;
}

// with regex
function crunch(str) {
 return str.replace(/(.)\1+/g, '$1');
}
```

## 2. Bannerizer
Write a function that will take a short line of text, and write it to the console log within a box.


Examples:
```bash
logInBox('To boldly go where no one has gone before.');


+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

logInBox('');
+--+
|  |
|  |
|  |
+--+
```

### Solution

```javascript
function logInBox(text) {
  var horizontalFrame = '+-';
  var paddedRow = '| ';
  var textRow = paddedRow + text + ' |';
  var i;

  for (i = 1; i <= text.length; i++) {
    horizontalFrame += '-';
  }

  for (i = 1; i <= text.length; i++) {
    paddedRow += ' ';
  }

  paddedRow += ' |';
  horizontalFrame += '-+';

  console.log(horizontalFrame);
  console.log(paddedRow);
  console.log(textRow);
  console.log(paddedRow);
  console.log(horizontalFrame);
}

// further exploration: with optional maxWidth argument to enforce truncation

function logInBox(text, maxWidth) {
  var sliceUpTo;
  var textRow;
  var horizontalFrame;
  var paddedRow;

  if (text.length + 4 > maxWidth) {
    sliceUpTo = maxWidth - 4;
    text = text.slice(0, sliceUpTo);
  }

  textRow = '| ' + text + ' |';
  horizontalFrame = '+-' + '-'.repeat(text.length) + '-+';
  paddedRow = '| ' + ' '.repeat(text.length) + ' |';

  console.log(horizontalFrame);
  console.log(paddedRow);
  console.log(textRow);
  console.log(paddedRow);
  console.log(horizontalFrame);
}

logInBox('To boldly go where no one has gone before.', 40);
logInBox('To boldly go where no one has gone before.');
logInBox('To boldly go where no one has gone before.', 47);
logInBox('');
```

## 3. Stringy Strings




### Solution

```javascript
```
## 4. Fibonacci Number Location by length


```bash

```


### Solution

```javascript
```
## 5.Right Triangles

```bash

```


### Solution

```javascript
```

## 6. Madlibs

```javascript
```


### Solution

```javascript
```
## 7. Double Doubles


```bash

```


### Solution

```javascript
```
## 8. Grade Book


```bash

```


### Solution

```javascript
```
## 9. Clean UP the Words

```bash
```


### Solution

```javascript
```
## 10. What Century is That

```bash
```


### Solution

```javascript
```
