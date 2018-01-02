function toLowerCase(string) {
  var converted = '';
  var i;
  var code;

  for (i = 0; i < string.length; i++) {
    code = string.charCodeAt(i);
    converted += String.fromCharCode(code + 32);
  }

  return converted;
}


console.log(toLowerCase('ALPHABET'));    // "alphabet"
console.log(toLowerCase('123'));         // "123"
console.log(toLowerCase('abcDEF'));      // "abcdef"
