## Problem:
 Complete the method/function so that it converts 
 dash/underscore delimited words into camel casing. 
 The first word within the output should be capitalized 
 only if the original word was capitalized. 
function toCamelCase(str) {

}

 in: string
 out: camelCased string
```javascript
console.log(toCamelCase("")); // ""
console.log(toCamelCase("A-B-C")); // "ABC"
console.log(toCamelCase("the-stealth-warrior")); // "theStealthWarrior"
console.log(toCamelCase("The_Stealth_Warrior")); //
console.log(toCamelCase("thIs_WoRd_is_WeIRD")); // "thisWordIsWeird
```
### Solution:
```javascript
function toCamelCase(str) {
  if (str === '') {
    return str;
  }

  var words = str.split(/[_\-]/).filter(function (ele) {
    return ele !== '';
  });

  return words.map(function (word, idx) {
    if (idx === 0) {
      return word[0] + word.slice(1).toLowerCase();
    } else {
      return word[0].toUpperCase() + word.slice(1).toLowerCase();
    }
  }).join('');
}
```
My PEDAC:
 //in: string
 //out: camelCased string
 //     string of words with no spaces;
 //     the initial letter of each word is caps
 //     but all subsequent letters of words are lower
 //       ** exception: first word initial letter remains
 //       in whatever case it was given in input
 // data: array of words (minus separators)
 // algorithm: 
 //     - declare and init `word` array (split at separator)
 //     - map:
 //       - if word is first in array, initial letter
 //       remains as input, rest of word is downcased
 //       - else, initial letter is upcased, rest of word is downcased
 //     - return mapped result joined
 An IP address is a numerical label assigned to each 
 device (e.g., computer, printer) participating in a 
 computer network that uses the Internet Protocol for 
 communication. There are two versions of the Internet 
 protocol, and thus two versions of addresses. One of 
 them is the IPv4 address.

## Problem:
 IPv4 addresses are represented in dot-decimal notation, 
 which consists of four decimal numbers, each ranging 
 from 0 to 255 inclusive, separated by dots, e.g., 172.16.254.1.

 Given a string, find out if it satisfies the IPv4 address naming 
 rules. 

```javascript
console.log(isIPv4Address("172.16.254.1")); // => true
console.log(isIPv4Address("172.316.254.1")); // => false
console.log(isIPv4Address(".254.255.0")); // => false
console.log(isIPv4Address("a0.1.1.1")); // => false 
```
### Solution:
 in: string (potential ipv4 address)
 out: boolean (input is valid ipv4)
 
   valid ipv4:
     - 4 decimal numbers from 0 to 255 inclusive
     - separated by dots
 data: 
   input string
   regex object for ipv4
   array of number/strings
 algorithm:
   declare and initialize regexp `/^(\d{1,3}\.){3}(\d{1,3})$/`
   declare and initialize number/string array
   return false iff test of regexp and string fails
   loop through number array
     - test that num is in proper range
     - return false if not in range
   return true (if all tests pass)

```javascript
function isIPv4Address(addr) {
  var ipv4Pattern = /^(\d{1,3}\.){3}(\d{1,3})$/;
  var ipv4Numbers = addr.split('.');
  var i;
  var num;

  if (!ipv4Pattern.test(addr)) {
    return false;
  }

  for (i = 0; i < 4; i += 1) {
    num = Number(ipv4Numbers[i]);
   if (num < 0 || num > 255) {
     return false;
   }
  }

  return true;
}

console.log(isIPv4Address("172.16.254.1")); // => true
console.log(isIPv4Address("172.316.254.1")); // => false
console.log(isIPv4Address(".254.255.0")); // => false
console.log(isIPv4Address("a0.1.1.1")); // => false 
console.log(isIPv4Address("072.16.254.1.")); // => false
console.log(isIPv4Address("172.16.254.1")); // => true
```
