#' A short description of the function
#'
#' A longer description of the function
#'
#' @return A description of the return value
#'
#' @export

empty_company_results <- function() {
  tibble::tibble(
    "investor_name" = NA_character_, "portfolio_name" = NA_character_,
    "scenario_source" = NA_character_, "scenario" = NA_character_,
    "allocation" = NA_character_, "id" = NA_character_,
    "company_name" = NA_character_, "financial_sector" = NA_character_,
    "port_weight" = NA_integer_, "allocation_weight" = NA_integer_,
    "plan_br_dist_alloc_wt" = NA_integer_, "scen_br_dist_alloc_wt" = NA_integer_,
    "equity_market" = NA_character_, "scenario_geography" = NA_character_,
    "year" = NA_integer_, "ald_sector" = NA_character_, "technology" = NA_character_,
    "plan_tech_prod" = NA_integer_, "plan_alloc_wt_tech_prod" = NA_integer_,
    "plan_carsten" = NA_integer_, "plan_emission_factor" = NA_integer_,
    "scen_tech_prod" = NA_integer_, "scen_alloc_wt_tech_prod" = NA_integer_,
    "scen_carsten" = NA_integer_, "scen_emission_factor" = NA_integer_,
    "plan_sec_prod" = NA_integer_, "plan_alloc_wt_sec_prod" = NA_integer_,
    "plan_sec_carsten" = NA_integer_, "plan_sec_emissions_factor" = NA_integer_,
    "scen_sec_prod" = NA_integer_, "scen_alloc_wt_sec_prod" = NA_integer_,
    "scen_sec_carsten" = NA_integer_, "scen_sec_emissions_factor" = NA_integer_,
    "plan_tech_share" = NA_integer_, "scen_tech_share" = NA_integer_,
    "trajectory_deviation" = NA_integer_, "trajectory_alignment" = NA_integer_
  )
}
