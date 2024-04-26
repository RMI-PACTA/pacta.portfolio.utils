test_that("sets appropriate global variables", {
  test_globalenv_vars <-
    callr::r(
      func = function(set_webtool_paths) {
        .GlobalEnv$working_location <- "test_wd"
        .GlobalEnv$portfolio_name_ref_all <- "test_port_name"
        set_webtool_paths()
        as.list.environment(.GlobalEnv)
      },
      args = list(set_webtool_paths)
    )

  expect_equal(
    test_globalenv_vars$project_location,
    "test_wd/working_dir"
  )
  expect_equal(
    test_globalenv_vars$log_path,
    "test_wd/working_dir/00_Log_Files/test_port_name"
  )
  expect_equal(
    test_globalenv_vars$par_file_path,
    "test_wd/working_dir/10_Parameter_File"
  )
  expect_equal(
    test_globalenv_vars$raw_input_path,
    "test_wd/working_dir/20_Raw_Inputs"
  )
  expect_equal(
    test_globalenv_vars$proc_input_path,
    "test_wd/working_dir/30_Processed_Inputs"
  )
  expect_equal(
    test_globalenv_vars$results_path,
    "test_wd/working_dir/40_Results"
  )
  expect_equal(
    test_globalenv_vars$outputs_path,
    "test_wd/working_dir/50_Outputs"
  )
})
