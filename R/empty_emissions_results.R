#' A short description of the function
#'
#' A longer description of the function
#'
#' @return A description of the return value
#'
#' @export

empty_emissions_results <- function() {
  tibble::tibble(
    "investor_name" = NA_character_,
    "portfolio_name" = NA_character_,
    "asset_type" = NA_character_,
    "sector" = NA_character_,
    "weighted_sector_emissions" = NA_real_
  )
}
