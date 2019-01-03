# LS Problems: [Finding Nodes, Traversing Elements](https://launchschool.com/lessons/bcf52647/assignments/7feb30f4)

all problems reference this html:` https://d3905n0khyu9wc.cloudfront.net/the_dom/polar_bear_wiki.html`


## Problem 1:

Write some JS code to retrieve a word count for each `h2` heading on the page.

### Solution :

```javascript
// if 'word count for each' means each individually:
var h2List = document.body.querySelectorAll('h2') ;
var h2Arr = [].slice.call(h2List);

var h2WordCount = h2Arr.map(function (ele) {
  return ele.textContent.trim().split(/\s+/).length;
});


// if the specs call for a sum:
var h2List = document.body.querySelectorAll('h2') ;
var h2Arr = [].slice.call(h2List);

var h2WordCount = h2Arr.map(function (ele) {
  return ele.textContent.trim();
}).join(' ').split(/\s+/).length;


// also:
var h2List = document.body.querySelectorAll('h2') ;
var h2Arr = [].slice.call(h2List);

var h2WordCount = h2Arr.reduce(function (wordCount, ele) {
  return wordCount + ele.textContent.trim().split(/\s+/).length;
}, 0)
```

## Problem 2:

The page has a table of contents with the title 'Contents' and links to the different content sections on "Naming and etymology", "Taxonomy and evolution", etc.


Use three different DOM methods to retrieve a reference to the `div` element that contains the table of contents.

### Solution:

```javascript

// 1
document.getElementById('toc');

// 2
document.body.getElementsByCLassName('toc');

// 3
document.body.querySelector('div.toc');
```

## Problem 3:

Write some JavaScript code to change the color for every other link in th table of contents to green.

```javascript
var tocAnchors = [].slice.call(document.body.querySelectorAll('div.toc a'));

tocAnchors.forEach(function (link, idx) {
  if (idx % 2 === 0) {
    link.style.color = 'green';
  }
});

// or as a listener callback
document.addEventListener('DOMContentLoaded', function() {

  let tocAnchors = document.querySelectorAll('#toc a');

  Array.prototype.slice.call(tocAnchors).forEach(function(a, idx) {
    if (idx % 2 === 0) {
      a.style.color = 'green';
    }
  });
});
```


## Problem 4:

Write some JavaScript code to retrieve the text of every thumbnail caption on the page.

### Solution:

```javascript
var thumbCapDivs = [].slice.call(document.body.querySelectorAll('.thumbcaption'));

var captions = thumbCapDivs.map(function (div) {
  return div.textContent.trim().replace(/\s+/, ' ');
});
```

## Problem 5:

You can think of the scientific classification of an animal as a series of key-value pairs. Here, the keys are taxonomic ranks (Domain, Kindom, Phulum, etc.). The values are the specific groups to whick the animal belongs.

Write JavaSCript code that extracts this information from the web page and logs an Object that uses the ranks as keys and the groups as values.

### Solution:

```javascript
var matchTerms = new RegExp('(kingdom|phylum|class|order|family|genus|species):$', 'gi');

var dataCells = [].slice.call(document.body.querySelectorAll('td'));

var dataText = dataCells.map(function (cell) {
  return cell.textContent.trim().replace(/\s+/, ' ');
});

var ranks = dataText.filter(function (text) {
  return matchTerms.test(text);
});

var groups = dataText.filter(function (text, idx) {
  return matchTerms.test(dataText[idx - 1]);
});

var bearClassification = {};

ranks.forEach(function (rank, idx) {
  bearClassification[rank] = groups[idx];
});

console.log(bearClassification);

```
