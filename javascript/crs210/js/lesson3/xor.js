function isXor(value1, value2) {
  var bool1 = !!(value1);
  var bool2 = !!(value2);

  return (bool1 || bool2) && !(bool1 && bool2);
}

console.log(isXor(false, true));     // true
console.log(isXor(true, false));     // true
console.log(isXor(false, false));    // false
console.log(isXor(true, true));      // false


console.log(isXor(false, 3));        // true
console.log(isXor('a', undefined));  // true
console.log(isXor(null, ''));        // false
console.log(isXor('2', 23));         // false
