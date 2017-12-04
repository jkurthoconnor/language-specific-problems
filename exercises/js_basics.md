LS Exercises: [JavaScript Basics](https://launchschool.com/exercise_sets/c39a2eed)

1. Building Strings:
Why won't this code run?

```javascript
var paragraph = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sed \
                ligula at risus vulputate faucibus. Aliquam venenatis nibh ut justo dignissim \
                dignissim. Proin dictum purus mollis diam auctor sollicitudin. Ut in bibendum \
                ligula. Suspendisse quam ante, dictum aliquam tristique id, porttitor pulvinar \
                diam. Maecenas blandit aliquet ipsum. Integer vitae sapien sed nulla rutrum \   
                hendrerit ac a urna. Interdum et malesuada fames ac ante ipsum primis in faucibus.';

console.log(paragraph);
```


Answer:
Prior to the final line, the backslash escaped carriage return has space chars in front of it, so the return isn't actually escaped; this throws an error.

Also, the extra spaces at the front of each line thrown in for attractive formatting end up appearing in the text once the syntax error is resolved.

If the code formatting is desired, then the declaraton and assignment could use string concatenation:

```javascript
      var paragraph = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sed' +
                      ' ligula at risus vulputate faucibus. Aliquam venenatis nibh ut justo dignissim' +
                      ' dignissim. Proin dictum purus mollis diam auctor sollicitudin. Ut in bibendum' +
                      ' ligula. Suspendisse quam ante, dictum aliquam tristique id, porttitor pulvinar' +
                      ' diam. Maecenas blandit aliquet ipsum. Integer vitae sapien sed nulla rutrum' +
                      ' hendrerit ac a urna. Interdum et malesuada fames ac ante ipsum primis in faucibus.';

```


2. Go over the code.  What does ie log to the console?

```javascript
var myBoolean = true;
var myString = 'hello';
var myArray = [];
var myOtherString = '';

if (myBoolean) {
  console.log('Hello');
}

if (!myString) {
  console.log('World');
}

if (!!myArray) {
  console.log('World');
}

if (myOtherString || myArray) {
  console.log('!');
}
```

Solution:
Line 45: 'Hello'
Line 49: logs nothing; `!myString` is translated to `false`
Line 53: logs 'World'; `!!myArray` is translated to `true` 
Line 57: logs '!'; `(myOtherString || myArray)` returns `myArray`, which is translated to `true`


3. Go over the code below and specify how many possible flows/paths there are.

if (condition1) {
  // ...
  if (condition2) {
    // ...
  } else {
    // ...
  }
} else {
  // ...
  if (condition4) {
    // ...
    if (condition5) {
    // ...
    }
  }
}
```

Solution:
When conditon 1 is true and
  - 1. condition 2 is true or
  - 2 . condition 2 is false
When condition 1 is false
  - condition 4 is true and
    - 3. condition 5 is true or
    - 4. condition 5 is false
  - 5. condition 4 is false


4. What does this code log? Can you explain these results? 

```javascript
var name = 'Bob';
var saveName = name;
name.toUpperCase();
console.log(name, saveName);
```

Solution: 
The code logs `Bob Bob`. This is because strings are primitive types in JS, thus they are immutable.  While `name.toUpperCase()` returns a new, uppercased string, the original value to which `name` points remains unchanged.
