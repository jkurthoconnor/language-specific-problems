$(document).ready(function() {

  var randomWord = (function() {
    var wordList = ['apple', 'banana', 'orange', 'pear'];

    return function() {
      var length = wordList.length;
      var randomIdx = Math.floor(Math.random() * length);
      var word = wordList.splice(randomIdx, 1)[0];

      return word;
    };
  })();  




});
