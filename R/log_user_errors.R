#' Log user errors
#'
#' Log user errors
#'
#' @param error_name A parameter
#' @param suggested_action A parameter
#' @param description A parameter
#' @param error_file A parameter
#' @param immediate A parameter
#'
#' @return Return value
#'
#' @export

log_user_errors <- function(
    error_name,
    suggested_action = "",
    description = "",
    error_file = file.path(
      .GlobalEnv$outputs_path,
      .GlobalEnv$portfolio_name_ref_all,
      "report",
      "user_errors.json"
    ),
    immediate = FALSE
) {
  # check for strings
  stopifnot(is.character(error_name))
  stopifnot(is.character(suggested_action))
  stopifnot(is.character(description))
  if (!dir.exists(dirname(error_file))) {
    dir.create(dirname(error_file), recursive = TRUE)
  }
  # read in existing errors, or use null if none so far
  if (file.exists(error_file)) {
    errors <- jsonlite::read_json(
      path = error_file,
      simplifyVector = FALSE
    )
  } else {
    errors <- list()
  }
  # format this error, and append to the list (using c())
  this_error <- list(name = error_name)
  if (description != "") {
    this_error["description"] <- description
  }
  if (suggested_action != "") {
    this_error["action"] <- suggested_action
  }
  write_log(c("User Error:", this_error))
  errors <- c(errors, list(this_error))
  jsonlite::write_json(
    x = errors,
    path = error_file,
    pretty = TRUE,
    auto_unbox = TRUE
  )
  if (immediate) {
    prepare_error_report()
  }
}
