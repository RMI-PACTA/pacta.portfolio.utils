#' A short description of the function
#'
#' A longer description of the function
#'
#' @return A description of the return value
#'
#' @export

empty_audit_file <- function() {
  tibble::tibble(
    "investor_name" = NA_character_,
    "portfolio_name" = NA_character_,
    "asset_type" = NA_character_,
    "valid_input" = NA,
    "isin" = NA_character_,
    "direct_holding" = NA,
    "value_usd" = NA_real_
  )
}
