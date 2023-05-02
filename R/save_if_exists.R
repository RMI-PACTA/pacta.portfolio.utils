#' A short description of the function
#'
#' A longer description of the function
#'
#' @param df A description of the argument
#' @param portfolio_name A description of the argument
#' @param save_name A description of the argument
#' @param csv_or_rds A description of the argument
#'
#' @return A description of the return value
#'
#' @export
#'
#' @importFrom dplyr %>%
#' @importFrom dplyr filter

save_if_exists <- function(df, portfolio_name, save_name, csv_or_rds = "rds") {
  if (data_check(df)) {
    df <- df %>% filter(portfolio_name == .env$portfolio_name)
  }

  if (data_check(df)) {
    if (csv_or_rds == "rds") {
      saveRDS(df, save_name)
    } else if (csv_or_rds == "csv") {
      readr::write_csv(df, file = save_name)
    }
  }
}
