function isBlockWord(word) {
  var i;
  var j;
  var pattern;
  var blocks = {
    'BO': true,
    'XK': true,
    'DQ': true,
    'CP': true,
    'NA': true,
    'GT': true,
    'RE': true,
    'FS': true,
    'JW': true,
    'HW': true,
    'VI': true,
    'LY': true,
    'ZM': true,
  };
  var keys = Object.keys(blocks);

  word = word.replace(/[^a-z]/ig, '');
  for (i = 0; i < word.length; i += 1) {
    pattern = new RegExp(word[i], 'i');

    for (j = 0; ; j += 1) {
      if (j === keys.length) {
        return false;
      }

      if (blocks[keys[j]] && pattern.test(keys[j])) {
        blocks[keys[j]] = false;
        break;
      }
    }
  }
  return true;
}
console.log(isBlockWord('BATCH')); // true
console.log(isBlockWord('batch'));// true
console.log(isBlockWord('jest')); // true
console.log(isBlockWord('butter')); // false
console.log(isBlockWord('BUTTER'));// false
console.log(isBlockWord('j\'est')); // true
console.log(isBlockWord('abcdefghijklmnopqrstuvwxyz')); // false
