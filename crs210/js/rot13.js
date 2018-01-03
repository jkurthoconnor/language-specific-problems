function rot13(string) {
  var i;
  var code;
  var rotCode;
  var translation = '';

  if (typeof string !== 'string') {
    return 'ERROR: This program only encrypts strings.';
  }

  for (i = 0; i < string.length; i++) {
    code = string.charCodeAt(i);

    if ((code >= 97 && code <= 109) || (code >= 65 && code <= 77)) {
      rotCode = code + 13;
    } else if ((code >= 110 && code <= 122) || (code >= 78 && code <= 90)) {
      rotCode = code - 13;
    } else {
      rotCode = code;
    }

    translation += String.fromCharCode(rotCode);
  }

  return translation;
}


console.log(rot13('Teachers open the door, but you must enter by yourself.'));
// Grnpuref bcra gur qbbe, ohg lbh zhfg ragre ol lbhefrys.

console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')));
// Teachers open the door, but you must enter by yourself.

console.log(rot13(12));
