function substr(string, start, length) {
  var i;
  var subString = '';
  var startIdx;
  var stopIdx;

  startIdx = start >= 0 ? start : string.length + start;
  stopIdx = (length + startIdx) - 1;

  for (i = startIdx; i <= stopIdx; i++) {
    if (i >= string.length) {
      break;
    }
    subString += string[i];
  }

  return subString;
}


var string = 'hello world';

console.log(substr(string, 2, 4));      // "llo "
console.log(substr(string, -3, 2));     // "rl"
console.log(substr(string, 8, 20));     // "rld"
console.log(substr(string, 0, -20));    // ""
console.log(substr(string, 0, 0));      // ""
