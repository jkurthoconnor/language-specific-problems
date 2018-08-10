$(document).ready(function() {

  var thisGame;
  var $body = $('body');
  var $message = $('#message');
  var $spaces = $('#spaces');
  var $guesses = $('#guesses');
  var $apples = $('#apples');

  function startNewGame() {
    $body.removeClass();
    $apples.removeClass();
    $spaces.find('span').remove();
    $guesses.find('span').remove();

    $body.on('keypress', function(e) {
      if (e.keyCode >= 97 && e.keyCode <= 122) {
        thisGame.showNewGuess(e.key);

        if (thisGame.word.includes(e.key)) {
          thisGame.handleCorrectGuess(e.key, thisGame.getIdx(e.key));
        } else {
          thisGame.handleWrongGuess(e.key);
        }

        thisGame.evaluatePlay();
      }
    });

    $('#replay').on('click', function(e) {
      e.preventDefault();
      thisGame = startNewGame();
    });

    return Object.create(Game).init();
  }

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

    showNewGuess: function(char) {
      $guesses.append($('<span>' + char + '</span>'));
    },

    getIdx: function(char) {
      return this.word.split('').map(function(letter, idx) {
        return [idx, letter];
      }).filter(function(pair) {
        return pair[1] === char;
      }).map(function(pair) {
        return pair[0];
      });
    },

    handleCorrectGuess: function(char, indices) {
      this.guesses.push(char);

      indices.forEach(function(idx) {
        $spaces.find('span').eq(idx).text(char);
      });
    },

    handleWrongGuess: function(char) {
      if (!this.guesses.includes(char)) {
        this.wrongGuesses += 1;
        this.guesses.push(char);
        $apples.removeClass().addClass('guess_' + this.wrongGuesses);
      }
    },

    evaluatePlay: function() {
      var gameWon = $spaces.find('span').text() === this.word;

      if (gameWon) {
        this.showMessage('You Won! Click below to play again.');
        $body.addClass('win');
        $body.off('keypress');
      }

      if (this.wrongGuesses === this.maxWrongGuesses) {
        this.showMessage('Game Over. Click below to play again.');
        $body.addClass('lose');
        $body.off('keypress');
      }
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

  thisGame = startNewGame();
});
