function greetings(names, credentials) {
  var fullName = names.join(' ');
  var fullTitle = credentials.title + ' ' + credentials.occupation;
  var message = 'Greetings ' + fullName + '!' + ' Nice to have a ' +
                fullTitle + ' around.';

  console.log(message);
}

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber'} );
