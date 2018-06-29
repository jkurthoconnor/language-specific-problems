## 1

```javascript
function func() {
  return this;
}

var context = func();

console.log(context); // Window {...}
                      // b/c the implicit invocation context for function
                      // invocation is the global object, and func is invoked as a 
                      // function
                      //
```

## 2


```javascript
var o = {
  func: function() {
    return this;
  }
};

var context = o.func();// func is called with a receiver, so it is a method
                       // invocation; as such, its implicit context is the 
                       // object holding the property that references
                       // the function

console.log(context);// {func: f} // i.e. outputs the object O
```


## 3


```javascript
var message = 'Hello from the global scope!';

function deliverMessage() {
  console.log(this.message);
}

deliverMessage();// function invocation; implicit context is thus the global
                  // object, so logs: 'Hello from global..'

var foo = {
  message: "Hello from the function scope!"
};

foo.deliverMessage = deliverMessage;// `deliverMessage` is added as a property
                                    // to `foo`, and its value is the `deliverMessage`
                                    // function

foo.deliverMessage();// method invocation; implicit context for a method invocation
                     // is the owning object, so logs: 'Hello ... function scope'
                     //
```


## 4

```javascript
var a = 10;
var b = 10;
var c = {
  a: -10,
  b: -10
};
function add() {
  return this.a + b;
}

c.add = add;// the `add` function is added to `c` object as value of property 
            // `add`

console.log(add());// function invocation; implicit context is global object
                  // so `this.a` is equivalent to `window.a`, or 10
                  // thus logs: 20
console.log(c.add());//method invocation; implicit context is owning/calling
                    // object, to `this.a` is equivalent to `c.a`, or -10
                    // thus logs: 0
                    //
```

## 6


```javascript
var foo = {
  a: 1,
  b: 2
};

var bar = {
   a: "abc",
   b: "def",
   add: function() {
     return this.a + this.b;
   }
};

console.log(bar.add.call(foo));// `call` used to invoke `add` as  a method on
                               // `bar` but with `foo` as the execution context
                               // thus `foo's` properties 'a' and 'b' will be
                               // referenced during exection;
                               // returns 3
                               
```

# 7


```javascript
var fruitsObj = {
  list: ['Apple', 'Banana', 'Grapefruit', 'Pineapple', 'Orange'],
  title: "A Collection of Fruit"
}


function outputList() {
  console.log(this.title + ':');

  var args = [].slice.call(arguments); // slice is called on an empty array
                                        // in a method invocation, but because the 
                                        // `call` makes the `arguments` array
                                        // the context, it is as though one had written
                                        // `arguments.slice() and `arguments` were
                                        // a real array, and not just array-like

  args.forEach(function(elem) {        // note that the above `call` is used to
    console.log(elem);                 // borrow `slice` to convert arguments
  });                                 // into an array to allow `forEach`
}

outputList.apply(fruitsObj, fruitsObj.list);
/*
A Collection of Fruit:
Apple
Banana
Grapefruit
Pineapple
Orange
*/
```
