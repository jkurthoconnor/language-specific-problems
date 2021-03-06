function substring(string, start, end) {
var subString = '';
var i;

  function swapValues() {
    var holder;

    holder = start;
    start = end;
    end = holder;
  }

  if (end === undefined) {
    end = string.length;
  }

  if (start < 0 || isNaN(start)) {
    start = 0;
  }

  if (end < 0 || isNaN(end)) {
    end = 0;
  }

  if (start > string.length) { 
    start = string.length;
  }

  if (end > string.length) { 
    end = string.length;
  }

  if (start > end) {
    swapValues();
  } 

  for (i = start; i < end; i++) {
    subString += string[i];
  }


  return subString;
}





var string = 'hello world';

console.log(substring(string, 2, 4));    // "ll"
console.log(substring(string, 4, 2));    // "ll"
console.log(substring(string, 0, -1));   // ""
console.log(substring(string, 2));       // "llo world"
console.log(substring(string, 'a'));     // "hello world"
console.log(substring(string, 8, 20));   // "rld"

