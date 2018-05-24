# LS Exercises: [Small Problems: Interpretive Problem Solving](https://launchschool.com/exercise_sets/46af1f8b)

## Problem:

You have a bank of switches before you, numbered from 1 to n. Every switch is connected to exactly one light that is initially off. You walk down the row of switches and toggle every one of them. You walk back to the beginning of the row and start another pass. On this second pass, you toggle switches 2, 4, 6, and so on. On the third pass, you go back to the beginning again, this time toggling switches 3, 6, 9, and so on. You continue to repeat this process until you have gone through n repetitions.

Write a program that takes one argument—the total number of switches—and returns an array of the lights that are on after n repetitions.

Examples:
```javascript
 
function lightsOn(switches) {
  // ...
}

lightsOn(5);        // [1, 4]
// Detailed result of each round for `5` lights
// Round 1: all lights are on
// Round 2: lights 2 and 4 are now off;     1, 3, and 5 are on
// Round 3: lights 2, 3, and 4 are now off; 1 and 5 are on
// Round 4: lights 2 and 3 are now off;     1, 4, and 5 are on
// Round 5: lights 2, 3, and 5 are now off; 1 and 4 are on

lightsOn(100);      // [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
```

### Solution:

```javascript
function lightsOn(switchCount) {
  var switchBank = makeSwitches(switchCount);
  var pass;
  var light;

  for (pass = 1; pass <= switchCount; pass += 1) {
    for (light = 1; light < switchBank.length; light += 1) {
      if (light % pass === 0) switchBank[light] = !switchBank[light];
    }
  }

  switchBank = switchBank.map(function (ele, idx) {return  ele ? idx : ele });
  return switchBank.filter(function (ele) {return !!ele});
}

function makeSwitches(number) {
  var switches = [];
  var i;

  for (i = 0; i < number; i += 1) {
    switches.push(false);
  }

  switches.unshift(undefined);
  return switches;
}
```

## Problem:
Write a function that displays a four-pointed diamond in an nxn grid, where n is an odd integer supplied as an argument to the function. You may assume that the argument will always be an odd integer.

```javascript
diamond(1);
// logs
*

diamond(3);
// logs
 *
***
 *

diamond(9);
// logs
    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *
```

### Solution:

```javascript
function diamond(n) {
  var pattern = [];
  var spaceCount = Math.floor(n / 2);
  var starCount = 1;

  for (spaceCount; spaceCount >= 0; spaceCount -= 1) {
    pattern.push(' '.repeat(spaceCount) + '*'.repeat(starCount));
    starCount += 2;
  }

  pattern = pattern.concat(pattern.slice(0, -1).reverse());

  pattern.forEach(function (str) {
    console.log(str);
  });
}

```

### Further Exploration: Hollow Diamonds

### Solution:

```javascript
function hollowDiamond(n) {
  var pattern = [];
  var spaceCount = Math.floor(n / 2);
  var starCount = 1;

  for (spaceCount; spaceCount >= 0; spaceCount -= 1) {
    if (starCount < 2) {
      pattern.push(' '.repeat(spaceCount) + '*');
    } else {
      pattern.push(' '.repeat(spaceCount) + '*' + ' '.repeat(starCount - 2) + '*');
    }
    starCount += 2;
  }

  pattern = pattern.concat(pattern.slice(0, -1).reverse());

  pattern.forEach(function (str) {
    console.log(str);
  });
}
```

## Problem:

A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to only those words that do not use both letters from any given block. You can also only use each block once.

Write a function that takes a word string as an argument, and returns true if the word can be spelled using the set of blocks, or false otherwise. You can consider the letters to be case-insensitive when you apply the rules.

Examples:

```javascript
isBlockWord('BATCH');      // true
isBlockWord('BUTCH');      // false
isBlockWord('jest');       // true
```

### Solution:

```javascript
// with nested loops
function isBlockWord(string) {
  var blocks = [
    ["B", "O"], ["X", "K"], ["D", "Q"], ["C", "P"], ["N", "A"], ["G", "T"], ["R", "E"],
    ["F", "S"], ["J", "W"], ["H", "U"], ["V", "I"], ["L", "Y"], ["Z", "M"]
  ];
  var letters = string.replace(/[^a-z]/gi, '').split('').map(function (ltr) {
    return ltr.toUpperCase();
    });

  for (var i = 0; i < letters.length; i += 1) {
    for (var block = 0; block < blocks.length; block += 1) {
      if (blocks[block].includes(letters[i])) {
        blocks.splice(block, 1);
        break;
      }

      if (block === blocks.length - 1) return false;
    }
  }
  return true;
}

// without nesting
function isBlockWord(string) {
  var i;
  var blocks = [
    ["B", "O"], ["X", "K"], ["D", "Q"], ["C", "P"], ["N", "A"], ["G", "T"], ["R", "E"],
    ["F", "S"], ["J", "W"], ["H", "U"], ["V", "I"], ["L", "Y"], ["Z", "M"]
  ];
  var letters = string.toUpperCase().replace(/[^A-Z]/g, '');
    vsvr letter = letters[i];
    if (letters.indexOf(letter) !== letters.lastIndexOf(letter)) return false;
  }

  for (i = 0; i < blocks.length; i += 1) {
    if (letters.match(blocks[i][0]) && letters.match(blocks[i][1])) return false;
  }
  return true;
}

console.log(isBlockWord('BATCH'));      // true
console.log(isBlockWord('BUTCH'));      // false
console.log(isBlockWord('jest'));       // true
console.log(isBlockWord('j\'est'));       // true
console.log(isBlockWord('O\'Karu'));       // true
console.log(isBlockWord('Turing'));       // false
console.log(isBlockWord('Data'));       // false
console.log(isBlockWord('B A T'));       // true

```

## Problem:

Write a function that implements the Caesar Cipher. The Caesar Cipher is one of the earliest and simplest ways to encrypt plaintext so that a message can be transmitted securely. It is a substitution cipher in which each letter in a plaintext is substituted by the letter located a given number of positions away in the alphabet. For example, if the letter 'A' is right-shifted by 3 positions, it will be substituted with the letter 'D'. This shift value is often referred to as the key. The "encrypted plaintext" (ciphertext) can be decoded using this key value.

The Caesar Cipher only encrypts letters (including both lower and upper case). Any other character is left as is. The substituted letters are in the same letter case as the original letter. If the key value for shifting exceeds the length of the alphabet, it wraps around from the beginning.

```javascript
// simple shift
caesarEncrypt('A', 0);       // "A"
caesarEncrypt('A', 3);       // "D"

// wrap around
caesarEncrypt('y', 5);       // "d"
caesarEncrypt('a', 47);      // "v"

// all letters
caesarEncrypt('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 25);
// "ZABCDEFGHIJKLMNOPQRSTUVWXY"
caesarEncrypt('The quick brown fox jumps over the lazy dog!', 5);
// "Ymj vznhp gwtbs ktc ozrux tajw ymj qfed itl!"

// many non-letters
caesarEncrypt('There are, as you can see, many punctuations. Right?; Wrong?', 2);
// "Vjgtg ctg, cu aqw ecp ugg, ocpa rwpevwcvkqpu. Tkijv?; Ytqpi?"

```

### Solution:

```javascript
// using character codes
function caesarEncrypt(str, key) {
  var code;
  var base;
  var chars = str.split('');
  var capRolloff = 'Z'.charCodeAt(0);
  var lowRolloff = 'z'.charCodeAt(0);
  var capDiff = 'A'.charCodeAt(0) - 1;
  var lowDiff = 'a'.charCodeAt(0) - 1;

  var encryptedChars = chars.map(function (char) {
     base = char.charCodeAt(0) + key;
    if (/[^a-z]/i.test(char)) {
      return char;
    } else if (/[A-Z]/.test(char)) {
       code = base <= capRolloff ? base : (base % capRolloff) + capDiff;
    } else {
       code = base <= lowRolloff ? base : (base % lowRolloff) + lowDiff;
    }

    return String.fromCharCode(code);
  });

  return encryptedChars.join('');
}

// using an alpha string as reference
function caesarEncrypt(str, key) {
  var alpha = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  var chars = str.split('');

  var encryptedChars = chars.map(function (char) {
    cipherIdx = (alpha.indexOf(char.toUpperCase()) + key) % 26;

    if (/[^a-z]/i.test(char)) {
      return char;
    } else if (/[A-Z]/.test(char)) {
      return alpha[cipherIdx] ;
    } else {
      return alpha[cipherIdx].toLowerCase();
    }
  });

  return encryptedChars.join('');
}
```

## Problem:

The Vigenere Cipher encrypts alphabetic text using polyalphabetic substitution. It uses a series of Caesar Ciphers based on the letters of a keyword. Each letter of the keyword is treated as a shift value. For instance, the letter 'B' corresponds to a shift value of 1, and the letter 'd' corresponds to a shift value of 3. In other words, the shift value used for a letter is equal to its index value in the alphabet. This means that the letters 'a'-'z' are equivalent to the numbers 0-25. The uppercase letters 'A'-'Z' are also equivalent to 0-25.

Applying the Vigenere Cipher is done sequentially for each character by applying the current shift value to a Caesar Cipher for that particular character. To make this more concrete, let's look at the following example:

plaintext: Pineapples don't go on pizzas!
keyword: meat

Applying the Vigenere Cipher for each alphabetic character:
plaintext : Pine appl esdo ntgo onpi zzas
shift     : meat meat meat meat meat meat
ciphertext: Bmnx mtpe qwdh zxgh arpb ldal

result: Bmnxmtpeqw dhz'x gh ar pbldal!

Notice that in the example, the key isn't moved forward if the character isn't in the alphabet. Like the Caesar Cipher, the Vigenere Cipher only encrypts alphabetic characters.

Write a function that implements the Vigenere Cipher. The case of the keyword doesn't matter—in other words, the resulting encryption won't change depending on the case of the keyword's letters (e.g., 'MEat' === 'mEaT').





### Solution:
```javascript
var alpha = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

function caesarEncrypt(char, key) {
  var cipherIdx = (alpha.indexOf(char.toUpperCase()) + key) % 26;

  if (/[^a-z]/i.test(char)) {
    return char;
  } else if (/[A-Z]/.test(char)) {
    return alpha[cipherIdx] ;
  } else {
    return alpha[cipherIdx].toLowerCase();
  }
}

function vigenereEncrypt(plaintxt, keyword) {
  var keyIdx = 0;
  var cipherTxt = '';
  var keys = keyword.split('').map(function (char) {
    return alpha.indexOf(char.toUpperCase());
  });
  var chars = plaintxt.split('');

  chars.forEach(function (char) {
    if (/[^a-z]/i.test(char)) {
      cipherTxt += char;
    } else {
      cipherTxt += caesarEncrypt(char, nextKey());
    }
  });

  function nextKey() {
    var end = keys.length - 1;
    var next = keys[keyIdx];

    keyIdx = keyIdx >= end ? 0 : keyIdx + 1;
    return next;
  }

  return cipherTxt;
}

var text = 'Pineapples don\'t go on pizzas!';

console.log(vigenereEncrypt(text, 'meat'));// Bmnxmtpeqw dhz'x gh ar pbldal!
console.log(vigenereEncrypt(text, 'A'));
console.log(vigenereEncrypt(text, 'Aa'));
console.log(vigenereEncrypt(text, 'cab'));// Riogaqrlfu dpp't hq oo riabat!

```

## Problem:

Write a function that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the function. The smallest such star you need to handle is a 7x7 grid (i.e., when n is 7).

Examples:

```javascript
star(7);
/* logs
*  *  *
 * * *
  ***
*******
  ***
 * * *
*  *  *
*/

star(9);
/* logs
*   *   *
 *  *  *
  * * *
   ***
*********
   ***
  * * *
 *  *  *
*   *   *
*/
```

### Solution:

```javascript
function star(n) {
  var row;
  var char;
  var line;
  var pattern = [];
  var midpoint = Math.floor(n / 2);

  for (row = 0; row < midpoint; row += 1) {
    line = '';
    for (char = 0; char < n; char += 1) {
      if (char === row  || char === (n - (row + 1)) || char === midpoint) {
        line += '*';
      } else {
        line += ' ';
      }
    }
    pattern.push(line);
  }

  pattern.push('*'.repeat(n));

  pattern = pattern.concat(pattern.slice(0, -1).reverse());

  pattern.forEach(function (line) {console.log(line)});
}

console.log(star(7));
/* logs
*  *  *
 * * *
  ***
*******
  ***
 * * *
*  *  *
*/

console.log(star(9));
/* logs
*   *   *
 *  *  *
  * * *
   ***
*********
   ***
  * * *
 *  *  *
*   *   *
*/
```
