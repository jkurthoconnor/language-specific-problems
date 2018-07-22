# LS Problems: [Finding DOM Nodes](https://launchschool.com/lessons/bcf52647/assignments/c274ef76)


## Problem 1:

Write a JavaScript function that return the `p` elements in the DOM represented by this HTML:

```html
<!doctype html>
<html lang="en-US">
  <head>
    <title>On the River</title>
  </head>
  <body>
    <h1>On The River</h1>
    <p>The sun is low</p>
    <p>The waters flow</p>
  </body>
</html>
```



### Solution:


```javascript
var para = [];

function walk(node, callback) {
  callback(node);

  var i;

  for (i = 0; i < node.childNodes.length; i += 1) {
    walk(node.childNodes[i], callback);
  }
}

function collectP(node) {
  if (node.nodeName === 'P') {
    para.push(node);
  }
}


walk(document, collectP);
console.log(para);

// without the assignment's artificial constraints, this would work, and is 
// the better choice in most cases
document.body.querySelectorAll('p');
```

## Problem 2:

Write a JavaScript function that adds the class `article-text` to every `<p>` tag in this HTML:

```html

<!doctype html>
<html lang="en-US">
  <head>
    <title>On the River</title>
  </head>
  <body>
    <div id="page1">
      <div class="intro">
        <p>The sun is low,</p>
      </div>
      <p>The waters flow,</p>
    </div>
    <div id="page2">
      <div class="intro">
        <p>My boat is dancing to and fro.</p>
      </div>
      <p>The eve is still,</p>
    </div>
    <div id="page3">
      <div class="intro">
        <p>Yet from the hill</p>
      </div>
      <p>The killdeer echoes loud and shrill.</p>
    </div>
  </body>
</html>
```

### Solution:

```javascript
function walk(node, callback) {
  callback(node);

  for (var i = 0; i < node.childNodes.length; i += 1) {
    walk(node.childNodes[i], callback);
  }
}


function addClass(node) {
  if (node instanceof HTMLParagraphElement) {
    node.classList.add('article-text');
  }
}

walk(document, addClass);

// without artificial constraints, this is a more idiomatic choice:
var i;
var para = document.body.querySelectorAll('p');

for (i = 0; i < para.length; i += 1) {
  para[i].classList.add('article-text');
}
```

## Problem 3:

Rewrite the solutions to the first problem to more clearly express intent. The problem really consists of two operations: find all the <p> elements, and add a class to each.

### Solution:

```javascript
function getElementsByTagName(node, tagName) {
  var elements = [];
  var i;

  for (i = 0; i < node.childNodes.length; i += 1) {
    if (node.childNodes[i].nodeName === tagName) {
    elements.push(node.childNodes[i]);
    }
  }

  return elements;
}

function addClass(elements, newClass) {
  elements.forEach(function (element) {
    element.classList.add(newClass);
  });
}


var paragraphs = getElementsByTagName(document.body, 'P');
addClass(paragraphs, 'article-text');

```

## Problem 4:

Update the previous code to use the built-in `document.getElementsByTagName`


### Solution:
```javascript
function addClass(elements, newClass) {
  elements.forEach(function (element) {
    element.classList.add(newClass);
  });
}


var paragraphCollection = document.body.getElementsByTagName('P');
var paragraphs = [].slice.call(paragraphCollection);
addClass(paragraphs, 'article-text');
```

## Problem 5:

Update the code from Problem 4 to add the `article-text` class to paragraphs inside.
`<div class-"intro">`, and nowhere else.

### Solution:

```javascript
var i;
var para = document.body.querySelectorAll('.intro p');

for (i = 0; i < para.length; i += 1) {
  para[i].classList.add('article-text');
}
```
