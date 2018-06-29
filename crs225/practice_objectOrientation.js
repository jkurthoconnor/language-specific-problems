// this attempt at keeping track of a store's inventory
// presents problems: e.g. what if we want to add other
// types drills or scissors?
//
// How can we use objects to organize these two groups of data?
/*
var scissorsId = 0;
var scissorsName = 'Scissors';
var scissorsStock = 8;
var scissorsPrice = 10;

var drillId = 1;
var drillName = 'Cordless Drill';
var drillStock = 15;
var drillPrice = 45;
*/

// Solution:
//
function createProduct(idNum, itemName, numInStock, salesPrice) {
  return {
    name: itemName,
    id: idNum,
    price: salesPrice,
    stock: numInStock,
    setPrice: function(itemPrice) {
      if (itemPrice > 0) {
      this.price = itemPrice;
      } else {
        alert('Invalid price.');
      }
    },
    describe: function() {
      console.log('Name: ' + this.name);
      console.log('ID: ' + String(this.id));
      console.log('Price: $' + (this.price).toFixed(2));
      console.log('Stock: ' + String(this.stock));
    },
  };
}


var scissors = createProduct(0, 'Scissors', 8, 10); 
var cordlessDrill = createProduct(1, 'Cordless Drill', 15, 45); 
var drill = createProduct(2, 'Drill', 30, 25); 
var tape = createProduct(3, 'Tape', 100, 1.50); 
console.log(scissors);
console.log(cordlessDrill);
scissors.setPrice(100);
scissors.describe();
drill.setPrice(14);
drill.describe();
tape.describe();
