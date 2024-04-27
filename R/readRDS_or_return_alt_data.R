#' Return the object stored in a RDS at a specified file path, or an alternate
#' value/object if the file doesn't exist.
#'
#' @param filepath a single string containing a file path to a RDS file
#' @param alt_return an R object/value to be returned if the file at `filepath`
#'   does not exist
#'
#' @return an object, either the object stored in the RDS at the `filepath` or
#'   the value of `alt_return`
#'
#' @export

readRDS_or_return_alt_data <- function(filepath, alt_return = NULL) {
  if (file.exists(filepath)) {
    return(readRDS(filepath))
  }
  alt_return
}
