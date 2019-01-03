// these object factories could have been written to include the vars
// inside the returned objects as properties. This would allow property
// access to balances, transactions, accounts (and would also require
// copious use of `this` in the methods). To prevent this openness,
// and to make such access 'private', the program utilizes closures
//
function makeAccount(accountNum) {
    var balance = 0;// due to closure, the methods for account objects 
                    //returned by this function
    var transactions = [];// have access to these vars current values;
                          //without the 'getter' methods, the values 
                          // would be inaccessible via property or method calls

  return {
    deposit: function (amount) {
      balance += amount;
      transactions.push({type: 'deposit', amount: amount});
      return amount;
    },

    withdraw: function (amount) {
      amount = (balance >= amount) ? amount : balance;
      balance -= amount;
      transactions.push({type: 'withdraw', amount: amount});
      return amount;
    },

    number: function () {
      return accountNum;
    },

    balance: function () {
      return balance;
    },

    transactions: function () {
      return transactions;
    },
  };
}

function makeBank() {
    var accounts = [];

  return {
    openAccount: function () {
      var number = accounts.length + 101;
      var newAccount = makeAccount(number);
      accounts.push(newAccount);
      return newAccount;
    },

    transfer: function (source, destination, amount) {
      amount = source.withdraw(amount);
      destination.deposit(amount);
      return amount;
    },
        
  };
}

var bank = makeBank();

var account = bank.openAccount();
console.log(account.number());
// 101
console.log(account.balance());
// 0
console.log(account.deposit(42));
//42
console.log(account.balance());
//42
console.log(account.withdraw(19));
// 19
console.log(account.balance());
// 23
console.log(account.withdraw(24));
// 23
console.log(account.balance());
// 0
console.log(account.deposit(100));
console.log(account.transactions());
// [ {type: 'withdraw', amount: 23}, ... ]
//

var otherAccount = bank.openAccount();
console.log(otherAccount.balance());
// 0
console.log(otherAccount.number());
// 102

console.log(bank.transfer(account, otherAccount, 10));
console.log(account.balance());
console.log(otherAccount.balance());
