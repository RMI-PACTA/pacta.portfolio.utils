#' Check if a file exists and abort with a message if not
#'
#' Check if a file exists and abort with a message if not
#'
#' @param path A string containing the path to the file to be checked for
#'
#' @return Returns the path (a string) invisibly
#'
#' @export

abort_if_file_doesnt_exist <- function(path) {
  if (!file.exists(path)) {
    msg <- sprintf("This file must exist but it doesn't:\n%s", path)
    stop(msg, call. = FALSE)
  }

  invisible(path)
}
