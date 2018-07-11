# LS Practice Problems: [Create Objects with Factory Functions]()

## Problem 1:

What are the two disadvantages of working with factory functions?

### Solution:

1. Each object created by a factory will have a complete copy of all the methods. This can be unnecessary.

2. There is no way to tell by inspecting the object that it was produced by a factory, so it can be difficult to identify its type.

## Problem 2 :

Rewrite the code below to use object-literal syntax to generate the returned object:

```javascript
function makeObj() {
  var obj = {};
  obj.propA = 10;
  obj.propB = 20;
  return obj;
}
```

### Solution:

```javascript
function makeObj() {
  return {
    propA: 10,
    propB: 20,
  };
}
```

## Problem 3:

Starter code:
```javascript
var invoice = {
  phone: 3000,
  internet: 6500,
};
var payment = {
  phone: 1300,
  internet: 5500,
};
var invoiceTotal = invoice.phone + invoice.internet;
var paymentTotal = payment.phone + payment.internet;
var remainingDue = invoiceTotal - paymentTotal;

console.log(paymentTotal);         // 6800
console.log(remainingDue);         // 2700
```
Build a factory that can create invoices such that:

    - It returns an invoice object, with phone and internet properties, and a total method.
    - The default value for the phone service is 3000, and the internet service is 5500 (in cents, of course!).
    - The function takes an object argument with attributes to override the default values.

It should work with this code:
```javascript

function createInvoice(services) {
   // implement the factory function here
 }

 function invoiceTotal(invoices) {
   var total = 0;
var i;

   for (i = 0; i < invoices.length; i += 1) {
     total += invoices[i].total();
   }

   return total;
 }

 var invoices = [];
 invoices.push(createInvoice());
 invoices.push(createInvoice({
   internet: 6500,
 }));

 invoices.push(createInvoice({
   phone: 2000,
 }));

 invoices.push(createInvoice({
   phone: 1000,
   internet: 4500,
 }));

 console.log(invoiceTotal(invoices));             // 31000
 
```

### Solution:

```javascript
function createInvoice(services) {
  var phBill = services && services.phone ? services.phone : 3000;
  var netBill = services && services.internet ? services.internet : 5500;
  return {
    phone: phBill,
    internet: netBill,
    total: function () {
      return this.phone + this.internet;
    },
  };
}

// a more communicative version using default parameter and avoiding ternary operator in guard clause

function createInvoice(services = {}) {
  var invoice = {};

  invoice.phone = services.phone || 3000;
  invoice.internet = services.internet || 5500;
  invoice.total = function () {
    return this.phone + this.internet;
  };

  return invoice;
 }
```

## Problem 4:

Now let's build a factory function to create payments. Thefunction can take an `object` argument in one of 3 forms:

    Payment for one service, such as: {internet: 1000} or {phone: 1000}
    Payment for both services, such as: {internet: 2000, phone: 1000}.
    Payment with just an amount property, such as: {amount: 2000}.

and should return an object that has paid services, and a total method that returns the payment total. If the amount property is not present, this should return the sum of phone and internet services; if the amount property is present, just return the value of that property.

Your code should work with the following:
```javascript
 function createPayment(services) {
   // implement the factory function here
 }

 function paymentTotal(payments) {
   var total = 0;
var i;

   for (i = 0; i < payments.length; i += 1) {
     total += payments[i].total();
   }

   return total;
 }

 var payments = [];
 payments.push(createPayment());
 payments.push(createPayment({
   internet: 6500,
 }));

 payments.push(createPayment({
   phone: 2000,
 }));

 payments.push(createPayment({
   phone: 1000,
internet: 4500,
 }));

 payments.push(createPayment({
   amount: 10000,
 }));

 console.log(paymentTotal(payments));      // 24000
```

### Solution:

```javascript
function createPayment(services) {
  var services = services || {};

  return {
    internet: services.internet || 0,
    phone: services.phone || 0,
    amount: services.amount || 0,
    total: function () {
      return this.amount || this.phone + this.internet; // if amount: 0 is passed
     },                                                 // in, then method won't
  };                                                    // return it; that doesn't
}                                                       // meet explicit requirement

// or, to meet the explicit requirement for `total` to return the value of `amount`
// if one is provided in the argument:

function createPayment(services = {}) {
  var payment = {};

  payment.phone = services.phone || 0;
  payment.internet = services.internet || 0;
  payment.amount = services.amount;
  payment.total = function () {
    if (this.amount !== undefined) {
      return this.amount;
    } else {
      return this.phone + this.internet;
    }
  };

  return payment;
}
```

## Problem 5:

Update `createInvoice` function to make it possible to add payment(s) to invoices. Use the following code as a guideline:

```javascript
var invoice = createInvoice({
  phone: 1200,
  internet: 4000,
});

var payment1 = createPayment({
  amount: 2000
});

var payment2 = createPayment({
  phone: 1000,
  internet: 1200,
});

var payment3 = createPayment({
  phone: 1000,
});

invoice.addPayment(payment1);
invoice.addPayments([payment2, payment3]);
invoice.amountDue();       // this should return 0
```

### Solution:

```javascript
function createInvoice(services) {
  var services = services || {};

  return {
    payments: [],
    phone: services.phone || 3000,
    internet: services.internet || 5500,

    total: function () {
      return this.phone + this.internet;
    },

    addPayment: function(payment) {
      this.payments.push(payment);
    },

    addPayments: function (paymentSet) {
      this.payments = this.payments.concat(paymentSet);
    },

    amountDue: function () {
      var totalPayments = 0;

      this.payments.forEach(function (payment) {
        Object.keys(payment).forEach(function (key) {
          if (typeof payment[key] === 'number') {
            totalPayments += payment[key];
          }
        });
      });

      return this.total() - totalPayments;
    },
   };
}

// or, with a cleaner implementation of `amountDue` by calling existing method and function:
function createInvoice(services = {}) {
  var invoice = {};

  invoice.phone = services.phone || 3000;
  invoice.internet = services.internet || 5500;
  invoice.total = function () {
    return this.phone + this.internet;
  };
  invoice.payments = []; 
  invoice.addPayment = function(payment) {
    this.payments.push(payment); 
  };
  invoice.addPayments = function(payments) {
    this.payments = this.payments.concat(payments);
  };
  invoice.amountDue = function () {
    return this.total() - paymentTotal(this.payments);
  };

  return invoice;
 }
```


