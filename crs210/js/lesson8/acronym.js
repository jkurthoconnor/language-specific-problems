// using `split` regex to 'drop' hyphens to normalize data
//
function acronym(string) {
  return string.split(/\W+/).map(function (word) {
    return word[0].toUpperCase();
  }).join('');
}
/* solution with separate use of `replace` to normalize
  string prior to splitting

function acronym(string) {
  return string.replace('-', ' ').split(' ').map(function (word) {
    return word[0].toUpperCase();
  }).join('');
}
*/

console.log(acronym('Portable Network Graphics'));                  // "PNG"
console.log(acronym('First In, First Out'));                        // "FIFO"
console.log(acronym('PHP: HyperText Preprocessor'));                // "PHP"
console.log(acronym('Complementary metal-oxide semiconductor'));    // "CMOS"
console.log(acronym('Hyper-text Markup Language'));                 // "HTML"

