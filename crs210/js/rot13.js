function rot13(string) {
  var i;
  var charCode;
  var rotCharCode;
  var translation = '';

  function inFirstHalfAlpha(code) {
    return (code >= 97 && code <= 109) || (code >= 65 && code <= 77);
  }

  function inLastHalfAlpha(code) {
    return  (code >= 110 && code <= 122) || (code >= 78 && code <= 90);
  }

  if (typeof string !== 'string') {
    return 'ERROR: This program only encrypts strings.';
  }

  for (i = 0; i < string.length; i++) {
    charCode = string.charCodeAt(i);

    if (inFirstHalfAlpha(charCode)) {
      rotCharCode = charCode + 13;
    } else if (inLastHalfAlpha(charCode)) {
      rotCharCode = charCode - 13;
    } else {
      rotCharCode = charCode;
    }

    translation += String.fromCharCode(rotCharCode);
  }

  return translation;
}


console.log(rot13('Teachers open the door, but you must enter by yourself.'));
// Grnpuref bcra gur qbbe, ohg lbh zhfg ragre ol lbhefrys.

console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')));
// Teachers open the door, but you must enter by yourself.

console.log(rot13(12));
