#' A short description of the function
#'
#' A longer description of the function
#'
#' @return A description of the return value
#'
#' @export

empty_portfolio_overview <- function() {
  tibble::tibble(
    "investor_name" = NA_character_, "portfolio_name" = NA_character_,
    "asset_type" = NA_character_, "financial_sector" = NA_character_,
    "valid_input" = NA, "valid_value_usd" = NA_real_,
    "asset_value_usd" = NA_real_, "portfolio_value_usd" = NA_real_
  )
}
