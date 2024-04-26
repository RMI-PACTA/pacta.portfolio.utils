test_that("removes the specified object if it exists", {
  test_obj <- 1L
  remove_if_exists(test_obj)
  expect_false(exists("test_obj"))
})

test_that("does not error if the object does not exist", {
  expect_no_error(remove_if_exists(test_obj))
})
