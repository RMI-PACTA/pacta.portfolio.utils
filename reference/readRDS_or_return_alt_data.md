# Return the object stored in a RDS at a specified file path, or an alternate value/object if the file doesn't exist.

Return the object stored in a RDS at a specified file path, or an
alternate value/object if the file doesn't exist.

## Usage

``` r
readRDS_or_return_alt_data(filepath, alt_return = NULL)
```

## Arguments

- filepath:

  a single string containing a file path to a RDS file

- alt_return:

  an R object/value to be returned if the file at `filepath` does not
  exist

## Value

an object, either the object stored in the RDS at the `filepath` or the
value of `alt_return`
