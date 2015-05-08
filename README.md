<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Amadeus](#amadeus)
  - [CSS Variable Conventions](#css-variable-conventions)
- [How it works](#how-it-works)
- [Syntax](#syntax)
  - [Name syntax](#name-syntax)
  - [Examples](#examples)
- [Default CSS Properties, Values and HTML Tags](#default-css-properties-values-and-html-tags)
- [Custom modules](#custom-modules)
- [Non-CSS values](#non-css-values)
- [Grouping](#grouping)
  - [Defaults](#defaults)
  - [Sizing](#sizing)
  - [Color](#color)
  - [Logic](#logic)
- [TODO](#todo)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Amadeus
Keep your CSS tidy and your team all on the same page. Amadeus is a set of **CSS Conventions** for naming **variables** and **selectors** and **formatting nested CSS**.

## Variables

Conceived as a convention for future versions of [Kickstart](http://getkickstart.com), Amadeus is a set of conventions to **keep your CSS variables organized and intuitive**. These are not conventions for CSS *classes* however.

Inspired by recommendations from [CSS Tricks](http://css-tricks.com/strategies-keeping-css-specificity-low/?utm_content=bufferdc5e1&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer).

This documentation uses the Sass syntax, however these conventions are compatible with any CSS pre-processor. This is also designed to integrate nicely into a future [native CSS variable](http://www.w3.org/TR/css-variables-1/) syntax. Love it or hate it, you can do something about it! Start a discussion in the Issues and let's evolve these conventions together.

### How it works

Let's star with some easy stuff. Let's set a red color that is closer to our site's branding than default red.

    $RED: rgb(248, 240, 255)
    
Hang on, we actually have a few different shades of red, let's add a modifier

    $RED_light: rgb(245, 129, 129)
    $RED:       rgb(234, 40, 40)
    $RED_dark:  rgb(194, 21, 21)

Now we want to set a font size for the `<button>` element. The button tag is native to HTML and font-size is not only native but an actual CSS property, so just like `$RED`, we write it like this:

    $BUTTON--fontSize: 16px
    
That looks good, but what about the font color of our news feed? News feed isn't a native element, so we just omit the uppercasing

    $newsFeed--color: $RED_light
    
Wait, we have both a breaking news and local news section. No problem. Modifier to the rescue.

    $newsFeed_breaking--color: $RED_light
    $newsFeed_local--color: $RED_light
    
I want to set some `@media` queries, and it would be nice to set a breakpoint once and use it everywhere.

    @media only screen and (min-width: 650px)
    
But this is more of a utility, it does't get placed after a `:` in CSS. So we use the utility syntax:

    $_query: "only screen and (min-width: 650px)"
    
Of course, we'll probably have multiple of thesse so we use modifiers again.

    $_query_md: "only screen and (min-width: 650px)"
    $_query_lg: "only screen and (min-width: 800px)"

### Syntax

    // General syntax
    $[name]--[property]: value
    
#### Name syntax
    
    // Default CSS properties, values, or HTML tag
    FOOBAR or --fooBar
    
    // Refers to a custom module
    fooBar
    
    // Variations and Utilities
    _fooBar
    
#### Examples

    $heading_sm--fontSize: 1.5rem
    $FOOTER--paddingTop: 25px
    $breakingNewsFOOTER--paddingTop: 50px
    $headings--fontFamily: Helvetica
    $LINEHEIGHT: 1.2rem
    $FONTFAMILY: Courier
    $RED: rgb(255, 15, 15)
    $_fontSizes: (small: 14px, medium: 16px, large: 18px)

### Default CSS Properties, Values and HTML Tags

This syntax is used exclusively for names that are native to CSS and HTML. When used on their own, they should be uppercase:

    $[FOO]: value // CSS value or property
    $LINEHEIGHT: 1.2rem
    $FONTFAMILY: Courier
    $RED: rgb(255, 15, 15)
    
Use a `variation` if and only if the variable still directly describes a CSS value

    $[FOO]: value // CSS value or property
    $RED: rgb(255, 15, 15)         
    
    $[FOO_bar]: value // CSS value + variation
    $RED_muted: rgb(245, 157, 157)
    $RED_dark: rgb(92, 24, 24)     

Use a `--camelCase` syntax when using as a suffix. This example uses both versions:

    $[fizzFOO--bar]: value // custom module + HTML Tag + CSS property
    $newsHeadingARTICLE--fontSize: 25px    

### Custom modules

Custom modules are named components in your application like "User menu," "News Bar," "Call to Action Button," etc. They don't describe a style and are not native to the HTML/CSS API. These should also always be followed by the css property they are defining.

    $[foo--bar]: value // custom module + CSS property
    $userMenu--padding: 50px
    $newsBar--marginBottom: 25px
    $cTA--backgroundColor: $RED
    
You can also add the variation syntax to create multiple versions of the same thing.

    $[foo_fizz--bar]: value // custom module + variation
    $heading_lg--fontSize: 20px
    $heading_md--fontSize: 15px
    $heading_sm--fontSize: 12px
    
### Non-CSS values

In modern CSS preprocessors, variables can be used for values that do not immediately translate to CSS values. In this case, variables should announce their special traits with a leading `_`.

For example, Sass maps:

    $[_foo]: value
    $_heading: (fontSize: 24px, lineHeight: 26px)
    
or custom reusable pieces of your CSS's mixins:

    $[_foo]: value
    $_scalingFactor: 1.2
    
Use this syntax twice, both to denote a non css value and to create a group of variations.

    $[_foo_bar]: value
    $_heading_lg: (fontSize: 24px, lineHeight: 26px)
    $_heading_md: (fontSize: 18px, lineHeight: 20px)
    $_heading_sm: (fontSize: 14px, lineHeight: 15px)
    
    $_query_lg: "only screen and (min-width: 400px)"
    $_query_md: "only screen and (min-width: 650px)"
    $_query_lg: "only screen and (min-width: 800px)"

### Grouping

Here are some helpful guidelines on how to group your variables 
in a variables.sass (or whatever extension you use) file.

#### Defaults

    $RED: rgb(255, 15, 15)

#### Sizing

    $FOOTER--marginTop: 25px
    
#### Color

    $A--color: rgb(50, 25, 30)
    
#### Logic

    $_query_lg: "only screen and (min-width: 400px)"

### Duplicate properties

Often, you'll need to define properties that inherently apply to two different 
CSS attributes.

    .square {
      width: 50px
      height: 50px
    }

### Separate properties

For this, we use the same `--` prefix to indicate a real css property and 
simply concatenate the other with another `--`.

    $square--width-height: 50px;

    .square {
      width: $square--width--height;
      height: $square--width--height;
    }

### Properties with identical prefixes

Other properties only differ by their directionality suffix like `padding-top` and
`padding-bottom`. Conveniently, these are both individual properties for another real
CSS property, padding.

So we start with this

    $rectangle--padding

And define the numerical position of the property with 0, 1, 2, n... numbering.

We want to end up with this output:

    .rectangle {
      padding: 25px 50px;
    }

So `25px` is at position 0 and `50px` is at position 1

    .rectangle {
      padding: 25px 50px;
      /*       [0]  [1] */
    }

Our variables then become:

    $rectangle--padding_0: 25px;
    $rectangle--padding_1: 50px;

    .rectangle {
      padding: $rectangle--padding_0 $rectangle--padding_1;
    }
