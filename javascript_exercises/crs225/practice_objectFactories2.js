// the following code contains needless duplication. Fix it with an object
// factory!
//

/*
var chile = {
  name: 'The Republic of Chile',
  continent: 'South America',
  getDescription: function() {
    return this.name + ' is located in ' + this.continent + '.';
  },
};

var canada = {
  name: 'Canada',
  continent: 'North America',
  getDescription: function() {
    return this.name + ' is located in ' + this.continent + '.';
  },
};

var southAfrica = {
  name: 'The Republic of South Africa',
  continent: 'Africa',
  getDescription: function() {
    return this.name + ' is located in ' + this.continent + '.';
  },
};

*/

function makeCountry(nameVal, continentVal, visitedVal = false) {
  return {
    name: nameVal,
    continent: continentVal,
    visited: visitedVal,
    getDescription: function() {
      var visitPhrase = this.visited ? ' I have visited ' : ' I haven\'t visited ';
      return this.name + ' is located in ' + this.continent + '.' + visitPhrase +
        this.name + '.';
    },
    visitCountry: function() {
      this.visited = true;
    },
  };
}

var chile = makeCountry('The Republic of Chile', 'South America');
var canada = makeCountry('Canada', 'North America');
var southAfrica = makeCountry('The Republic of South Africa', 'Africa');


chile.visitCountry();
console.log(chile.getDescription());       // "The Republic of Chile is located in South America."
console.log(canada.getDescription());      // "Canada is located in North America."
console.log(southAfrica.getDescription()); // "The Republic of South Africa is located in Africa


