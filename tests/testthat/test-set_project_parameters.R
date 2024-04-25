test_that("sets appropriate global variables", {
  cfg <-
    list(
      default = list(
        paths = list(
          data_location_ext = "test_data_location_ext",
          template_location = "test_template_location",
          user_data_location = "test_user_data_location"
        ),
        reporting = list(
          project_report_name = "test_project_report_name",
          display_currency = "test_display_currency",
          currency_exchange_value = 1.23
        ),
        parameters = list(
          timestamp = "test_timestamp",
          dataprep_timestamp = "test_dataprep_timestamp",
          start_year = 2023,
          horizon_year = 2029,
          select_scenario = "test_select_scenario",
          scenario_other = "test_scenario_other",
          portfolio_allocation_method = "test_portfolio_allocation_method",
          scenario_geography = "test_scenario_geography"
        ),
        sectors = list(
          tech_roadmap_sectors = "test_tech_roadmap_sectors",
          pacta_sectors_not_analysed = "test_pacta_sectors_not_analysed",
          green_techs = "test_green_techs",
          alignment_techs = "test_alignment_techs"
        ),
        scenario_sources_list = "test_scenario_sources_list",
        scenario_geography_list = "test_scenario_geography_list",
        asset_types = "test_asset_types",
        equity_market_list = "test_equity_market_list",
        methodology = list(
          has_map = TRUE,
          has_credit = TRUE,
          has_revenue = TRUE,
          inc_emissionfactors = TRUE
        )

      )
    )

  config_path <- withr::local_file("config.yml")
  yaml::write_yaml(x = cfg, file = config_path)

  test_globalenv_vars <-
    callr::r(
      func = function(set_project_parameters, config_path) {
        set_project_parameters(config_path)
        as.list.environment(.GlobalEnv)
      },
      args = list(set_project_parameters, config_path)
    )

  expect_equal(
    test_globalenv_vars$proj_data_location_ext,
    cfg$default$paths$data_location_ext
  )
  expect_equal(
    test_globalenv_vars$project_report_name,
    cfg$default$reporting$project_report_name
  )
  expect_equal(
    test_globalenv_vars$display_currency,
    cfg$default$reporting$display_currency
  )
  expect_equal(
    test_globalenv_vars$currency_exchange_value,
    cfg$default$reporting$currency_exchange_value
  )
  expect_equal(
    test_globalenv_vars$financial_timestamp,
    cfg$default$parameters$timestamp
  )
  expect_equal(
    test_globalenv_vars$dataprep_timestamp,
    cfg$default$parameters$dataprep_timestamp
  )
  expect_equal(
    test_globalenv_vars$start_year,
    as.numeric(cfg$default$parameters$start_year)
  )
  expect_equal(
    test_globalenv_vars$time_horizon,
    as.numeric(cfg$default$parameters$horizon_year)
  )
  expect_equal(
    test_globalenv_vars$select_scenario,
    cfg$default$parameters$select_scenario
  )
  expect_equal(
    test_globalenv_vars$scenario_other,
    cfg$default$parameters$scenario_other
  )
  expect_equal(
    test_globalenv_vars$portfolio_allocation_method,
    cfg$default$parameters$portfolio_allocation_method
  )
  expect_equal(
    test_globalenv_vars$scenario_geography,
    cfg$default$parameters$scenario_geography
  )
  expect_equal(
    test_globalenv_vars$tech_roadmap_sectors,
    cfg$default$sectors$tech_roadmap_sectors
  )
  expect_equal(
    test_globalenv_vars$pacta_sectors_not_analysed,
    cfg$default$sectors$pacta_sectors_not_analysed
  )
  expect_equal(
    test_globalenv_vars$sector_list,
    c(cfg$default$sectors$tech_roadmap_sectors, cfg$default$sectors$pacta_sectors_not_analysed)
  )
  expect_equal(
    test_globalenv_vars$pacta_sectors_not_analysed,
    cfg$default$sectors$pacta_sectors_not_analysed
  )
  expect_equal(
    test_globalenv_vars$scenario_sources_list,
    cfg$default$scenario_sources_list
  )
  expect_equal(
    test_globalenv_vars$scenario_geographies_list,
    cfg$default$scenario_geography_list
  )
  expect_equal(
    test_globalenv_vars$asset_types,
    cfg$default$asset_types
  )
  expect_equal(
    test_globalenv_vars$equity_market_list,
    cfg$default$equity_market_list
  )
  expect_equal(
    test_globalenv_vars$green_techs,
    cfg$default$sectors$green_techs
  )
  expect_equal(
    test_globalenv_vars$alignment_techs,
    cfg$default$sectors$alignment_techs
  )
  expect_equal(
    test_globalenv_vars$has_map,
    TRUE
  )
  expect_equal(
    test_globalenv_vars$has_credit,
    TRUE
  )
  expect_equal(
    test_globalenv_vars$has_revenue,
    TRUE
  )
  expect_equal(
    test_globalenv_vars$inc_emission_factors,
    TRUE
  )
})
