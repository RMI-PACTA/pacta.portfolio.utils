test_that("properly saves a RDS if the object exists", {
  portfolio_name <- "test"
  df <- data.frame(portfolio_name = portfolio_name)
  save_name <- withr::local_file("test.rds")

  save_if_exists(df = df, portfolio_name = portfolio_name, save_name = save_name)

  expect_true(file.exists(save_name))
  expect_equal(df, readRDS(save_name))
})

test_that("properly saves a CSV if the object exists", {
  portfolio_name <- "test"
  df <- data.frame(portfolio_name = portfolio_name)
  save_name <- withr::local_file("test.csv")

  save_if_exists(
    df = df,
    portfolio_name = portfolio_name,
    save_name = save_name,
    csv_or_rds = "csv"
  )

  expect_true(file.exists(save_name))
  expect_equal(df, read.csv(save_name))
})

test_that("does nothing if the object is not a data frame", {
  portfolio_name <- "test"
  df <- 1L
  save_name <- "test.rds"

  save_if_exists(
    df = df,
    portfolio_name = portfolio_name,
    save_name = save_name
  )

  expect_false(file.exists(save_name))
})
