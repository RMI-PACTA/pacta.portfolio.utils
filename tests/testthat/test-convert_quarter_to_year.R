test_that("properly converts a single unique quarter string to a year integer", {
  expect_equal(convert_quarter_to_year("2019Q4"), 2019L)
  expect_equal(convert_quarter_to_year("2020Q4"), 2020L)
  expect_equal(convert_quarter_to_year("2021Q4"), 2021L)
  expect_equal(convert_quarter_to_year("2022Q4"), 2022L)
  expect_equal(convert_quarter_to_year("2023Q4"), 2023L)
  expect_equal(convert_quarter_to_year(c("2023Q4")), 2023L)
  expect_equal(convert_quarter_to_year(c("2023Q4", "2023Q4")), 2023L)
})

test_that("errors if the quarter string is invalid", {
  expect_error(convert_quarter_to_year("23Q4"))
  expect_error(convert_quarter_to_year("20199Q4"))
  expect_error(convert_quarter_to_year("2019Q"))
  expect_error(convert_quarter_to_year("2019Q5"))
  expect_error(convert_quarter_to_year("2019_Q4"))
})
