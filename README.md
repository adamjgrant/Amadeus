# Amadeus
## CSS Variable Conventions

Keeping CSS variables logical and well-organized can quickly become unwieldly. Amadeus is a set of conventions to keep syntax organized and intuitive.

This documentation uses the Sass syntax, however these conventions are compatible with any CSS pre-processor.

# Syntax in a nutshell

    $[foo][Bar]-[fizz]_[buzz]

# Varaible categories

Amadeus recognizes that CSS variables can fall into one of 4 categories:

## Naming

    $font-nm: "Gotham"

## Sizing

    $footer-sz: 25px
    
## Color

    $link-cl: rgb(50, 25, 30)
    
## Logic

    $query-lg: "only screen and (min-width: 400px)"
