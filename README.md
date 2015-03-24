# Amadeus
Also see [Chopin](https://github.com/ajkochanowicz/Chopin) CSS class name conventions
## CSS Variable Conventions

Conceived as a convention for future versions of [Kickstart](http://getkickstart.com), Amadeus is a set of conventions to **keep your CSS variables organized and intuitive**. These are not conventions for CSS *classes* however.

Inspired by recommendations from [CSS Tricks](http://css-tricks.com/strategies-keeping-css-specificity-low/?utm_content=bufferdc5e1&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer).

This documentation uses the Sass syntax, however these conventions are compatible with any CSS pre-processor. This is also designed to integrate nicely into a future [native CSS variable](http://www.w3.org/TR/css-variables-1/) syntax. Love it or hate it, you can do something about it! Start a discussion in the Issues and let's evolve these conventions together.

# Syntax

    // General syntax
    $[name]--[property]: value
    
## Name syntax
    
    // Default CSS properties, values, or HTML tag
    FOOBAR or --fooBar
    
    // Refers to a custom module
    fooBar
    
    // Variations and Utilities
    _fooBar
    
## Examples

    $heading_sm--fontSize: 1.5rem
    $FOOTER--paddingTop: 25px
    $breakingNewsFOOTER--paddingTop: 50px
    $headings--fontFamily: Helvetica
    $LINEHEIGHT: 1.2rem
    $FONTFAMILY: Courier
    $RED: rgb(255, 15, 15)
    $_fontSizes: (small: 14px, medium: 16px, large: 18px)

# Default CSS Properties, Values and HTML Tags

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

# Custom modules

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
    
# Non-CSS values

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

# Grouping

Here are some helpful guidelines on how to group your variables in a variables.sass (or whatever extension you use) file.

## Defaults

    $RED: rgb(255, 15, 15)

## Sizing

    $FOOTER--marginTop: 25px
    
## Color

    $A--color: rgb(50, 25, 30)
    
## Logic

    $_query_lg: "only screen and (min-width: 400px)"
    
# TODO

- Some CSS properties don't actually exist although used as if they do. An example would be describing the top and bottom margin but not left and right.
  - Margin top/bottom
  - Background shorthand syntax
