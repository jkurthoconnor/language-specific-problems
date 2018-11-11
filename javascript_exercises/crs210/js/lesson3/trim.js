function trim(string) {
  var newString = leftStripV2(string);
  var trimmedString = rightStrip(newString);

  return trimmedString;
}

function leftStrip(string) {
  var leftStripped = '';
  var i;

  for (i = 0; ; i++) {
    if (i === string.length) {
      return '';
    } else if (string[i] !== ' ') {
      break;
    }
  }

  for (j = i; j < string.length; j++) {
    leftStripped += string[j];
  }

  return leftStripped;
}

// leftStripV2 implements algorithm from sample answer
function leftStripV2(string) {
  var i;
  var copyMode = false;
  var leftStripped = '';

  for (i = 0; i < string.length; i++) {
    if (string[i] === ' ' && !copyMode) {
      continue;
    } else if (string[i] === ' ') {
      leftStripped += string[i];
    } else {
      copyMode = true;
      leftStripped += string[i];
    }
  }

  return leftStripped;
}

function rightStrip(string) {
  var rightStripped = '';
  var i;

  for (i = string.length - 1; ; i--) {
    if (i < 0) {
      return '';
    } else if (string[i] !== ' ') {
      break;
    }
  }

  for (j = 0; j <= i; j++) {
    rightStripped += string[j];
  }

  return rightStripped;
}

console.log(leftStrip('   abc'));
console.log(leftStrip('avrl'));
console.log(leftStrip('  a b c  '));
console.log(rightStrip('  a b c  '));
console.log(rightStrip('  a  c  '));
console.log(rightStrip('  a b c  '));

console.log(trim('  abc  '));  // "abc"
console.log(trim('abc   '));   // "abc"
console.log(trim(' ab c'));    // "ab c"
console.log(trim(' a b  c'));  // "a b  c"
console.log(trim('      '));   // ""
console.log(trim(''));         // ""
