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

### Solution

```javascript
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
