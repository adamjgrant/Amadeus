# Amadeus
## CSS Variable Conventions

Conceived as a convention for future versions of [Kickstart](http://getkickstart.com), Amadeus is a set of conventions to **keep your CSS variables organized and intuitive**. These are not conventions for CSS *classes* however.

Inspired by recommendations from [CSS Tricks](http://css-tricks.com/strategies-keeping-css-specificity-low/?utm_content=bufferdc5e1&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer).

This documentation uses the Sass syntax, however these conventions are compatible with any CSS pre-processor. Love it or hate it, you can do something about it! Start a discussion in the Issues and let's evolve these conventions together.

# Syntax

    // General syntax
    $[name]--[property]: value
    
    // Default CSS properties, values, or HTML tag
    FOO
    
    // Refers to a custom module
    -foo
    
    // Non-CSS names
    _foo
    
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

Determine whether your variable describes a [css default](#css-defaults), [property of your app](#app-properties), or [non-css value](#non-css-values).

## CSS Defaults

Single chunk names are reserved for HTML defaults. So these do not come after a class, like `$heading--fontSize` because they are the defaults *for the CSS property or value itself.*. They should also begin with an uppercase letter to establish this distinction.

    $[Default]: value
    $LineHeight: 1.2rem    // CSS property
    $FontFamily: Courier   // CSS property
    $Red: rgb(255, 15, 15) // CSS value
    
Use a `variation` if and only if the variable still directly describes a CSS value

    $Red: rgb(255, 15, 15)         // CSS value
    $Red_muted: rgb(245, 157, 157) // CSS value
    $Red_dark: rgb(92, 24, 24)     // CSS value

## App Properties

App properties are distinct from defaults in that they describe parts of the structure of your application.

    $[block]-[Tag]_[variation]--[property]: value
    $Footer--paddingTop: 25px
    $heading--fontFamily: Helvetica
    
Again, properties are usually CSS properties, in which case, hyphen syntax (`do-re-mi`) should be converted to camel case (`doReMi`)

Sometimes, a `variation` is needed to tailor these properties to custom classifications of your app's design.

    $[class]-[property]_[variation]: value    
    $heading_sm--fontSize: 1.5rem
    $heading_rg--fontSize: 1.7rem
    
# Non-CSS values

In modern CSS preprocessors, variables can be used for values that do not immediately translate to CSS values. In this case, variables should announce their special traits with a leading `_`.

For example, Sass maps:

    $[_name]: value
    $_fontSizes: (small: 14px, medium: 16px, large: 18px)
    
or custom reusable pieces of your CSS's mixins:

    $[_name]: value
    $_scalingFactor: 1.2

# Grouping

## Defaults

    $Red: rgb(255, 15, 15)

## Sizing

    $Footer--marginTop: 25px
    
## Color

    $link--color: rgb(50, 25, 30)
    
## Logic

    $_query-lg: "only screen and (min-width: 400px)"
    
# TODO

- Some CSS properties don't actually exist although used as if they do. An example would be describing the top and bottom margin but not left and right.
