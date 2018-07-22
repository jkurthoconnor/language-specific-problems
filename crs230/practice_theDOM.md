# LS Problems: [The DOM](https://launchschool.com/lessons/bcf52647/assignments/1be169fe)

All problems relate to this site: http://d186loudes4jlv.cloudfront.net/fe2/exercises_objects_and_dom/dom_assignment.html

## Problem 1:

Use JavaScript to add a class of `'heading'` to the `h1` element.

### Solution:

```javascript
document.body.querySelector('h1').classList.add('heading');

// also

document.getElementById('primary_heading').setAttribute('class', 'heading');
```

## Problem 2:

Use JavaScript to set the class of the `ul` element to `'bulleted'`.

### Solution:

```javascript

document.body.querySelector('#list').classList.add('bulleted');
```

## Problem 3 :

Use the id of the hidden element to the the `onclick` property to a function that makes the element visible when it's hidden and hides it when it's visible.
