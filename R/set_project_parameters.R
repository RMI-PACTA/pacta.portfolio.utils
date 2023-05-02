#' A short description of the function
#'
#' A longer description of the function
#'
#' @param file_path A description of the argument
#'
#' @return A description of the return value
#'
#' @export

set_project_parameters <- function(file_path) {
  cfg <- config::get(file = file_path)

  .GlobalEnv$proj_data_location_ext <- cfg$paths$data_location_ext

  .GlobalEnv$project_report_name <- cfg$reporting$project_report_name
  .GlobalEnv$display_currency <- cfg$reporting$display_currency
  .GlobalEnv$currency_exchange_value <- as.numeric(cfg$reporting$currency_exchange_value)

  .GlobalEnv$financial_timestamp <- cfg$parameters$timestamp
  .GlobalEnv$dataprep_timestamp <- cfg$parameters$dataprep_timestamp

  if (!is.null(cfg$parameters$start_year)) {
    .GlobalEnv$start_year <- as.numeric(cfg$parameters$start_year)
  } else if (!is.null(.GlobalEnv$port_holdings_date)) {
    start_year <- convert_quarter_to_year(.GlobalEnv$port_holdings_date)
    # if holdings date is Q4 (not 1, 2, or 3), start year is next year
    if (grepl(pattern = "Q4$", x = .GlobalEnv$port_holdings_date, ignore.case = TRUE)) {
      start_year <- start_year + 1L
    }
    .GlobalEnv$start_year <- start_year
  } else {
    # if everything else is gone, 2020 is the only valid year we ran projects
    # without setting holdings_date in the portfolio parameters
    .GlobalEnv$start_year <- 2020L
  }

  .GlobalEnv$time_horizon <- as.numeric(cfg$parameters$horizon_year)

  .GlobalEnv$select_scenario <- cfg$parameters$select_scenario
  .GlobalEnv$scenario_other <- cfg$parameters$scenario_other
  .GlobalEnv$portfolio_allocation_method <- cfg$parameters$portfolio_allocation_method
  .GlobalEnv$scenario_geography <- cfg$parameters$scenario_geography

  .GlobalEnv$tech_roadmap_sectors <- cfg$sectors$tech_roadmap_sectors
  .GlobalEnv$pacta_sectors_not_analysed <- cfg$sectors$pacta_sectors_not_analysed
  .GlobalEnv$sector_list <- c(.GlobalEnv$tech_roadmap_sectors, .GlobalEnv$pacta_sectors_not_analysed)

  .GlobalEnv$scenario_sources_list <- cfg$scenario_sources_list
  .GlobalEnv$scenario_geographies_list <- cfg$scenario_geography_list
  .GlobalEnv$asset_types <- cfg$asset_types
  .GlobalEnv$equity_market_list <- cfg$equity_market_list

  .GlobalEnv$grouping_variables <- cfg$grouping_variables

  .GlobalEnv$green_techs <- cfg$sectors$green_techs
  .GlobalEnv$alignment_techs <- cfg$sectors$alignment_techs

  .GlobalEnv$has_map <- cfg$methodology$has_map

  if (is.null(.GlobalEnv$has_map)) {
    .GlobalEnv$has_map <- TRUE
    warning("Warning: has_map set to standard value (TRUE) as it is not defined in the parameter file")
  }

  .GlobalEnv$has_credit <- cfg$methodology$has_credit
  if (is.null(.GlobalEnv$has_credit)) {
    .GlobalEnv$has_credit <- FALSE
    warning("Warning: has_credit set to standard value (FALSE) as it is not defined in the parameter file")
  }

  .GlobalEnv$has_revenue <- cfg$methodology$has_revenue
  if (is.null(.GlobalEnv$has_revenue)) {
    .GlobalEnv$has_revenue <- FALSE
    warning("Warning: has_revenue set to standard value (FALSE) as it is not defined in the parameter file")
  }

  .GlobalEnv$inc_emission_factors <- cfg$methodology$inc_emissionfactors
  if (is.null(.GlobalEnv$inc_emission_factors)) {
    .GlobalEnv$inc_emission_factors <- FALSE
    warning("Warning: inc_emission_factors set to standard value (FALSE) as it is not defined in the parameter file")
  }
}
