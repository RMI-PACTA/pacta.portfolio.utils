test_that("sets appropriate global variables", {
  cfg <-
    list(
      default = list(
        paths = list(
          data_location_ext = "test_data_location_ext",
          template_location = "test_template_location",
          user_data_location = "test_user_data_location"
        )
      )
    )

  config_path <- withr::local_file("config.yml")
  yaml::write_yaml(x = cfg, file = config_path)

  test_globalenv_vars <-
    callr::r(
      func = function(set_web_parameters, config_path) {
        set_web_parameters(config_path)
        as.list.environment(.GlobalEnv)
      },
      args = list(set_web_parameters, config_path)
    )

  expect_equal(
    test_globalenv_vars$data_location_ext,
    cfg$default$paths$data_location_ext
  )
  expect_equal(
    test_globalenv_vars$template_path,
    cfg$default$paths$template_location
  )
  expect_equal(
    test_globalenv_vars$user_results_path,
    cfg$default$paths$user_data_location
  )
})
