# [Practice Problems: Find Missing Numbers](https://launchschool.com/lessons/e2c71a47/assignments/8463503e)


## 1.
Write a function that takes a sorted array of integers as an argument, and returns an array that includes all the missing integers (in order) between the first and last elements of the argument

```javascript
missing([-3, -2, 1, 5]);                  // [-1, 0, 2, 3, 4]
missing([1, 2, 3, 4]);                    // []
missing([1, 5]);                          // [2, 3, 4]
missing([6]);                             // []
```

### Solution

```javascript
function missing(arr) {
  var missingValues = [];
  var start = arr[0] + 1;
  var stop = arr[arr.length - 1];
  var i;
  
  for (i = start; i < stop; i++) {
    if (!arr.includes(i)) {
      missingValues.push(i);
    }
  }

  return missingValues;
    }
```


