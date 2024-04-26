#' A short description of the function
#'
#' A longer description of the function
#'
#' @param portfolio_name_ref_all A description of the argument
#' @param project_location A description of the argument
#'
#' @return A description of the return value
#'
#' @export

create_portfolio_subfolders <- function(
    portfolio_name_ref_all = NULL,
    project_location = NULL) {
  folders <-
    c(
      "00_Log_Files",
      "30_Processed_Inputs",
      "40_Results",
      "50_Outputs"
    )

  locs_to_create <- file.path(project_location, folders, portfolio_name_ref_all)

  for (path in locs_to_create) {
    dir.create(path = path, showWarnings = FALSE, recursive = TRUE)
  }

  invisible(portfolio_name_ref_all)
}
