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
```

## Problem 2.



### Solution

```javascript
```
## Problem 3.

### Solution

```

## Problem 4.


### Solution

```
## Problem 5.


### Solution

```
