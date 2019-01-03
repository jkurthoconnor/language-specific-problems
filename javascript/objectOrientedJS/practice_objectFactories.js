// functions as object factories

var stroller = {
  speed: 0,
  rate: 1,
  accelerate: function() {
    this.speed += this.rate; // `this` when associated with method invokation
  },                        // evaluates to the object; (context is set at
};                          // execution)
 

var tricycle = {
  speed: 0,
  rate: .25,
  accelerate: function() {
    this.speed += this.rate;
  },
};

// there is code duplication in the objects above
// one way to address this is to move similarities
// to one location and set the differences when
// objects are defined:

function makeCar(accelRate, brakeRate) {  // this function is an object factory
  return {
    speed: 0,
    decelerate: brakeRate,
    rate: accelRate,
    accelerate: function() {
      this.speed += this.rate;
    },
    brake: function() {
      this.speed -= this.decelerate;

      if (this.speed < 0) {
        this.speed = 0;
      }
    },
  };
}

var sedan = makeCar(8, 6);
sedan.accelerate();
console.log(sedan.speed);
sedan.brake();
console.log(sedan.speed);


var coupe = makeCar(12, 8);
coupe.accelerate();
console.log(coupe.speed);
coupe.brake();
console.log(coupe.speed);

var hatchback = makeCar(9, 7);
hatchback.accelerate();
console.log(hatchback.speed);
hatchback.brake();
console.log(hatchback.speed);
hatchback.brake();
console.log(hatchback.speed);
hatchback.brake();
console.log(hatchback.speed);


