test_that("writes to log_path as expected", {
  msg <- withr::with_tempdir({
    log_path <- getwd()
    write_log("Hello World!", log_path)
    readLines(file.path(log_path, "error_messages.txt"))
  })

  expect_match(msg, "Hello World!")
})

test_that("multiplication works", {
  expect_warning(warn <- write_log("Hello World!"))
})
