test_quit_if_no_pacta_relevant_data <-
  function(tmp_dir, port_name, asset_type, has_asset_level_data, has_ald_in_fin_sector) {
    devtools::load_all()
    port_with_no_data <-
      data.frame(
        asset_type = asset_type,
        has_asset_level_data = has_asset_level_data,
        has_ald_in_fin_sector = has_ald_in_fin_sector
      )
    outputs_path <<- tmp_dir
    portfolio_name_ref_all <<- port_name
    log_path <<- outputs_path
    report_path <- file.path(outputs_path, portfolio_name_ref_all, "report")
    dir.create(path = report_path, recursive = TRUE)
    setwd(here::here())
    quit_if_no_pacta_relevant_data(port_with_no_data)
    TRUE
  }

test_that("quits if no ABCD in Equity in non-interactive", {
  skip_if_R_CMD_check()

  tmp_dir <- withr::local_tempdir()
  port_name <- "TestPort"
  asset_type <- "Equity"
  has_asset_level_data <- FALSE
  has_ald_in_fin_sector <- FALSE

  expect_null({
    callr::r(
      func = test_quit_if_no_pacta_relevant_data,
      args = list(tmp_dir, port_name, asset_type, has_asset_level_data, has_ald_in_fin_sector)
    )
  })

  expect_true(file.exists(file.path(tmp_dir, port_name, "report", "user_errors.json")))
})

test_that("passes if has ABCD in Equity non-interactive", {
  skip_if_R_CMD_check()

  tmp_dir <- withr::local_tempdir()
  port_name <- "TestPort"
  asset_type <- "Equity"
  has_asset_level_data <- TRUE
  has_ald_in_fin_sector <- FALSE

  expect_true({
    callr::r(
      func = test_quit_if_no_pacta_relevant_data,
      args = list(tmp_dir, port_name, asset_type, has_asset_level_data, has_ald_in_fin_sector)
    )
  })

  expect_false(file.exists(file.path(tmp_dir, port_name, "report", "user_errors.json")))
})

test_that("quits if no ABCD in fin_sector in Bonds in non-interactive", {
  skip_if_R_CMD_check()

  tmp_dir <- withr::local_tempdir()
  port_name <- "TestPort"
  asset_type <- "Bonds"
  has_asset_level_data <- TRUE
  has_ald_in_fin_sector <- FALSE

  expect_null({
    callr::r(
      func = test_quit_if_no_pacta_relevant_data,
      args = list(tmp_dir, port_name, asset_type, has_asset_level_data, has_ald_in_fin_sector)
    )
  })

  expect_true(file.exists(file.path(tmp_dir, port_name, "report", "user_errors.json")))
})

test_that("passes if has ABCD in fin_sector in Bonds non-interactive", {
  skip_if_R_CMD_check()

  tmp_dir <- withr::local_tempdir()
  port_name <- "TestPort"
  asset_type <- "Bonds"
  has_asset_level_data <- TRUE
  has_ald_in_fin_sector <- TRUE

  expect_true({
    callr::r(
      func = test_quit_if_no_pacta_relevant_data,
      args = list(tmp_dir, port_name, asset_type, has_asset_level_data, has_ald_in_fin_sector)
    )
  })

  expect_false(file.exists(file.path(tmp_dir, port_name, "report", "user_errors.json")))
})
