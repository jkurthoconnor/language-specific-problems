# LS Exercises: [Events and Asynchronous Programming](https://launchschool.com/exercise_sets/59b16ce9)

## Problem 1:


Write a function, randomizer that accepts n number of callbacks that will be executed at a random point in time. In addition to executing the callbacks, randomizer should also log the elapsed time in seconds. To limit the randomness of the points in time that callbacks will be executed, you may assume that all callbacks should be executed within 2 * number of callbacks seconds.

Here's some sample code as reference on the exepcted outcome:

```javascript
function callback1() {
  console.log('callback1');
}

function callback2() {
  console.log('callback2');
}

function callback3() {
  console.log('callback3');
}

function randomizer(callbacks) {}
randomizer(callback1, callback2, callback3);
// Output:
// 1
// 2
// "callback2"
// "callback3"
// 3
// 4
// 5
// "callback1"
// 6
```

### Solution:

```javascript
function callback1() {
  console.log('callback1');
}

function callback2() {
  console.log('callback2');
}

function callback3() {
  console.log('callback3');
}

function callback4() {
  console.log('callback4');
}


function randomizer(callbacks) {
  var id;
  var seconds = 0;
  var maxDelay = arguments.length * 2;

  id = setInterval(function() {
    seconds += 1;
    console.log(seconds);
  }, 1000);

  setTimeout(function() {
    clearInterval(id);
  }, maxDelay * 1000);

  Array.prototype.slice.call(arguments).forEach(function (arg) {
    setTimeout(arg, Math.floor(Math.random() * maxDelay) * 1000);
  });
}

randomizer(callback1, callback2, callback3, callback4);

// or with clearer intent and a more inclusive `floor`ing of the delay
function randomizer(callbacks) {
  var seconds = 0;
  var maxDelaySeconds = arguments.length * 2;

  var id = setInterval(function() {
    seconds += 1;
    console.log(seconds);

    if (seconds === maxDelaySeconds) {
      clearInterval(id);
    }
  }, 1000);


  Array.prototype.slice.call(arguments).forEach(function (arg) {
    setTimeout(arg, Math.floor(Math.random() * maxDelaySeconds * 1000));
  });
}
```

## Problem 2:


Study the JavaScript code below and the refactor it such that the same behavior is achieved but without the use of event.stopPropagation:

```javascript
document.querySelector('html').addEventListener('click', function() {
  document.querySelector('#container').style = 'display: none';
});

document.querySelector('#container').addEventListener('click', function(event) {
  event.stopPropagation();
});
```

### Solution:
Desired behavior: if one clicks inside the document, but outside of `container`, then `container` will be styled `display: none`. If one clicks inside `container`, its `display` will not be set as above.

```javascript
// this works, but only if `container` does not have its own children
document.querySelector('html').addEventListener('click', function() {
  document.querySelector('#container').style = 'display: none';
}, true);

document.querySelector('#container').addEventListener('click', function(event) {
  event.target.style = 'display: block';
});

// this code works better by simply not altering `container`'s `display` if container or one of its heirs is the target
document.querySelector('html').addEventListener('click', function() {
  var container = document.querySelector('#container');
  if (!container.contains(event.target)) {
    container.style = 'display: none';
  }
});
```


## Problem 3:

Implement a function that makes an element bold and allows the user of the function to optionally do something else with it.

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8">
    <title>Bold Element + Custom</title>
  </head>
  <body>
    <section>Hello World</section>
    <p>Greetings!</p>
  </body>
</html>
```
```javascript
> var domElement = document.querySelector('p');
> makeBold(domElement, function(elem) {
    if (elem.tagName === 'SECTION') {
      elem.classList.add('highlight');
    }
  });
  
> domElement.classList.contains('highlight');
= false
> domElement.style.fontWeight;
= "bold"

> domElement = document.querySelector('section');
> makeBold(domElement, function(elem) {
    if (elem.tagName === 'SECTION') {
      elem.classList.add('highlight');
    }
  });
  
> domElement.classList.contains('highlight');
= true
> domElement.style.fontWeight;
= "bold"
```

### Solution:

```javascript
// fontWeight bolding is set last to insist on the function's namesake side-effect

function makeBold(element, callback) {

  if (callback && (typeof callback === 'function')) {
    callback(element);
  }

  element.style.fontWeight = 'bold';
}
```

## Problem 4:

The code below is buggy. The person who created the code expects that when the user clicks on the image that nothing will happen. This, however, wasn't the case and clicks to the image still brought the user to another web page.

Study the code and explain the bug.

```html
<a href="https://www.launchschool.com">
  Home
  <img src="https://d24f1whwu8r3u4.cloudfront.net/assets/launch-logo-b6d01bd15ee9da31457ee3c315845718823aa8a741858be598ab35042a312348.svg"
</a>
```

```css
img {
  display: block;
  width: 15%;
  margin-top: 10px;
  cursor: auto;
}
```

```javascript
document.querySelector('img').addEventListener('click', function(event) {
  event.stopPropagation(); 
}, false);
```

### Solution:

The problem is that the `img` is wrapped by (is a child element of) the `a`. Clicking on the image then is going to initiate the default behavior of clicking a link as soon as the propagation sequence completes. By stopping propagation, the code ensures that no other listeners will 'hear' the event, but doesn't stop the event from triggering default behavior

## Problem 5:

Given the following markup, implement distinct context menus for the main and the sub areas of the web page. You can represent a context menu as an alert box that displays the name of the respective area (i.e., alert("sub")). Only one context menu should appear when the event occurs.

```html
<main>
  Main Area
  <section id="sub">
    Sub Area
  </section>
</main>
```

```css
main, #sub {
  padding: 15px;
}
main {
  width: 100%;
  height: 200px;
  background: blue;
  color: white;
}

#sub {
  position: relative;
  top: 100px;
  left: 15px;
  background: red;
  height: 50px;
  width: 50%;
}
```

### Solution:

```javascript
document.querySelector('main').addEventListener('contextmenu', function(event) {
  event.preventDefault();
  alert(event.target.tagName)
})

document.querySelector('#sub').addEventListener('contextmenu', function(event) {
  event.preventDefault();
  event.stopPropagation();
  alert(event.target.id);
});
```


## Problem 6:

Given the HTML below, write JS code that updates the options on one dropdown every time the selection in the other dropdown changes. For instance, when the user chooses an option other than the one currently displayed in the left dropdown (i.e., "Classifications"), then the options on the dropdown to the right of it should change accordingly. Use the lookup table that follows for what the available options should be given a selection change in one of the dropdowns.


### Solution:

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8">
      <title>Selection Filters</title>
    <script>
document.addEventListener('DOMContentLoaded', function() {
  var classFilter = {
    'Vertebrate': ['Bear', 'Turtle', 'Whale', 'Salmon', 'Ostrich'],
    'Warm-blooded': ['Bear', 'Whale', 'Ostrich'],
    'Cold-blooded': ['Salmon', 'Turtle'],
    'Mammal': ['Bear', 'Whale'],
    'Bird': ['Ostrich'],
  };

  var animalFilter = {
    'Bear': ['Vertebrate', 'Warm-blooded', 'Mammal'],
    'Turtle': ['Vertebrate', 'Cold-blooded'],
    'Whale': ['Vertebrate', 'Warm-blooded', 'Mammal'],
    'Salmon': ['Vertebrate', 'Cold-blooded'],
    'Ostrich': ['Vertebrate', 'Warm-blooded', 'Bird'],
  };

  var classifications = document.querySelector('#animal-classifications');
  var classOptions = classifications.children;
  var animals = document.querySelector('#animals');
  var animalOptions = animals.children;
  var clear = document.querySelector('#clear');

  classifications.addEventListener('change', function(event) {
    var i;
    var selection = event.target.value;

    for (i = 0; i < animalOptions.length; i += 1) {
      if (selection === 'Classifications' || classFilter[selection].includes(animalOptions[i].value)) {
        animalOptions[i].style.display = 'block';
      } else {
        animalOptions[i].style.display = 'none';
      }
    }
  });

  animals.addEventListener('change', function(event) {
    var i;
    var selection = event.target.value;

    for (i = 0; i < classOptions.length; i += 1) {
      if (selection === 'Animals' || animalFilter[selection].includes(classOptions[i].value)) {
        classOptions[i].style.display = 'block';
      } else {
        classOptions[i].style.display = 'none';
      }
    }
  });

  clear.addEventListener('click', function(event) {
    event.preventDefault();
    var i;

    [classOptions, animalOptions].forEach(function(optionSet) {
      for (i = 0; i < optionSet.length; i += 1) {
        optionSet[i].style.display = 'block';
      }
    });
  });
});
    </script>
  </head>
  <body>
  <form id="selection-filters" method="post" action="#">
  <select id="animal-classifications">
    <option value="Classifications" selected>Classifications</option>
    <option value="Vertebrate">Vertebrate</option>
    <option value="Warm-blooded">Warm-blooded</option>
    <option value="Cold-blooded">Cold-blooded</option>
    <option value="Mammal">Mammal</option>
    <option value="Bird">Bird</option>
  </select>
  <select id="animals">
    <option value="Animals" selected>Animals</option>
    <option value="Bear">Bear</option>
    <option value="Turtle">Turtle</option>
    <option value="Whale">Whale</option>
    <option value="Salmon">Salmon</option>
    <option value="Ostrich">Ostrich</option>    
  </select>
  <button id="clear">Clear</button>  
</form></body>
</html>

```

## Problem 7:

Given the HTML and CSS from the codepen, implement JS code that does the following:

See the Pen Article Highlighter](https://codepen.io/launchschool/pen/YaoEyQ/) by Launch School (@launchschool) on CodePen.

    - When the user clicks on a "Nav" link (Article 1 to 4) the browser scrolls to the particular article element and adds the highlight class to it. If another element has highlight as part of its class attribute, the browser removes it.

   - When a user clicks on an article element or any of its child elements, the browser adds the highlight class to it. If another element has highlight as part of its class attribute, the browser removes it.

    - When the user clicks anywhere outside of a specific article element and its child elements, the browers adds the highlight class to the main element containing all four (4) articles. If another element has highlight as part of its class attribute, the browser removes it.

### Solution:

```javascript
document.addEventListener('DOMContentLoaded', function() {
  var articleList = document.querySelectorAll('article');

  function highlight(element) {
    var i;
    var highlighted = document.querySelectorAll('.highlight');

    for (i = 0; i < highlighted.length; i += 1) {
      highlighted[i].classList.remove('highlight');
    }

    element.classList.add('highlight');
  }

  document.querySelector('ul').addEventListener('click', function(event) {
    event.stopPropagation();
    var article = document.querySelector(event.srcElement.hash);
    highlight(article);
  });

  document.addEventListener('click', function(event) {
    highlight(document.querySelector('main'));
  });

  for (var i = 0; i < articleList.length; i += 1) {
    articleList[i].addEventListener('click', function(event) {
      event.stopPropagation();
      highlight(event.currentTarget);
    });
  }
});
```


## Problem 8:

Implement a function that delegates events on descendant (inner) elements that match a selector to a parent element. The function takes three (4) arguments: parentElement, selector, eventType, and, callback. Assume that all event handlers are listening during the bubbling phase.

Use this markup and the following scenarios to test your implementation:

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="utf-8">
    <title>Event Delegation Function</title>
  </head>
  <body>
    <main>
      <section>
        <h1>Header</h1>
        <p>Content</p>
      </section>
      <aside>
        <h2>Sub Side Notes</h2>
        <p>Note 1</p>
        <p>Note 2</p>
      </aside>
    </main>
    <aside>
      <p>Side Note</p>
    </aside>
  </body>
</html>
```

### Solution:

```javascript
document.addEventListener('DOMContentLoaded', function() {

  function delegateEvent(parentElement, selector, eventType, callback) {

    if (parentElement && parentElement instanceof Element) {
      parentElement.addEventListener(eventType, function (event) {
        if (eventMatchesSelector(event, selector) && event.target !== event.currentTarget) {
          callback(event);
        }
      });

      return true;
    }
  }

  function eventMatchesSelector(e, selector) {
    var contains;

    document.querySelectorAll(selector).forEach(function (match) {
      if (match.contains(e.target)) {
        contains = true;
      }
    });

    return contains
  }

  var element1 = document.querySelector('nav');
  var element2 = document.querySelector('main h1');
  var element3 = document.querySelector('main');

  var callback = function(event) {
    alert('Target: ' + event.target.tagName + "\nCurrent Target: " + event.currentTarget.tagName);
  };

  delegateEvent(element3, 'aside p', 'click', callback);
});
```
