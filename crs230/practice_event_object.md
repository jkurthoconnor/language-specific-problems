# LS Exercises: [Practice: Event Object](https://launchschool.com/lessons/8c4d93c8/assignments/2d21ae5b)

## Problem 1:

Starting with the template below, write some JS code to move the red X to the last position in the document that the user clicked. (on Code Pen)

```html
<div class="x">
  <div class="horizontal"></div>
  <div class="vertical"></div>
</div> 
```

```css
.x {
  position: absolute;
  transform: rotate(45deg);
  top: 20px;
  left: 20px;
}

.x .horizontal {
  width: 45px;
  height: 5px;
  position: absolute;
  left: -20px;
  background: red;
}

.x .vertical {
  height: 45px;
  width: 5px;
  background: red;
  position: absolute;
  left: 0px;
  top: -20px;
}
```



### Solution:

```javascript
document.addEventListener('click', function (event) {
  var xPlace = event.clientX;
  var yPlace = event.clientY;
  var theX = document.querySelector('.x');
    theX.style.left = `${xPlace}px`;
    theX.style.top = `${yPlace}px`;
})
```

## Problem 2:

Update your solution to make the redX move as you move the mouse.

### Solution:

```javascript
document.addEventListener('mousemove', function (event) {
  var xPlace = event.clientX;
  var yPlace = event.clientY;
  var theX = document.querySelector('.x');
    theX.style.left = `${xPlace}px`;
    theX.style.top = `${yPlace}px`;
})

```

## Problem 3:

Update your solution to change the color of the x to blue when the user presses the `b` key, to green in response to the `g` key, and red in response to the `r` key.

### Solution:

```javascript
document.addEventListener('mousemove', function (event) {
  var xPlace = event.clientX;
  var yPlace = event.clientY;
  var theX = document.querySelector('.x');
    theX.style.left = `${xPlace}px`;
    theX.style.top = `${yPlace}px`;
})

document.addEventListener('keypress', function(event) {
  var key = event.key;
  var crossStroke = document.querySelector('.x .horizontal');
  var vertStroke = document.querySelector('.x .vertical');

  if (key === 'g') {
    crossStroke.style.background = 'green';
    vertStroke.style.background = 'green';
  } else if (key === 'b') {
    crossStroke.style.background = 'blue';
    vertStroke.style.background = 'blue';
  } else if (key === 'r') {
    crossStroke.style.background = 'red';
    vertStroke.style.background = 'red';
  } 
})
```

## Problem 4:

Using the following code, write some JS to add a character counter that updates as the user types.  Note how the text turns red when you have more than 140 characters in the text box.

```html

<div class="composer">
  <textarea placeholder="Enter your message"></textarea>
  <p class="counter"></p>
  <button type="submit">Post Message</button>
</div>
```

```css
.composer {
  background: #f5f5f5;
  padding:  1em;
  width:  30em;
}

.composer textarea {
  width: 100%;
  height: 4em;
}

.composer textarea.invalid {
  color: red;
}
```

### Solution:

```javascript
document.addEventListener('DOMContentLoaded', function () {
  var textArea = document.querySelector('textarea');
  var counter = document.querySelector('.counter');
  
  textArea.addEventListener('keyup', function () {
    var length = textArea.value.length;
    counter.textContent = `${140 - length} characters remaining`;
    
 textArea.classList.toggle('invalid', (140 - length < 0));
  })
  
})
```
