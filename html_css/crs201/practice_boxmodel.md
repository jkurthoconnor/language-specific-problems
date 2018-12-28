# Practice Problems: [The Box Model](https://launchschool.com/lessons/4933c521/assignments/f8fc29f2)

## 1. Which of the following tags represent block elements? Which are inline? Which are inline-block? Which are indeterminate? (You may assume that they all use the default display properties.)
  
### Solution:

`<a>`: inline
`<blockquote>`: block
`<em>`: inline
`<form>`: block
`<img>`: inline
`<input>`: indeterminate
`<p>`: block
`<span>`: inline
`<textarea>`: indeterminate
`<ul>`: block

## 2. Assume that your browser's viewport (the viewable area for content) is 720 pixels wide and that your HTML contains two consecutive elements with the following CSS styles:

```css
element-selector {
  border: 0;
  margin: 0;
  padding: 0;
  width: 350px;
}
```

Which of the following combinations of element types will display side-by-side in your browser? Select all that apply:

### Solution:

  a.  both elements are block elements
    (No. Block elements require their own lines)
  b.  both elements are inline elements
    (Not enough information is provided. Inline elements don't take `width` specifications, so the width is indeterminate and the answer will depend on the actual width of each element in question.  If the first element starts at the left margin and takes up 720px of horizontal space, the two `inline` elements will be on different lines.)
  __c.  both elements are inline-block elements__
  d.  one element is a block element and one is an inline element
    (No. The block element will require its own line/row.)
  e.  one element is a block element and one is an inline-block element
    (No. As above, the block element will require its own line/row.)
  f.  one element is an inline element and one is an inline-block element
    (Not enough information is given.  Because `inline-block` elements will accept `width` specifications we know that a little less than 1/2 of the viewport is taken, but we don't know how much horizontal space the `inline` element will require.  It is possible that the two will display on separate lines if, for instance, the `inline` element begins at the left of a new line and takes up 720px of horizontal space.

## 3. Given the CSS below and the knowledge the the browser's viewport is large enough to display an entire `textarea` that uses these styles, how much horizontal and vertical area will that element require in the browser?

```css
textarea {
  display: inline-block;
  width: 500px;
  height: 300px;
  border: 4px solid red;
  padding: 10px 20px;
  margin: 20px 20px 10px 10px;
}
```

### Solution:

The box for `textarea` will require 578px of horizontal space and 358px of vertical space.


## 4. Given the CSS below and the knowledge that the browser's viewport is 800 pixels wide and 1000 pixels high, how much horizontal and vertical area will a `section` element require in the browser?

```css
section {
  width: 500px;
  height: 300px;
  border: 4px solid red;
  padding: 10px 20px;
  margin: 20px 20px 10px 10px;
}
```

### Solution:

A `section` styled as above retains its default `display: block;` value.  As such it will require the entire available width of the viewport, in the sense that it will not allow another element on the same line.  However, its box would only be 578px wide.  It will require 358px of vertical space.

## 5. Given the CSS below and the knowledge that the browser's viewport is 800 pixels wide and 1000 pixels high, how much horizontal and vertical area does an `em` element require in the browser?

```css
em {
  width: 500px;
  height: 300px;
  border: 4px solid red;
  padding: 10px 20px;
  margin: 20px 20px 10px 10px;
}
```

### Solution:

As styled above, an `em` element will retain its `display: inline;` default.  Thus it will not recognize any `height` or `width` specifications. The core of the actual height or width dimensions will be determined by the content, and this variable remains undetermined in this question, so the solution is indeterminate.

That said, we do know how the border, padding, and margins will be applied, so:
  - the width will be the content width plus 78px (border: 8px; padding: 40px; margin: 30px)
  - the height will be the content height plus 28px (border: 8px; padding: 20px; margins: not applied)

Even so, the element's position won't be effected by the borders or the vertical padding included in the above calculations, so there may be some visible overlap.

## 6. Given the CSS below and the knowledge that the browser's viewport is large enough to display an entire `textarea` that uses these measurements, how much horizontal and vertical area does that element require in the browser?

```css
textarea {
  display: inline-block;
  box-sizing: border-box;
  width: 500px;
  height: 300px;
  border: 4px solid red;
  padding: 10 px 20px;
  margin: 20px 20px 10px 10px;
}
```

### Solution:

The element will require 530px of horizontal space and 330px of vertical space.  Because the `box-sizing` value is `border-box`, the specified `width` and `height` describe the dimensions of the element box from the border inward, so `padding` and `border` dimensions are included. Thus only the 30px of vertical margins and 30px of horizontal margins need to be added to determine the ultimate box dimensions.

## 7. Will the following HTML and CSS display the two article boxes side-by-side? If not, why not? How would you fix the code, so it does place the boxes side-by-side?

```html
<!doctype html>
<html lang="en-US">
  <head>
    <title>Question 7</title>
    <style>
      section {
        width: 400px;
        height: 400px;
        margin: 0;
        padding: 20px;
        border: 1px solid red;
      }

      article {
        width: 50%;
        height: 100%;
        padding: 10px;
        border: 1px solid blue;
      }
    </style>
  </head>
  <body>
    <section>
      <article>...</article><article>...</article>
    </section>
  </body>
</html>
```

### Solution:

No, the two articles will not display side-by-side. They are both block elements.  Also, supposing they were `inline-block`, although each has a width of 50%, this measure only describes the 'core' for the element's content; it does not include the dimensions for padding (10px x 2) and border (1px x 2). Adding each of these will push the requirements beyond the 50% of the container specified in the `width` value.
