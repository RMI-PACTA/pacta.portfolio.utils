test_that("gets build version from `build_version` env var", {
  result <-
    withr::with_envvar(
      new = c("build_version" = "1.2.3"),
      code = get_build_version()
    )
  expect_equal(result, "v1.2.3")
})

test_that("returns `NA` if `build_version` is empty or doesn't exist", {
  result <-
    withr::with_envvar(
      new = c("build_version" = ""),
      code = get_build_version()
    )
  expect_equal(result, NA_character_)

  result <-
    withr::with_envvar(
      new = c("build_version" = NA),
      code = get_build_version()
    )
  expect_equal(result, NA_character_)
})
