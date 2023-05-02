#' A short description of the function
#'
#' A longer description of the function
#'
#' @return A description of the return value
#'
#' @export

setup_project <- function() {
  if (in_transitionmonitor()) {
    .GlobalEnv$portfolio_name_ref_all <- get_portfolio_name()
    .GlobalEnv$working_location <- getwd()
    set_web_parameters(file_path = paste0(.GlobalEnv$working_location, "/parameter_files/WebParameters_docker.yml"))
  } else {
    .GlobalEnv$portfolio_name_ref_all <- .GlobalEnv$portfolio_name_ref_all # must be the same name as in the _PortfolioParameters.yml
    .GlobalEnv$working_location <- here::here()
    set_web_parameters(file_path = paste0(.GlobalEnv$working_location, "/parameter_files/WebParameters_local.yml"))
  }
}
