/* building a RegExp by concatenating str representations of the pattern 
  NB: `\` must be escaped to survive the string parser

function isValidEmail(email) {
  var local = '^[0-9a-z]+';
  var domain = '[a-z]+(\\.[a-z]+)+$';
  var validEmail = new RegExp(local + '@' + domain, 'i');

  return validEmail.test(email);
}
*/

//more direct use of RegExp constructor
//
//var emailPattern = new RegExp('^[a-z\\d]+@([a-z]+\\.)+[a-z]+$', 'i');


function isValidEmail(email) {
  var emailPattern = /^[a-z0-9]+@[a-z]+(\.[a-z]+)+$/i;
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
console.log(isValidEmail('foo@bar.com@my.mail.com'));         // returns false
console.log(isValidEmail(''));         // returns false
