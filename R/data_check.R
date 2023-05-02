#' Checks whether a variable is a data frame
#'
#' Checks whether a variable is a data frame. Considers also logicals and null values.
#'
#' @param df A description of the argument
#'
#' @return A logical: TRUE if df is a data frame and has 1 or more rows,
#'   otherwise FALSE
#'
#' @export

data_check <- function(df) {
  if (is.data.frame(df)) {
    if (nrow(df) > 0) {
      check <- TRUE
    } else {
      check <- FALSE
    }
  } else {
    check <- FALSE
  }

  return(check)
}
