test_that("returns proper message when `build_version` env var is set", {
  result <-
    withr::with_envvar(
      new = c("build_version" = "1.2.3"),
      code = get_build_version_msg()
    )
  expect_equal(result, " (Docker build v1.2.3)")
})

test_that("returns empty message when `build_version` env var is blank or not set", {
  result <-
    withr::with_envvar(
      new = c("build_version" = ""),
      code = get_build_version_msg()
    )
  expect_equal(result, "")

  result <-
    withr::with_envvar(
      new = c("build_version" = NA),
      code = get_build_version_msg()
    )
  expect_equal(result, "")
})
