get_build_version <- function(env_var = "build_version") {
  build_version <- Sys.getenv(env_var)
  ifelse(nzchar(build_version), paste0("v", build_version), NA_character_)
}
