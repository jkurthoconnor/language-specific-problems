
LS Exercises: [210 Small Problems: String and Text Processing](https://launchschool.com/exercise_sets/2edda272)


## Problem 1:
Write a function that takes a string argument, and returns `true` if all of the alphabetic characters inside the string are uppercase; `false` otherwise. Ignore characters that are not alphabetic.


```javascript
isUppercase('t');               // false
isUppercase('T');               // true
isUppercase('Four Score');      // false
isUppercase('FOUR SCORE');      // true
isUppercase('4SCORE!');         // true
isUppercase('');                // true
```

### Solution

```javascript
function isUppercase(str) {
  return str.split('').filter(function (char) {
    return !!char.match(/[a-z]/i);
  }).every(function (char) {
    return !!char.match(/[A-Z]/);
  });
}

// or more elegantly:
function isUppercase(str) {
  var filteredStr = str.replace(/[^a-z]/gi, '');

  return filteredStr === filteredStr.replace(/[^A-Z]/g, '');
}

// most elegantly:

function isUppercase(str) {
  var lowerCase = /[a-z]/;

  return !lowerCase.test(str);
}

// most obviously:


function isUppercase(str) {
  return str === str.toUpperCase();
}
```


## Problem 2:
Write a function that takes an array of string, and returns an array of the same strings values without the vowels (a, e, i, o, u).

```javascript
removeVowels(['abcdefghijklmnopqrstuvwxyz']);         // ["bcdfghjklmnpqrstvwxyz"]
removeVowels(['green', 'YELLOW', 'black', 'white']);  // ["grn", "YLLW", "blck", "wht"]
removeVowels(['ABC', 'AEIOU', 'XYZ']);                // ["BC", "", "XYZ"]
```

### Solution

```javascript
function removeVowels(strings) {
  return strings.map(function (str) {
    return str.replace(/[aeiou]/gi, '');
  });
}
```


## Problem 3:

Write a function that takes a string and returns an object containing three properties: one representing the number of characters in the string that are lowercase, one representing the number of characters that are uppercase, and one representing the number of characters that are neither.

```javascript

letterCaseCount('abCdef 123');  // { lowercase: 5, uppercase: 1, neither: 4 }
letterCaseCount('AbCd +Ef');    // { lowercase: 3, uppercase: 3, neither: 2 }
letterCaseCount('123');         // { lowercase: 0, uppercase: 0, neither: 3 }
letterCaseCount('');            // { lowercase: 0, uppercase: 0, neither: 0 }
```

### Solution

```javascript
// straight-forward approach:

function letterCaseCount(str) {
  var count = {
    lowercase: 0,
    uppercase: 0,
    neither: 0,
  };

  str.split('').forEach(function (ele) {
    if (/[A-Z]/.test(ele)) {
      count.uppercase += 1;
    } else if (/[a-z]/.test(ele)) {
      count.lowercase += 1;
    } else {
      count.neither += 1;
    }
  });

  return count;
}

// more declarative:
function letterCaseCount(str) {
  var lowCount = str.match(/[a-z]/g);
  var upCount = str.match(/[A-Z]/g);
  var neitherCount = str.match(/[^a-z]/ig);

  var count = {
    lowercase: lowCount ? lowCount.length : 0,
    uppercase: upCount ? upCount.length : 0,
    neither: neitherCount ? neitherCount.length : 0,
  };

  return count;
}

// using reduce with object as initial value:
function letterCaseCount(str) {
  return str.split('').reduce(function (counter, char) {
    if (/[A-Z]/.test(char)) {
      counter.uppercase += 1;
    } else if (/[a-z]/.test(char)) {
      counter.lowercase += 1;
    } else {
      counter.neither += 1;
    }

    return counter;
  }, {lowercase: 0, uppercase: 0, neither: 0});
}
```


## Problem 4:
Write a function that takes a string as an argument, and returns the string with the first character of every word capitalized and all subsequent characters in lowercase.

You may assume that a word is any sequence of non-whitespace characters.
```javascript
wordCap('four score and seven');       // "Four Score And Seven"
wordCap('the javaScript language');    // "The Javascript Language"
wordCap('this is a "quoted" word');    // 'This Is A "quoted" Word'
```

### Solution

```javascript
function wordCap(str) {
  var lower = str.toLowerCase();

  return lower.replace(/(^(\w)| (\w))/g, function (initial) {
    return initial.toUpperCase();
  });
}
```


## Problem 5:

Write a function that takes a string as an argument, and returns that string with every lowercase letter changed to uppercase and every uppercase letter changed to lowercase. Leave all othe characters unchanged.

```javascript
swapcase('CamelCase');              // "cAMELcASE"
swapcase('Tonight on XYZ-TV');      // "tONIGHT ON xyz-tv"
```

### Solution

```javascript
// handled as a string replacement problem:
function swapcase(str) {
  return str.replace(/[a-z]/gi, function (ltr) {
    if (/[A-Z]/.test(ltr)) {
      return ltr.toLowerCase();
    } else {
      return ltr.toUpperCase();
    }
  });
}

// handled as a list processing problem
function swapcase(str) {
  var swapped;
  var chars = str.split('');

  swapped = chars.map(function (char) {
    return /[a-z]/.test(char) ? char.toUpperCase() : char.toLowerCase();
  });
  
 return swapped.join('');
}
```


## Problem 6:

Write a function that takes a string as an argument, and returns the string with a staggered capitalization scheme. Every other character, starting from the first, should be capitalized and should be followed by a lowercase or non-alphabetic character. Non-alphabetic characters should not be changed, but should be counted as characters for determing when to switch between upper and lower case
```javascript
staggeredCase('I Love Launch School!');        // "I LoVe lAuNcH ScHoOl!"
staggeredCase('ALL_CAPS');                     // "AlL_CaPs"
staggeredCase('ignore 77 the 444 numbers');    // "IgNoRe 77 ThE 444 NuMbErS"

```

### Solution

```javascript
function staggeredCase(str) {
  return str.split('').map(function (char, idx) {
    return idx % 2 === 0 ? char.toUpperCase() : char.toLowerCase();
  }).join('');
}

// using the higher-order functionality of `replace`:
function staggeredCase(str) {
  return str.replace(/(.)((.)|($))/g, function (pair, even, odd) {
    return [even.toUpperCase(), odd.toLowerCase()].join('');
  });
}
```


## Problem 7:

Modify the function from the previous exercise so that it ignores non-alphabetic characters when determining whether a letter should be upper or lower case. Non-alphabetic characters should still be included in the output string, but should not be counted when determining the appropriate case.

```javascript
staggeredCase('I Love Launch School!');        // "I lOvE lAuNcH sChOoL!"
staggeredCase('ALL CAPS');                     // "AlL cApS"
staggeredCase('ignore 77 the 444 numbers');    // "IgNoRe 77 ThE 444 nUmBeRs"
```

### Solution

```javascript
function staggeredCase(str) {
  return str.replace(/([a-z])([^a-z]*?)(([a-z])|($))/ig, function (match, up, nonAlph, down) {
    return [up.toUpperCase(), nonAlph, down.toLowerCase()].join('');
  });
}
```


## Problem 8:

Write a function that takes a string as an argument, and returns an array that contains every word from the string, with each word followed by a space and the word's `length`. If the argument is an empty string  or if no argument is passed, the function should return an empty array.

You may assume that every pair of words in the string will be separated by a singlespace.

```javascript
wordLengths('cow sheep chicken');
// ["cow 3", "sheep 5", "chicken 7"]

wordLengths('baseball hot dogs and apple pie');
// ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

wordLengths("It ain't easy, is it?");
// ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

wordLengths('Supercalifragilisticexpialidocious');
// ["Supercalifragilisticexpialidocious 34"]

wordLengths('');      // []
wordLengths();        // []
```


### Solution

```javascript
function wordLengths(str) {
  if (!str) {
    return [];
  }

  return str.split(' ').map(function (word) {
    return `${word} ${String(word.length)}`;
  });
}

// to avoid returning empty array for arguments 0, false, undefined, NaN or null
// the following guard clause could be used, as it targets only the empty
// string and non-existant argument
  if (arguments.length === 0 || str.length === 0) {
    return [];
  }
```


## Problem 9:

Write a function that takes a `word` and a string of `text` as arguments, and returns an integer representing the number of times the `word` appears in the `text`.

You may assume that the `word` and `text`inputs will always be provided.

```javascript
var text = 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?';

searchWord('sed', text);      // 3
```

### Solution

```javascript
// treating as a string regexp problem:
function searchWord(word, text) {
  var pattern = new RegExp('\\b' + word + '\\b', 'gi');

  return text.match(pattern).length;
}

// treating as a list processing problem using reduce
// also with input validation

function searchWord(word, text) {
  if (arguments.length !== 2 || word.length < 1 || text.length < 1) {
    return 'Inadequate parameters supplied.';
  };

  var pattern = new RegExp('^' + word + '$', 'i');

  return text.split(/\W+/).reduce(function (count, str) {
    return (pattern.test(str) ? count += 1 : count);
  }, 0);
}

console.log(searchWord('sed', text));      // 3
console.log(searchWord('qui', text));      // 4
console.log(searchWord('', text));      //
```


## Problem 10:

The function from the previous exercise returns the number of occurrences of a word in some text. Although this is useful, there are also situations in which we just want to find the word in the context of the text.

For this exercise, write a function that takes a word and a string of text as arguments, and returns the text with every instance of the word highlighted. To highlight a word, enclose the word with two asterisks (`**`) on each side and change every letter of the word to uppercase (e.g., `**HIGHLIGHTEDWORD**`).


### Solution

```javascript
function searchWord(word, text) {
  if (arguments.length !== 2 || word.length < 1 || text.length < 1) {
    return 'Inadequate parameters supplied.';
  };

  var pattern = new RegExp('\\b' + word + '\\b', 'gi');

  return text.replace(pattern, function (match) {
    return `**${match.toUpperCase()}**`;
  });
}

console.log(searchWord('sed', text));      // 3
console.log(searchWord('qui', text));      // 4
console.log(searchWord('', text));      //
```
