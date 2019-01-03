## 2 What will the code below log?

```javascript
var obj = {
  message: "JavaScript"
}

function foo() {
  console.log(this.message);
}

foo.bind(obj);  // returns a new copy of `foo` that is bound permanently to the 
                // obj object, but this copy is not stored in a var, and the
                // `bind` call has no effects on the original `foo`
                // unlike `call` or `apply`, `bind` does not invoke the receiver.
                // `foo` is not called, SO NOTHING IS LOGGED.
                //
```
## 3 What will the code output?

```javascript
var a = 1;
var b = -1;
var obj = {
  a: 2,
  b: 3
};

function foo() {
  return this.a + this.b;
}

var bar = foo.bind(obj);  // `bar` points to `foo` permanently bound to `obj`

console.log(foo());// as a function invocation of foo w/o explict context,
                  // the implicit context is the global object, to which the 
                  // global vars `a` and `b` are bound as properties;
                  // `this.a` and `this.b` evaluate to `window.a` and `window.b`,
                  // which are 1 and -1; thus logs: 0
                   // 
console.log(bar()); // because `bar` holds `foo` bound to `obj`,
                    // `this.a` and `this.b` are equivalent to `obj.a`
                    //  and `obj.b`, (or 2 and 3)
                    // thus the line logs: 5
                    //
```

## 4 What will the code below log?

```javascript
var positiveMentality = {
  message: "JavaScript makes sense!"
};

var negativeMentality = {
  message: "JavaScript makes no sense!"
};

function foo() {
  console.log(this.message);
}

var bar = foo.bind(positiveMentality);// `bar` holds return value of the `bind`
                                      // call, so it holds a copy of `foo`
                                      // permanently bound to the `positiveM`
                                      // execution context

negativeMentality.logMessage = bar;// `logMessage` property of `negativeMen....`
                                   // is assigned to hold `bar`, which is a copyo
                                   // of `foo` that is permanently bound to the
                                   // `positiveMentality` execution context, in
                                   // that context, message is the 'makes sense'
                                   // version;
                                   // thus, even though the function is literally
                                   // a method of `negativeMentality`, it will
                                   // access the message property of the
                                   // `positiveMentality` object!
negativeMentality.logMessage();// logs: JS makes sense
```

## 5 What will the code below output?

```javascript
var obj = { a: 'Amazebulous!' };
var otherObj = { a: "That's not a real word!" };

function foo() {
  console.log(this.a);
}

var bar = foo.bind(obj);// `bar` holds `foo` with a _permanent_ binding to the
                        // `obj` execution context

bar.call(otherObj); // because `bar` holds `foo` permanently bound to the `obj`
                    // execution context, `this.a` in this copy of `foo`
                    // will always resolve to `obj.a`, and thus 'Amazebulous';
                    // calling `bar` from `otherObj` execution context can't 
                    // override the bind
```
