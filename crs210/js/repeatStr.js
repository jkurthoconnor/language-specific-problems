function repeat(string, number) {
  var count = 1;
  var toLog = '';

  if (typeof(number) !== 'number' || number < 0) {
    return undefined;
  }

  while (count <= number) {
    toLog += string;
    count++;
  }

  return toLog;
}


console.log(repeat('abc', 1));       // "abc"
console.log(repeat('abc', 2));       // "abcabc"
console.log(repeat('abc', -1));      // undefined
console.log(repeat('abc', 0));       // ""
console.log(repeat('abc', 'a'));     // undefined
console.log(repeat('abc', false));   // undefined
console.log(repeat('abc', null));    // undefined
console.log(repeat('abc', '  '));    // undefined
