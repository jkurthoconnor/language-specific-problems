function Vehicle() {}

Vehicle.prototype.doors = 4;
Vehicle.prototype.wheels = 4;

var sedan = new Vehicle();
var coupe = new Vehicle();

coupe.doors = 2;

console.log(sedan.hasOwnProperty('doors'));
console.log(coupe.hasOwnProperty('doors'));

function Coupe() {}

Coupe.prototype = new Vehicle();
Coupe.prototype.doors = 2;
Coupe.prototype.constructor = Coupe;

function Motorcycle() {}

Motorcycle.prototype = new Vehicle();
Motorcycle.prototype.wheels = 2;
Motorcycle.prototype.doors = 0;
Motorcycle.prototype.constructor = Motorcycle;

function Sedan() {}

Sedan.prototype = Object.create(Vehicle.prototype);
Sedan.prototype.constructor = Sedan;

var myCoupe = new Coupe();
var myMotorcycle = new Motorcycle();
var mySedan = new Sedan();

console.log(myCoupe instanceof Coupe);
console.log(myCoupe instanceof Vehicle);
console.log(myCoupe instanceof Motorcycle);
console.log(myMotorcycle instanceof Motorcycle);
console.log(mySedan instanceof Sedan);
console.log(mySedan instanceof Vehicle);
console.log(myCoupe.constructor);
console.log(myMotorcycle.constructor);
console.log(mySedan.constructor);

console.log(myCoupe);
console.log(myMotorcycle);
console.log(mySedan);



