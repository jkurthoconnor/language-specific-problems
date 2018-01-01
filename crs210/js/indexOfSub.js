function indexOf(firstString, secondString) {
  var i;
  var j;
  var sourceIdx;
  var viableLength = firstString.length - secondString.length;

  for (i = 0; i <= viableLength; i++) {
    sourceIdx = 0;

    if (firstString[i] === secondString[sourceIdx]) {

      for (j = i + 1; ; j++) {
        if (sourceIdx >= secondString.length - 1) {
          return i;
        }

        sourceIdx++;

        if (firstString[j] !== secondString[sourceIdx]) {
          break;
        }
      } 
    }
  }
  return -1;
}

function lastIndexOf(firstString, secondString) {
  var i;
  var j;
  var sourceIdx;
  var viableLength = firstString.length - secondString.length;

  for (i = viableLength; i >= 0; i--) {
    sourceIdx = 0;

    if (firstString[i] === secondString[sourceIdx]) {

      for (j = i + 1; ; j++) {
        if (sourceIdx >= secondString.length - 1) {
          return i;
        }

        sourceIdx++;

        if (firstString[j] !== secondString[sourceIdx]) {
          break;
        }
      } 
    }
  }
  return -1;
}

console.log(indexOf('Some strings', 's'));                      // 5
console.log(indexOf('Blue Whale', 'Whale'));                    // 5
console.log(indexOf('Blue Whale', 'Blute'));                    // -1
console.log(indexOf('Blue Whale', 'leB'));                      // -1
console.log(indexOf('Blue Whale', '^'));                      // -1

console.log(lastIndexOf('Some strings', 's'));                  // 11
console.log(lastIndexOf('Blue Whale, Killer Whale', 'Whale'));  // 19
console.log(lastIndexOf('Blue Whale, Killer Whale', 'all'));    // -1
