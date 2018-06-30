# LS Practice: [What is this (2)](https://launchschool.com/lessons/c9200ad2/assignments/7bef6908)

## Problem 1:

What does this point to in the code below, and what does the method return?

```javascript
var myObject = {
  count: 1,
  myChildObject: {
    myMethod: function() {
      return this.count;
    },
  },
};

myObject.myChildObject.myMethod();{
}
```

### Solution:

`this` points to `myChildObject`, because that is the object on which the `myMethod` method is called. 

The method returns `undefined` because there is no `myChildObject.count` defined.

## Problem 2:

In the previous problem, how would you change the context, or the value of `this`, to be the parent `myObject`?

### Solution:
```javascript
var myObject = {
  count: 1,
  myChildObject: {
    myMethod: function() {
       return this.count;
    },
  },
};

console.log(myObject.myChildObject.myMethod.call(myObject));
```

## Problem 3:

What does the following code log to the console?

```javascript
var person = {
  firstName: 'Peter',
  lastName: 'Parker',
  fullName: function() {
    console.log(this.firstName + ' ' + this.lastName +
                ' is the Amazing Spiderman!');
  },
};

var whoIsSpiderman = person.fullName.bind(person);
whoIsSpiderman();
```

### Solution:

This code logs 'Peter Parker is the Amazing Spiderman!'

## Problem 4:

 What does the following code log to the console?

```javascript
var a = 1;
var obj = {
  a: 2,
  func: function() {
    console.log(this.a);
  },
};

obj.func();// 2
obj.func.call();// 1 because `call` with no argument binds to the global ob
obj.func.call(this);// 1 because `this` in the global context is the global ob
obj.func(obj);// 2

var obj2 = { a: 3 };
obj.func.call(obj2);// 3
```

### Solution:
See comments above.

## Problem 5:

What does the following program log to the console? If you wanted it to log 34000, how would you fix it?

```javascript
var computer = {
  price: 30000,
  shipping: 2000,
  total: function() {
    var tax = 3000;
    function specialDiscount() {
      if (this.price > 20000) {
        return 1000;
      } else {
        return 0;
      }
    }

    return this.price + this.shipping + tax - specialDiscount();
  }
};

console.log(computer.total());
```

### Solution:

The program logs '35000'. The `specialDiscount` inner function is not invoked with an explicit context, and since it is invoked as a function, its context is the global object. As a result, `this.price` evaluates to `undefined`, which allows the `specialDiscount`s conditional expression to evaluate to `false`.  Thus no discount (0) is added to the price.

To fix it to log 34000, `specialDiscount` should be called with an explicit context as such:
    `return this.price + this.shipping + tax - specialDiscount.call(this);`
