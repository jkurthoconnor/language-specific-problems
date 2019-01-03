function repeatedCharacters(string) {
  var count = {};
  var i;
  var character;
  var letters;
  var lowerCsString = string.toLowerCase();

  for (i = 0; i < lowerCsString.length; i++) {
    character = lowerCsString[i];
    if (character in count) {
      count[character] += 1;
      } else {
        count[character] = 1;
    }
  }

  letters = Object.keys(count);
  for (i = 0; i < letters.length; i++) {
    if (count[letters[i]] < 2) {
      delete count[letters[i]];
    }
  }

  return count;
}

console.log(repeatedCharacters('Programming'));    // { r: 2, g: 2, m: 2 }
console.log(repeatedCharacters('Combination'));    // { o: 2, i: 2, n: 2 }
console.log(repeatedCharacters('Pet'));            // {}
console.log(repeatedCharacters('Paper'));          // { p: 2 }
console.log(repeatedCharacters('Baseless'));       // { s: 3, e: 2 }
