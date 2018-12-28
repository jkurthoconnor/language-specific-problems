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
  var words = str.split(/[-_]/).filter(function (word) { return word !== ''});
  if (str === '') {
    return str;
  }

  return words.map(function (word, place) {
    var initial = word[0];
    var tail = word.slice(1).toLowerCase();

    if (place === 0) {
      return initial + tail;
    } else {
      return initial.toUpperCase() + tail;
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
function isIPv4Address(address) {
  var ipv4Pattern = new RegExp('^(\\d{1,3}\\.){3}(\\d{1,3})$');

  if (!ipv4Pattern.test(address)) return false;

  var subAddresses = address.split(/\./);

  return subAddresses.every(function (sub) {
    var value = Number(sub);
    return value >= 0 && value <= 255;
  });
}

console.log(isIPv4Address("172.16.254.1")); // => true
console.log(isIPv4Address("172.316.254.1")); // => false
console.log(isIPv4Address(".254.255.0")); // => false
console.log(isIPv4Address("a0.1.1.1")); // => false 
console.log(isIPv4Address("072.16.254.1.")); // => false
console.log(isIPv4Address("172.16.254.1")); // => true
```
