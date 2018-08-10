$(document).ready(function() {

  var $message = $('#message');
  var $spaces = $('#spaces');
  var $guesses = $('#guesses');
  var $apples = $('#apples');

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
    maxWrongGuesses: 6,

    showSpaces: function(word) {
      var i;

      if (!word) { return };
      $('#spaces > span').remove();

      for (i = 1; i <= word.length; i += 1) {
        $spaces.append($('<span>'));
      }
    },

    showMessage: function(newMessage) {
      $message.text(newMessage);
    },

    init: function() {
      this.word = randomWord();
      this.message = this.word ? 'Play!' : 'Sorry, out of words!';
      this.guesses = [];
      this.wrongGuesses = 0;
      this.showMessage(this.message);
      this.showSpaces(this.word);

      return this;
    },
  };



  var game1 = Object.create(Game).init();
  console.log(game1.word);
  console.log(game1.message);
  var game2 = Object.create(Game).init();
  console.log(game2.word);
  game1.guesses.push(1);
  console.log(game1.guesses);
  console.log(game2.guesses);
  var game3 = Object.create(Game).init();
  console.log(game3.word);
  var game4 = Object.create(Game).init();
  console.log(game4.word);
  console.log(game1.word);

});
