# Amadeus
## CSS Variable Conventions

Conceived as a convention for future versions of [Kickstart](http://getkickstart.com), Amadeus is a set of conventions to keep your CSS variables organized and intuitive.

This documentation uses the Sass syntax, however these conventions are compatible with any CSS pre-processor. Love it or hate it, you can do something about it! Start a discussion in the Issues and let's evolve these conventions together.

# Syntax

    $[block]-[Tag]_[variation]--[property]: value
    $[Default]: value
    $[_name]: value
    
- `$`
  - The preprocessor's variable prefix. For example, Sass and Scss use `$`, Less uses `@`, future native CSS variables may use `--`.
- `property`
  - Required. Native CSS properties only, camel cased (`doReMi`) not hyphenated (`do-re-mi`). If the variable does not describe a CSS property use the `Default` or `_name` syntax instead.
- `block`
  - Optional block to scope the variable. This should never refer to a native HTML element.
- `Tag`
  - Optional HTML tag this variable will style. Uppercased for readability and consistency with `Default` syntax.
- `variation`
  - Optional suffix for variations on the same variable name.
- `Default`
  - A default variable that should have no relevance to the structure of the app itself. Should map directly to a CSS value or property in the global scope.
- `_name`
  - Reserved for variables that do not pipe directly into CSS values. [Sass maps](http://sass-lang.com/documentation/file.SASS_REFERENCE.html#maps) are an example of such a variable.
    
## Examples

    $heading_sm--fontSize: 1.5rem
    $Footer--paddingTop: 25px
    $breakingNews-Footer--paddingTop: 50px
    $headings--fontFamily: Helvetica
    $LineHeight: 1.2rem
    $FontFamily: Courier
    $Red: rgb(255, 15, 15)
    $_fontSizes: (small: 14px, medium: 16px, large: 18px)
    
# How to write a variable

Determine whether your variable describes a [default](#defaults), [general CSS property](#class-property), or [non-css value](#non-css-values).

## Defaults

Single chunk names are reserved for HTML defaults. So these do not come after a class, like `$type-headingFont` because they are the defaults *for the CSS property or value itself.*. They should also begin with an uppercase letter to establish this distinction.

    $[Default]: value
    $LineHeight: 1.2rem    // CSS property
    $FontFamily: Courier   // CSS property
    $Red: rgb(255, 15, 15) // CSS value
    
To keep these special, never append a `property` or `variation` to a default like

    $LineHeight-heading // Bad
    
or
    
    $LineHeight-heading_sm // Bad
    
Instead, this should be denoted with a class like

    $lineHeight--heading_sm // Good
    
The next section will explain how to do this in depth.

## Class property

Class properties, have at least a block and a property. Names extend left to right, only adding a chunk if needed.

    $[class]-[property]: value
    $footer-paddingTop: 25px
    $type-headingFont: Helvetica
    
Again, properties are usually CSS properties, in which case, hyphen syntax (`do-re-mi`) should be converted to camel case (`doReMi`)

Sometimes, a `variation` is needed to tailor these properties to custom classifications of your app's design.

    $[class]-[property]_[variation]: value    
    $type-headingSize_sm: 1.5rem
    $type-headingSize_rg: 1.7rem
    
# Non-CSS values

In modern CSS preprocessors, variables can be used for values that do not immediately translate to CSS values. In this case, variables should announce their special traits with a leading `_`.

For example maps:

    $[_name]: value
    $_fontSizes: (small: 14px, medium: 16px, large: 18px)
    
or custom reusable pieces of your CSS's mixins:

    $[_name]: value
    $_scalingFactor: 1.2

# Variable categories

Amadeus recognizes that CSS variables can fall into one of 3 categories:

## Sizing

    $footer-sz: 25px
    
## Color

    $link-cl: rgb(50, 25, 30)
    
## Logic

    $query-lg: "only screen and (min-width: 400px)"
    
# Object of variable

A variable exists to define some object of the application's styling. This object can be one of the following:

## Base

Base styles are fundamental to the style or palette of the application, as opposed to the styling of block elements.

    $red: (216, 15, 15);

## Block

Blocks can either be discrete HTML elements like `<footer>` or classes of elements like headings (`<h1>, <h2>...<h6>`)
