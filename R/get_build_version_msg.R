#' A short description of the function
#'
#' A longer description of the function
#'
#' @return A description of the return value
#'
#' @export

get_build_version_msg <- function() {
  build_version <- get_build_version()
  ifelse(is.na(build_version), "", paste0(" (Docker build ", build_version, ")"))
}
