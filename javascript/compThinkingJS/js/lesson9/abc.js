function isBlockWord(word) {
  var availBlocks = [
    ['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'], ['G', 'T'],
    ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'], ['V', 'I'], ['L', 'Y'],
    ['Z', 'M']
  ];

  var cleanWord = word.replace(/[^a-z]/gi, '').toUpperCase();

  if (cleanWord.length === 0) {
    return false;
  }

  for (var i = 0; i < cleanWord.length; i += 1) {
    for (var j = 0; ; j += 1) {
      if (availBlocks[j].includes(cleanWord[i])) {
        availBlocks.splice(j, 1);
        break;
      }

      if (j === availBlocks.length - 1) {
        return false;
      }
    }
  }

  return true;
}

console.log(isBlockWord('BATCH'));      // true
console.log(isBlockWord('BUTCH'));      // false
console.log(isBlockWord('batch'));      // true; case insensitive spelling
console.log(isBlockWord('butch'));      // false; case insensitive spelling
console.log(isBlockWord('jest'));       // true
//
// assume only alphas count in spelling and that no errors will be thrown
// for non-alpha chars
console.log(isBlockWord('je st'));       // true; only alphas count in spelling
console.log(isBlockWord('bu@tch'));       // false; only alphas count in spelling
console.log(isBlockWord('b@tch'));       // true; only alphas count in spelling
//
// assume that since only alphas count, any empty string or string with no 
// alphas will not be spelled with the alpha blocks
console.log(isBlockWord(''));       // false
console.log(isBlockWord('@ ; *'));       // false
//
// assume it is safe to ignore multiple string input; any multi-word passages
// to be tested should appear in a single string
console.log(isBlockWord('batch', 'butch'));       // true; 'butch' ignored
console.log(isBlockWord('butch', 'batch'));       // false; 'batch' ignored
console.log(isBlockWord('jest cab'));       // true
console.log(isBlockWord('jest shelf'));       // false
