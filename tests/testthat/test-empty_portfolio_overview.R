test_that("returns a data frame with 1 row filled with `NA`s", {
  expect_s3_class(empty_portfolio_overview(), class = "data.frame")
  expect_equal(nrow(empty_portfolio_overview()), 1L)
  expect_true(all(is.na(unlist(empty_portfolio_overview()))))
})
