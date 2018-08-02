# LS Exercises: [Practice: jQuery Selectors](https://launchschool.com/lessons/ea70f965/assignments/d1c7f2be)

All problems refer to this [html](http://d3jtzah944tvom.cloudfront.net/jquery_selectors/index.html) 

In each case, add a `highlight` class to the elements to demonstrate success.

## Problem 1:

Use an element selector to find all `h1` elements.

### Solution:

```javascript
$('h1').addClass('highlight');
```

## Problem 2:

Use an id selector to find the first `h1` element.

### Solution:

```javascript

$('#site_title').addClass('highlight');
```

## Problem 3:

Use a descendant sleector to find all th list items in the `article` element.

### Solution:

```javascript

$('article li').addClass('highlight');
```

## Problem 4:

Find the third list item from the `article` element.


### Solution:

```javascript

$('article').find('li').eq(2).addClass('highlight');
$('article').find('li:nth-of-type(3n)').addClass('highlight');
```

## Problem 5:

Find the table element, then find all the odd-numbered table rows in that element.


### Solution:

```javascript
$('table').find('tr:nth-of-type(odd)').addClass('highlight');
$('table').find('tr:odd').addClass('highlight');
```

## Problem 6:

Find the list item that contains the text 'ac ante', then locate the parent `li` element.

### Solution:

```javascript
$('li li:contains("ac ante")').parents('li').addClass('highlight');
```

## Problem 7:

Find the list item that contains the text _ac ante_, then find and return the next element.

### Solution:

```javascript
$('li li:contains("ac ante")').next().addClass('highlight');
// or
$('li li:contains("ac ante") + *').addClass('highlight');
```

## Problem 8:

Find all the table cells in the table, then find the last cell from the collection.

### Solution:

```javascript
$('td').last().addClass('highlight');
// or
$('td').eq(-1).addClass('highlight');
// or with pure css selector
$('tr:last-of-type > td:last-of-type').addClass('highlight');
```

## Problem 9:

### Solution:

```javascript
$('td').not('.protected').addClass('highlight');
// or with pure css selector
$('td:not(.protected)').addClass('highlight');
```

## Problem 10:

Find all the anchor elements that have an `href` value that begins with `#`

### Solution:

```javascript
// pure css selector
$('a[href^="#"]').addClass('highlight');
```

## Problem 11:

Find all elements that have a class name tha contains `"block"`.

### Solution:

```javascript
// pure css selector
$('[class*="block"]').addClass('highlight');

```
