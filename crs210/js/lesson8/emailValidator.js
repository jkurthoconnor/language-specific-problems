/*
function isValidEmail(email) {
  var local = '^[0-9a-z]+';
  var domain = '[a-z]+(\\.[a-z]+)+$'; // NB: need to escape the `\` so it appears
                                      // after running through the string parser
  var validEmail = new RegExp(local + '@' + domain, 'i');

  return validEmail.test(email);
}
*/

function isValidEmail(email) {
  var emailPattern = new RegExp('^[a-z\\d]+@([a-z]+\\.)+[a-z]+$', 'i');
  return emailPattern.test(email);
}

console.log(isValidEmail('Foo@baz.com.ph'));          // returns true
console.log(isValidEmail('Foo@mx.baz.com.ph'));       // returns true
console.log(isValidEmail('foo@baz.com'));             // returns true
console.log(isValidEmail('foo@baz.ph'));              // returns true
console.log(isValidEmail('HELLO123@baz'));            // returns false
console.log(isValidEmail('foo.bar@baz.to'));          // returns false
console.log(isValidEmail('foo@baz.'));                // returns false
console.log(isValidEmail('foo_bat@baz'));             // returns false
console.log(isValidEmail('foo@bar.a12'));             // returns false
console.log(isValidEmail('foo_bar@baz.com'));         // returns false
console.log(isValidEmail('foo@bar.....com'));         // returns false

console.log(isValidEmail('foo@baz@com'));                // returns false
console.log(isValidEmail('foo@'));                // returns false
