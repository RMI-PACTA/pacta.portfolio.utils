test_that("single unique holdings date does not error", {
  expect_no_error(check_grouped_portfolio_years("2023Q4"))
  expect_no_error(check_grouped_portfolio_years(c("2023Q4")))
  expect_no_error(check_grouped_portfolio_years(c("2023Q4", "2023Q4")))
})

test_that("multiple unique holdings date throws error", {
  expect_error(check_grouped_portfolio_years(c("2022Q4", "2023Q4")))
})
