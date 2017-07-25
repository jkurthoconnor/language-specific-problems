# Practice Problems: [Basic Semantics](https://launchschool.com/lessons/2d134e42/assignments/9c920f05)

## 1. Which of the tags are semantic, and which are not?

### Solution:
`<article>`: semantic; identifies self-contained material;
`<h3>`: semantic; establishes a level of hierarchy
`<aside>`: semantic; identifies material related to the surrounding content
`<header>`: semantic; identifies opening of an article, section, page or other significant chunk of content
`<b>`: not semantic; intended for 'stylistically offset text'
`<section>`: semantic; identifies a topically-linked chunk of content
`<div>`: not semantic; used primarilly for styling
`<span>`: not semantic; used primarilly for styling
`<footer>`: semantic; identifies end of containing article, section, page, etc
`<strong>`: semantic; in contrast with `<b>`, `<strong>` identifies strongly important text

## 2. Given the following HTML, would `<section>`, `<aside>`, `<article>`, or `<div>` be the most appropriate element for the tag shown as `<sometag>`?

```html
<sometag>
  <h1>Lincoln's Gettysburg Address</h1>
  <p>
    Four score and seven years ago our fathers brought forth on this
    continent, a new nation, conceived in Liberty, and dedicated to the
    proposition that all men are created equal.
  </p>
  <p>
    Now we are engaged in a great civil war, testing whether that nation,
    or any nation so conceived and so dedicated, can long endure. We are
    met on a great battle-field of that war. We have come to dedicate a
    portion of that field, as a final resting place for those who here gave
    their lives that that nation might live. It is altogether fitting and
    proper that we should do this.
  </p>
  <p>
    But, in a larger sense, we can not dedicate—we can not consecrate—we
    can not hallow—this ground. The brave men, living and dead, who
    struggled here, have consecrated it, far above our poor power to add or
    detract. The world will little note, nor long remember what we say
    here, but it can never forget what they did here. It is for us the
    living, rather, to be dedicated here to the unfinished work which they
    who fought here have thus far so nobly advanced. It is rather for us
    to be here dedicated to the great task remaining before us—that from
    these honored dead we take increased devotion to that cause for which
    they gave the last full measure of devotion—that we here highly
    resolve that these dead shall not have died in vain—that this nation,
    under God, shall have a new birth of freedom—and that government of
    the people, by the people, for the people, shall not perish from the
    earth.
  </p>
</sometag>
```

### Solution:

It all depends on the context.  What is the _Gettysburg Address_ doing on the page?

Certainly if it stands on its own, then as the given solution holds, `<sometag>` would best be replaced with `<article>`, since the _Gettysburg Address_ is self-contained content.

But 'self-contained and reusable' isn't really a sufficient condition for use of `<article>`, is it?  (It seems to be a _necessary_ condition, but not _sufficient_.)  For instance:

  - in a context in which the _Address_ is being reproduced and commented upon in a larger `<article>`, then might`<sometag>`  work as a `<section>`?

  - in a context in which the _Address_ is used as supplemental or tangential material within a larger unit (again, say an `<article>`), then `<aside>` would seem to be appropriate.
  
That said, per the documentation,`<article>` can be nested within another `<article>`, so perhaps my alternatives are beside the point.

## 3. Given the HTML from question 2, would it be appropriate to replace the `<article>` tag with`<address>` or `<blockquote>`?  If so, which one?

### Solution:

`<address>` would be inappropriate for two reasons:
  - the `<address>` element is intended for a different type of content; 'address' refers to contact information, not 'address' as a synonym for 'public lecture';
  - the content in question contains an `<h1>` element, and `<address>` elements may not contain headings.

`<blockquote>` might be appropriate:
  - the semantics fit;
  - the content types (`<h1>` and `<p>`) are permitted

## 4. Given the following HTML, would `<section>`, `<aside>`, `<article>`, or `<div>` be the most appropriate element for the tag shown as `<sometag>`?

```html
<sometag>
  <h3>Text-align Property</h3>
  <p>
    Given the width of the paragraph, the heading looks odd hanging out on the left side of the screen. Let's center it instead; we'll do this with the text-align property:
  <p>

  <pre>
    <h1 style="color: orange; text-align: center;">Hello, Internet!</h1>
  </pre>
</sometag>
```

### Solution:

`<section>` would be the best replacement for `<sometag>`.  
  - The semantics are appropriate; all material is related to a single theme (the use of `text-align`), but the content does not appear to be able to stand on its own without the surrounding context, so `<article>` would be ruled out.
  - the content of `<sometag>` element is all appropriate for `<section>`
  - `<div>` would minimally work, but `<div>` has no semantic value of its own, so then we would lose the semantic clarity of `<section>`
  - There's nothing in the context to suggest the semantics of `<aside>` are appropriate

## 5. Given the following HTML, would `<aside>`, `<section>`, `<blockquote>`, or `<div>` be the most appropriate element for the tag shown as `<sometag>`?

```html
<h3>Hex Colors</h3>

<p>
  Most graphics and design applications like Photoshop and Pixelmator display colors in hexadecimal format, so it's easy to copy and past color values you need from one program into your editor as a CSS property.
</p>

<sometag>
  <p>
    If you're unfamiliar with the hexadecimal numbering system, it uses 16 different digits instead of the ten the decimal system uses. The hex digits are 0 through 9, as in the decimal system, but also include a through f (or A through F) as valid digits.
  </p>
</sometag>
```

### Solution:

`<aside>` seems to be the best replacement for `<sometag>`:
  - The content is thematically unified (via hexadecimal notation), but this theme refers back to the previous `<p>` element, so it is not self-contained.  Rather, the content looks like an inessential, tangential development of the main idea.  This fits the semantics of `<aside>`
  - the content is consistent with the permitted categories for `<aside>`.
