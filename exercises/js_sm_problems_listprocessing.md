
LS Exercises: [List Processing](https://launchschool.com/exercise_sets/8023101b)


## Problem 1:
Write a function that takes one argument, a positive integer, and returns the sum of its digits. Do this using list procesing techniques.

```javascript
sum(23);           // 5
sum(496);          // 19
sum(123456789);    // 45
```

### Solution

```javascript
function sum(int) {
  var digits = int.toString(10).split('');
  var integers = digits.map(function (digit) { return parseInt(digit, 10); });

  return integers.reduce(function (sum, value) { return sum + value; });
}

sum(23);           // 5
sum(496);          // 19
sum(123456789);    // 45
```


## Problem 2:
Write a function that takes an array of integers between `0` and `19`, and returns an array of those integers sorted based on the English word for each number.

```javascript
alphabeticNumberSort(
   [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]);
// [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]
```

### Solution

```javascript
function alphabeticNumberSort(numbers) {
  var numberWords = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'];

  return numbers.sort(function (n1, n2) {
    if (numberWords[n1] < numberWords[n2]) {
      return -1;
    } else if (numberWords[n1] > numberWords[n2]) {
      return 1;
    } else {
      return 0;
    }
  });
}
console.log(alphabeticNumberSort(
[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]));
// [8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17, 6, 16, 10, 13, 3, 12, 2, 0]</script>
```


## Problem 3:
Write a function that takes two array arguments, each containing a list of numbers, and returns a new array containing the products of all combinations of number pairs that exist between the two arrays. The returned array should be sorted in ascending numerical order.

You may assume that neither argument will be an empty array.
```javascript
multiplyAllPairs([2, 4], [4, 3, 1, 2]);    // [2, 4, 4, 6, 8, 8, 12, 16]
```

### Solution

```javascript
function multiplyAllPairs(arr1, arr2) {
  var products = [];

  arr1.forEach(function (n) {
    arr2.forEach(function (n2) {
      products.push(n * n2);
    });
  });

  return products.sort(function (a, b) { return a - b; });
}

console.log(multiplyAllPairs([2, 4], [4, 3, 1, 2]));    // [2, 4, 4, 6, 8, 8, 12, 16]
```


## Problem 4:

Write a function that takes an array of numbers, and returns the sum of the sums of each leading subsequence for that array. You may assume that the array always contains at least one number.

Examples:
```javascript
sumOfSums([3, 5, 2]);        // (3) + (3 + 5) + (3 + 5 + 2) --> 21
sumOfSums([1, 5, 7, 3]);     // (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) --> 36
sumOfSums([4]);              // 4
sumOfSums([1, 2, 3, 4, 5]);  // 35
```

### Solution

```javascript
function sumOfSums(numbers) {
  return numbers.map(function (n, idx) {
    return numbers.slice(0, idx).reduce(function (sum, value) {
      return sum + value;}, n);
  }).reduce(function (sum, value) { return sum + value });
}

console.log(sumOfSums([3, 5, 2]));        // (3) + (3 + 5) + (3 + 5 + 2) --> 21
console.log(sumOfSums([1, 5, 7, 3]));     // (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) --> 36
console.log(sumOfSums([4]));              // 4
console.log(sumOfSums([1, 2, 3, 4, 5]));  // 35
```


## Problem 5:

Write a function that takes a string argument, and returns a list of all substrings that start from the beginning of the string, ordered from shortest to longest.

Examples:
```javascript
substringsAtStart('abc');      // ["a", "ab", "abc"]
substringsAtStart('a');        // ["a"]
substringsAtStart('xyzzy');    // ["x", "xy", "xyz", "xyzz", "xyzzy"]
```

### Solution

```javascript
function substringsAtStart(str) {
  return str.split('').map(function (ltr, idx, arr) {
    return arr.slice(0, idx + 1).join('');
  });
}

console.log(substringsAtStart('abc'));      // ["a", "ab", "abc"]
console.log(substringsAtStart('a'));        // ["a"]
console.log(substringsAtStart('xyzzy'));    // ["x", "xy", "xyz", "xyzz", "xyzzy"]
```


## Problem 6:

Write a function that returns a list of all substrings of a string. Order the returned list by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, return the substrings at a given position from shortest to longest.

You may (and should) use the substringsAtStart function you wrote in the previous exercise:

Example:
```javascript
substrings('abcde');

// returns
[ "a", "ab", "abc", "abcd", "abcde",
  "b", "bc", "bcd", "bcde",
  "c", "cd", "cde",
  "d", "de",
  "e" ]

```

### Solution

```javascript
function substrings(str) {
  var nested = str.split('').map(function (ltr, idx) {
    return substringsAtStart(str.substring(idx));
  });

  return nested.reduce(function (flattened, currArr) {
    return flattened.concat(currArr);
  });
}

function substringsAtStart(str) {
  return str.split('').map(function (ltr, idx, arr) {
    return arr.slice(0, idx + 1).join('');
  });
}
console.log(substrings('abcde'));
```


## Problem 7:

Write a function that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as backwards. The substrings in the returned list should be sorted by their order of appearance in the input string. Duplicate substrings should be included multiple times.

You may (and should) use the substrings function you wrote in the previous exercise.

For the purpose of this exercise, you should consider all characters and pay attention to case; that is, 'AbcbA' is a palindrome, but 'Abcba' and 'Abc-bA' are not. In addition, assume that single characters are not palindromes.

Examples:

```javascript
palindromes('abcd');       // []
palindromes('madam');      // [ "madam", "ada" ]

palindromes('hello-madam-did-madam-goodbye');
// returns
[ "ll", "-madam-", "-madam-did-madam-", "madam", "madam-did-madam", "ada",
  "adam-did-mada", "dam-did-mad", "am-did-ma", "m-did-m", "-did-", "did",
  "-madam-", "madam", "ada", "oo" ]

palindromes('knitting cassettes');
// returns
[ "nittin", "itti", "tt", "ss", "settes", "ette", "tt" ]
```

### Solution

```javascript
function substrings(str) {
  var nested = str.split('').map(function (ltr, idx) {
    return substringsAtStart(str.substring(idx));
  });

  return nested.reduce(function (flattened, currArr) {
    return flattened.concat(currArr);
  });
}

function substringsAtStart(str) {
  return str.split('').map(function (ltr, idx, arr) {
    return arr.slice(0, idx + 1).join('');
  });
}

function palindromes(str) {
  return substrings(str).filter(function (subStr) {
    return (subStr.length > 1) && subStr === subStr.split('').reverse().join('');
  });

}
```


## Problem 8:

Write a function that takes a grocery list (a two-dimensional array) with each element containing a fruit and a quantity, and returns a one-dimensional array of fruits, in which each fruit appears a number of times equal to its quantity.

Example:
```javascript
buyFruit([['apple', 3], ['orange', 1], ['banana', 2]]);
// returns ["apple", "apple", "apple", "orange", "banana", "banana"]
```

### Solution

```javascript
function buyFruit(list) {
  var longList = expandList(list);

  return longList.reduce(function (collector, subArr) {
    return collector.concat(subArr);
  });
}

function expandList(nestedList) {
  return nestedList.map(function (item) {
    var holder = [];
    for (var i = 1; i <= item[1]; i += 1) {
      holder.push(item[0]);
    }
    return holder;
  });
}

console.log(buyFruit([['apple', 3], ['orange', 1], ['banana', 2]]));

```


## Problem 9:

Write a function that takes two arguments, inventoryItem and transactions, and returns an array containing only the transactions for the specified inventoryItem.

Example
```javascript
var transactions = [ { id: 101, movement: 'in',  quantity:  5 },
                     { id: 105, movement: 'in',  quantity: 10 },
                     { id: 102, movement: 'out', quantity: 17 },
                     { id: 101, movement: 'in',  quantity: 12 },
                     { id: 103, movement: 'out', quantity: 15 },
                     { id: 102, movement: 'out', quantity: 15 },
                     { id: 105, movement: 'in',  quantity: 25 },
                     { id: 101, movement: 'out', quantity: 18 },
                     { id: 102, movement: 'in',  quantity: 22 },
                     { id: 103, movement: 'out', quantity: 15 }, ];

transactionsFor(101, transactions);
// returns
[ { id: 101, movement: "in",  quantity:  5 },
  { id: 101, movement: "in",  quantity: 12 },
  { id: 101, movement: "out", quantity: 18 }, ]

```

### Solution

```javascript
function transactionsFor(inventoryItem, transactions) {
  return transactions.filter(function (transaction) {
    return transaction.id === inventoryItem;
  });
}
```


## Problem 10:

Building on the previous exercise, write a function that returns true or false based on whether or not an inventory item is available. As before, the function takes two arguments: an inventory item and a list of transactions. The function should return true only if the sum of the quantity values of the item's transactions is greater than zero. Notice that there is a movement property in each transaction object. A movement value of 'out' will decrease the item's quantity.

You may (and should) use the transactionsFor function from the previous exercise.

Examples:
```javascript
var transactions = [ { id: 101, movement: 'in',  quantity:  5 },
                     { id: 105, movement: 'in',  quantity: 10 },
                     { id: 102, movement: 'out', quantity: 17 },
                     { id: 101, movement: 'in',  quantity: 12 },
                     { id: 103, movement: 'out', quantity: 15 },
                     { id: 102, movement: 'out', quantity: 15 },
                     { id: 105, movement: 'in',  quantity: 25 },
                     { id: 101, movement: 'out', quantity: 18 },
                     { id: 102, movement: 'in',  quantity: 22 },
                     { id: 103, movement: 'out', quantity: 15 }, ];

isItemAvailable(101, transactions);     // false
isItemAvailable(105, transactions);     // true
```

### Solution

```javascript
function transactionsFor(inventoryItem, transactions) {
  return transactions.filter(function (transaction) {
    return transaction.id === inventoryItem;
  });
}

function inventoryMovementTotal(direction, transactions) {
  var movementRecords = transactions.filter(function (transaction) {
    return transaction.movement === direction;
  });

  return movementRecords.reduce(function (sum, record) {
    return sum + record.quantity;
  }, 0);
}

function isItemAvailable(inventoryItem, transactions) {
  var itemTransactions = transactionsFor(inventoryItem, transactions);
  var itemsIn = inventoryMovementTotal('in', itemTransactions);
  var itemsOut = inventoryMovementTotal('out', itemTransactions);

  return itemsIn > itemsOut;
}
```
