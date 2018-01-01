function indexOf(firstString, secondString) {
  var i;
  var j;
  var initialMatch;

  //  find initial match
  for (i = 0; i < secondString.length; i++) {
    for (j = 0; j < firstString.length ; j++) {

      if (firstString[j] === secondString[i]) {
        initialMatch = j;
      }
    }
  }
  //  search for subsequent matches

  // loop chars of first
  // until find initial match of char in first and second[0]
  // compare first[match + 1] with second[1]
  // if ===, then compare first[match + 2 with second[2]
  // else continue with search for initial match
  return initialMatch || -1;
}

function lastIndexOf(firstString, secondString) {

}

console.log(indexOf('Some strings', 's'));                      // 5
console.log(indexOf('Blue Whale', 'Whale'));                    // 5
console.log(indexOf('Blue Whale', 'Blute'));                    // -1
console.log(indexOf('Blue Whale', 'leB'));                      // -1
console.log(indexOf('Blue Whale', '^'));                      // -1

// lastIndexOf('Some strings', 's');                  // 11
// lastIndexOf('Blue Whale, Killer Whale', 'Whale');  // 19
// lastIndexOf('Blue Whale, Killer Whale', 'all');    // -1
