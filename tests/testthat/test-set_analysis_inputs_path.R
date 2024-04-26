test_that("sets appropriate global variables", {
  data_location_ext <- "xxx"

  output <-
    callr::r(
      func = function(set_analysis_inputs_path, data_location_ext) {
        set_analysis_inputs_path(data_location_ext)
      },
      args = list(set_analysis_inputs_path, data_location_ext)
    )

  expect_equal(output, data_location_ext)
})

test_that("sets appropriate global variables", {
  data_location_ext <- "xxx"
  proj_data_location_ext <- "yyy"

  output <-
    callr::r(
      func = function(set_analysis_inputs_path,
                      data_location_ext,
                      proj_data_location_ext) {
        .GlobalEnv$proj_data_location_ext <- proj_data_location_ext
        set_analysis_inputs_path(data_location_ext)
      },
      args = list(
        set_analysis_inputs_path,
        data_location_ext,
        proj_data_location_ext
      )
    )

  expect_equal(output, proj_data_location_ext)
})

test_that("returns expected value when overridden by a global variable", {
  data_location_ext <- "xxx"
  port_holdings_date <- "zzz"

  output <-
    callr::r(
      func = function(set_analysis_inputs_path,
                      data_location_ext,
                      port_holdings_date) {
        .GlobalEnv$port_holdings_date <- port_holdings_date
        set_analysis_inputs_path(data_location_ext)
      },
      args = list(
        set_analysis_inputs_path,
        data_location_ext,
        port_holdings_date
      )
    )

  expect_equal(output, paste0("../pacta-data/", port_holdings_date))
})
