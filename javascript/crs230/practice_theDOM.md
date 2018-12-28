# LS Problems: [The DOM](https://launchschool.com/lessons/bcf52647/assignments/1be169fe)

All problems relate to this site: http://d186loudes4jlv.cloudfront.net/fe2/exercises_objects_and_dom/dom_assignment.html

## Problem 1:

Use JavaScript to add a class of `'heading'` to the `h1` element.

### Solution:

```javascript
document.body.querySelector('h1').classList.add('heading');

// or 

document.body.querySelector('#primary_heading').add('heading');

// also

document.getElementById('primary_heading').setAttribute('class', 'heading');
```

## Problem 2:

Use JavaScript to set the class of the `ul` element to `'bulleted'`.

### Solution:

```javascript

document.body.querySelector('#list').classList.add('bulleted');

// or

document.body.getElementsByTagName('ul')[0].classList.add('bulleted');
```

## Problem 3 :

Use the id of the hidden element to the the `onclick` property to a function that makes the element visible when it's hidden and hides it when it's visible.

### Solution:

```javascript
var toggleMe = document.getElementById('toggle');

toggleMe.onclick = function(e) {
  e.preventDefault();
  var noticeDiv = document.querySelector('#notice');
  if (noticeDiv.classList.contains('hidden')) {
    noticeDiv.classList.remove('hidden');
    noticeDiv.classList.add('visible');
  } else {
    noticeDiv.classList.remove('visible');
    noticeDiv.classList.add('hidden');
  }
};
```

## Problem 4:

Add an `onclick` event to the element we show and hide above. This time, the function should set the class of the element to `'hidden'`. This event will let you hide the visible element by clicking on it. As with the previous function, the first thing the funtion should do is invoke `e.preventDefault()`.

Inside your function, `this` points to the current DOM element, which means that you can use `this.setAttribute` to change its class; you don't have to locate it first with `getElementById`.

### Solution:

```javascript
var noticeMe = document.getElementById('notice');

noticeMe.onclick = function(e) {
  e.preventDefault();
  this.setAttribute('class', 'hidden');
};
```

## Problem 5:

Locate the multiplication paragraph and change the text to the result of the arithmetic problem. Use the innerText property.

### Solution:

```javascript
var mult = document.querySelector('#multiplication');
var nums = mult.textContent.match(/\d+/g).map(Number);
var product = nums.reduce(function (result, num) {
return result * num;
});

mult.textContent = product.toString();
```

## Problem 6:

Set the ID of the `body` element to `'styled'` to apply the rest of the styles from the original files. The body tag in this file doesn't have an ID, so you must locate it by some other means.

### Solution:

```javascript
document.body.setAttribute('id', 'styled');
```
