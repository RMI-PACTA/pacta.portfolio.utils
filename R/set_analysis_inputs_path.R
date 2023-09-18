#' A short description of the function
#'
#' A longer description of the function
#'
#' @param data_location_ext A description of the argument
#'
#' @return A description of the return value
#'
#' @export

set_analysis_inputs_path <- function(data_location_ext) {
  # project level setting takes precedence, portfolio level second, else what
  # set_webtool_paths() sets for data_location_ext
  if (!is.null(.GlobalEnv$proj_data_location_ext)) {
    analysis_inputs_path <- .GlobalEnv$proj_data_location_ext
  } else if (!is.null(.GlobalEnv$port_holdings_date)) {
    analysis_inputs_path <- file.path(
      "..",
      "pacta-data",
      .GlobalEnv$port_holdings_date
    )
  } else {
    analysis_inputs_path <- data_location_ext
  }

  return(analysis_inputs_path)
}
