test_that("returns a data frame with 1 row filled with `NA`s", {
  expect_s3_class(empty_audit_file(), class = "data.frame")
  expect_equal(nrow(empty_audit_file()), 1L)
  expect_true(all(is.na(unlist(empty_audit_file()))))
})
