# Practice Problems: [Working with Object Properties](https://launchschool.com/lessons/0539330a/assignments/b95a1315)


## Problem 1.
Write a function named `objectHasProperty` that takes two arguments: an Object and a String. The function should return true if the Object contains a property with the name given by the String, false otherwise.

### Solution

```javascript
var pets = {
  cat: 'Simon',
  dog: 'Dwarf',
  mice: null,
};


function objectHasProperty(obj, property) {
  return Object.keys(obj).includes(property);
}

objectHasProperty(pets, 'dog');       // true
objectHasProperty(pets, 'lizard');    // false
objectHasProperty(pets, 'mice');      // true

// with `in` operator
function objectHasProperty(obj, property) {
  return property in obj;
}
```

## Problem 2.

Write a function named `incrementProperty` that takes two arguments: an Object and a String. If the Object contains a property with the specified name, the function should increment the value of the property. If the property does not exist, the function should add a new property with a value of `1`. The function should return the new value of the property.

### Solution

```javascript
var wins = {
  steve: 3,
  susie: 4,
};

function incrementProperty(obj, prop) {

  if (Object.keys(obj).includes(prop)) {
    obj[prop] += 1;
  } else {
    obj[prop] = 1;
  }

  return obj[prop];
}
```
## Problem 3.
Write a function named `copyProperties` that takes two Objects as arguments. The function should copy all properties from the first object to the second. The function should return the number of properties copied.

### Solution

```javascript
var hal = {
  model: 9000,
  enabled: true,
};

var sal = {};

function copyProperties(obj1, obj2) {
  for (var key in obj1) {
    obj2[key] = obj1[key];
  }

  return Object.keys(obj2).length;
}

copyProperties(hal, sal);  // 2
sal;                       // { model: 9000, enabled: true }

// the above assumes the role is to copy into an empty object; if that is not the case, the following implementation uses a counter to return the number of newly copied properties

function copyProperties(obj1, obj2) {
  var counter = 0;

  for (var key in obj1) {
    obj2[key] = obj1[key];
    counter += 1;
  }

  return counter;
}
```

## Problem 4.
Write a function named `wordCount` that takes a single String as an argument. The function should return an Object that contains the counts of each word that appears in the provided String. In the returned Object, you should use the words as keys, and the counts as values.

### Solution

```javascript
function wordCount(string) {
  var count = {};
  var wordList = string.split(' ');

  for (i = 0; i < wordList.length; i++) {
    if (count[wordList[i]]) {
      count[wordList[i]] += 1;
    } else {
      count[wordList[i]] = 1;
    }
  }

  return count;
}
