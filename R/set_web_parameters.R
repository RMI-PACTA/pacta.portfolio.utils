set_web_parameters <- function(file_path) {
  cfg <- config::get(file = file_path)

  .GlobalEnv$project_location_ext <- cfg$paths$project_location_ext
  .GlobalEnv$data_location_ext <- cfg$paths$data_location_ext
  .GlobalEnv$template_path <- cfg$paths$template_location
  .GlobalEnv$user_results_path <- cfg$paths$user_data_location

  .GlobalEnv$new_data <- cfg$parameters$new_data

  .GlobalEnv$financial_timestamp <- cfg$parameters$financial_timestamp
}
