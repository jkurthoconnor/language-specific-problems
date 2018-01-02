function splitString(string, delimiter) {
  var i;
  var toLog = '';
  var errorMsg = 'ERROR: No delimiter';

  switch (delimiter) {
    case undefined:
      return console.log(errorMsg);
    case '':
      for (i = 0; i < string.length; i++) {
        console.log(string[i]);
      }
      return;
  }

  for (i = 0; i < string.length; i++) {
    if (string[i] === delimiter) {
      console.log(toLog);
      toLog = '';
    } else {
      toLog += string[i];
    }
  }

  if (toLog !== '') {
    console.log(toLog);
  }
}

splitString('abc,123,hello world', ',');
// logs:
// abc
// 123
// hello world

splitString('hello');
// logs:
// ERROR: No delimiter

splitString('hello', '');
// logs:
// h
// e
// l
// l
// o

splitString('hello', ';');
// logs:
// hello

splitString(';hello;', ';');
// logs:
//  (this is a blank line)
// hello
