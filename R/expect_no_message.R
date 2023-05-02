expect_no_message <- function(object, regexp = NA, ...) {
  testthat::expect_message(object = object, regexp = regexp, ...)
}
