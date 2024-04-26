test_that("multiplication works", {
  portfolio_name_ref_all <- "test_port_name"
  project_location = "test_location"

  create_portfolio_subfolders(
    portfolio_name_ref_all = portfolio_name_ref_all,
    project_location = project_location
  )

  expected_dirs <-
    c(
      file.path(project_location, "00_Log_Files", portfolio_name_ref_all),
      file.path(project_location, "30_Processed_Inputs", portfolio_name_ref_all),
      file.path(project_location, "40_Results", portfolio_name_ref_all),
      file.path(project_location, "50_Outputs", portfolio_name_ref_all)
    )

  expect_true(all(dir.exists(expected_dirs)))
})
