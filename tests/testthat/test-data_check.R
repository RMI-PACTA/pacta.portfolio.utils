test_that("returns `TRUE` if input is a data frame with > 0 rows", {
  expect_true(data_check(data.frame(x = 1)))
  expect_true(data_check(tibble::tibble(x = 1)))
})

test_that("returns `FALSE` if input is not a data frame", {
  expect_false(data_check(1L))
  expect_false(data_check(2.3))
  expect_false(data_check("ABC"))
  expect_false(data_check(c("ABC", "XYZ")))
  expect_false(data_check(list(x = "ABC")))
})

test_that("returns `FALSE` if input does not have > 0 rows", {
  expect_false(data_check(data.frame()))
  expect_false(data_check(tibble::tibble()))
})
