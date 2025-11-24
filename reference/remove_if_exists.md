# A short description of the function

A longer description of the function

## Usage

``` r
remove_if_exists(obj)
```

## Arguments

- obj:

  A description of the argument

## Value

A description of the return value

## Examples

``` r
obj <- 1L
exists("obj")
#> [1] TRUE
remove_if_exists(obj)
exists("obj")
#> [1] FALSE

exists("obj2")
#> [1] FALSE
remove_if_exists(obj2)
```
