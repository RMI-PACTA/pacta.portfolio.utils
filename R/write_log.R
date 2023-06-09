#' Write log
#'
#' Write log
#'
#' @param msg A parameter
#' @param file_path A parameter
#' @param ... Additional parameters
#'
#' @return Return value
#'
#' @export

# write error log for input portfolio - msg should be a string containing the error message
write_log <- function(msg, file_path = .GlobalEnv$log_path, ...) {
  composed <- paste(
    as.character(Sys.time()),
    as.character(msg),
    ...
  )
  if (!dir.exists(file_path)) {
    dir.create(file_path, recursive = TRUE)
  }
  write(composed, file = file.path(file_path, "error_messages.txt"), append = TRUE)
}
