# LS Practice Problems: [Traversing and Accessing Attributes](https://launchschool.com/lessons/bcf52647/assignments/58e8d115)


Use the following HTML to solve these problems:

```html
<!doctype html>
<html lang="en-US">
  <head>
    <title>On the River</title>
  </head>
  <body>
    <h1>On the River</h1>
    <p>A poem by Paul Laurence Dunbar</p>

    <p>
      The sun is low,<br>
      The waters flow,<br>
      My boat is dancing to and fro.<br>
      The eve is still,<br>
      Yet from the hill<br>
      The killdeer echoes loud and shrill.
    </p>
    <p>
      The paddles plash,<br>
      The wavelets dash,<br>
      We see the summer lightning flash;<br>
      While now and then,<br>
      In marsh and fen<br>
      Too muddy for the feet of men,
    </p>
    <p>
      Where neither bird<br>
      Nor beast has stirred,<br>
      The spotted bullfrog's croak is heard.<br>
      The wind is high,<br>
      The grasses sigh,<br>
      The sluggish stream goes sobbing by.
    </p>
    <p>
      And far away<br>
      The dying day<br>
      Has cast its last effulgent ray;<br>
      While on the land<br>
      The shadows stand<br>
      Proclaiming that the eve's at hand.
    </p>
  </body>
</html>
```

You may use the `walk` function:
```javascript
function walk(node, callback) {
  callback(node);

  var i;
  for (i = 0; i < node.childNodes.length; i++) {
    walk(node.childNodes[i], callback);
  }
}
```

Do not use `querySelector` or `querySelectorAll`.

## Problem 1:

Starting with the `document` node, use the `lastChild` and `childNodes` properties to change the text color to red on the `On the River` heading and set its font size 48 pixels.

### Solution:

```javascript
// with a complex 'address'
document.childNodes[1].childNodes[2].childNodes[1].style.color = 'red';
document.childNodes[1].childNodes[2].childNodes[1].style.fontSize = '48px';
```

```javascript
// programatically
function walk(node, callback) {
  callback(node);

  var i;
  for (i = 0; i < node.childNodes.length; i++) {
    walk(node.childNodes[i], callback);
  }
}

function bigRedH1(node) {
  if (node.nodeName === 'H1') {
    node.style.color = 'red';
    node.style.fontSize = '48px';
  }
}

walk(document, bigRedH1);
```

## Problem 2:

Count and log the paragraphs on the page.

### Solution:

```javascript
var count = 0;

function walk(node, callback) {
  callback(node);

  var i;
  for (i = 0; i < node.childNodes.length; i++) {
    walk(node.childNodes[i], callback);
  }
}

function countP(node) {
  if (node.nodeName === 'P') {
    count += 1;
  }
}

walk(document, countP);
console.log(count);
```

## Problem 3:

Retrieve the first word from each paragraph on the page and log the entire list.

### Solution:

```javascript

var firstWords = [];

function walk(node, callback) {
  callback(node);

  var i;
  for (i = 0; i < node.childNodes.length; i++) {
    walk(node.childNodes[i], callback);
  }
}

function fetchFirstWord(node) {
  if (node.nodeName === 'P') {
    firstWords.push(node.textContent.trim().split(' ')[0]);
    // also works:
    // firstWords.push(node.firstChild.data.trim().split(' ')[0]);
  }
}

walk(document, fetchFirstWord);
console.log(firstWords);

```

## Problem 4:

Add the class `stanza` to each paragraph _except_ the first.

### Solution:

```javascript
var addClass = false;

function walk(node, callback) {
  callback(node);

  var i;
  for (i = 0; i < node.childNodes.length; i++) {
    walk(node.childNodes[i], callback);
  }
}

function addStanzaClass(node) {
  if (node.nodeName === 'P' && addClass) {
    node.classList.add('stanza');
  }

  if (!addClass && node.nodeName === 'P') {
    addClass = true;
  }
}

walk(document, addStanzaClass);
```

_For the remainder of the problems, use: https://en.wikipedia.org/wiki/Polar_bear _

## Problem 5:

Count the images on the page, then count the PNG images. Log both results.

### Solution:

```javascript
function walk(node, callback) {
  callback(node);

  var i;
  for (i = 0; i < node.childNodes.length; i += 1) {
    walk(node.childNodes[i], callback);
  }
}

var img = 0;
var png = 0;

walk(document, function (node) {
  if (node.nodeName === 'IMG') {
    img += 1;
    if (node.getAttribute('src').match(/png$/)) {
      png += 1;
    }
  }
});

console.log(img, png);
```

## Problem 6:

Change the link color to red for every link on the page.

### Solution:

```javascript
function walk(node, callback) {
  callback(node);

  var i;
  for (i = 0; i < node.childNodes.length; i += 1) {
    walk(node.childNodes[i], callback);
  }
}


walk(document, function (node) {
  if (node.nodeName === 'A') {
    node.style.color = 'red';
  }
});

```
