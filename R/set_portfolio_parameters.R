#' A short description of the function
#'
#' A longer description of the function
#'
#' @param file_path A description of the argument
#'
#' @return A description of the return value
#'
#' @export

set_portfolio_parameters <- function(file_path) {
  cfg <- config::get(file = file_path)

  null_or_string <- function(x) {
    if (is.null(x)) {
      NULL
    } else {
      as.character(x)
    }
  }

  .GlobalEnv$portfolio_name <- null_or_string(cfg$parameters$portfolio_name)
  .GlobalEnv$investor_name <- null_or_string(cfg$parameters$investor_name)
  .GlobalEnv$peer_group <- null_or_string(cfg$parameters$peer_group)
  .GlobalEnv$language_select <- null_or_string(cfg$parameters$language)
  .GlobalEnv$user_id <- null_or_string(cfg$parameters$user_id)
  .GlobalEnv$project_code <- null_or_string(cfg$parameters$project_code)
  .GlobalEnv$port_holdings_date <- null_or_string(cfg$parameters$holdings_date)
}
