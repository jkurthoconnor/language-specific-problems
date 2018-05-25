function acronym(string) {
  var cleanStr;

  if (!string) {
    return  'ERROR: no acronym possible.';
  }

  cleanStr = string.replace(/-/g, ' ');

  return cleanStr.split(/\s+/).map(function (word) {
    return word[0].toUpperCase();
  }).join('');
}


console.log(acronym('Portable Network Graphics'));                  // "PNG"
console.log(acronym('First In, First Out'));                        // "FIFO"
console.log(acronym('PHP: HyperText Preprocessor'));                // "PHP"
console.log(acronym('Complementary metal-oxide semiconductor'));    // "CMOS"
console.log(acronym('Hyper-text Markup Language'));                 // "HTML"
console.log(acronym('Gnu\'s not Unix'));                 // "GNU"
console.log(acronym(''));                 // should present an error message
console.log(acronym('Hyper- text Markup-Language'));                 // "HTML"
