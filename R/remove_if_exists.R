#' A short description of the function
#'
#' A longer description of the function
#'
#' @param obj A description of the argument
#'
#' @return A description of the return value
#'
#' @examples
#' obj <- 1L
#' exists("obj")
#' remove_if_exists(obj)
#' exists("obj")
#'
#' exists("obj2")
#' remove_if_exists(obj2)
#'
#' @export

remove_if_exists <- function(obj) {
  name <- deparse(substitute(obj))
  if (exists(name, envir = parent.frame())) {
    rm(list = name, envir = parent.frame())
  }
  invisible(name)
}
