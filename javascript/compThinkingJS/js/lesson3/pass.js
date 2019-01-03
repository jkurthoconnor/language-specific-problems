function checkPassword() {
  var guess;
  var message;
  var i;
  var PASSWORD = 'wrong';

  for (i = 0; i <= 2; i++) {
    guess = prompt('What is the password?');
    if (guess === PASSWORD) {
      break;
    }
  }

  message = i < 3 ? 'You have logged in.' : 'You have been denied access';

  console.log(message);
}

checkPassword();

