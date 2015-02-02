# Amadeus
## CSS Variable Conventions

Keeping CSS variables logical and well-organized can quickly become unwieldly. Amadeus is a set of conventions to keep syntax organized and intuitive.

This documentation uses the Sass syntax, however these conventions are compatible with any CSS pre-processor.

# Syntax in a nutshell

    $[block/Base]-[prop]_[variation]
    
## Examples

    $Red: rgb(255, 15, 15)
    $heading-sm
    $footerPaddingTop
    $FontFamily: Courier
    $LineHeight: 1.2rem

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
