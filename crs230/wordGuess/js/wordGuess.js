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

  var Game = {
    word:  '',
    wrongGuesses: 0,
    guesses: [],
    maxWrongGuesses: 6,
    message: '',
    makeSpaces: function(n) {
      var i;
      for (i = 1; i <= n; i += 1) {
        $('#spaces > h2').append($('<span>'));
      }
    },

    init: function() {
      this.word = randomWord();
      this.message = this.word ? 'Time to Play!' : 'Sorry, out of words!';
      $('#message').text(this.message);
      this.makeSpaces(this.word.length);
      return this;
    },
  };



  var game1 = Object.create(Game).init();
  console.log(game1.word);
  console.log(game1.message);
  /*
  var game2 = Object.create(Game).init();
  console.log(game2.word);
  var game3 = Object.create(Game).init();
  console.log(game3.word);
  var game4 = Object.create(Game).init();
  console.log(game4.word);
  var game5 = Object.create(Game).init();
  console.log(game5.word);
  console.log(game5.message);
*/

});
