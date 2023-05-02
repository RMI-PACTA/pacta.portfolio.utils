#' A short description of the function
#'
#' A longer description of the function
#'
#' @param project_root_dir A description of the argument
#'
#' @return A description of the return value
#'
#' @export

set_webtool_paths <- function(project_root_dir = "working_dir") {
  .GlobalEnv$project_location <- file.path(.GlobalEnv$working_location, project_root_dir)

  .GlobalEnv$log_path <- file.path(.GlobalEnv$project_location, "00_Log_Files", .GlobalEnv$portfolio_name_ref_all)
  .GlobalEnv$par_file_path <- file.path(.GlobalEnv$project_location, "10_Parameter_File")
  .GlobalEnv$raw_input_path <- file.path(.GlobalEnv$project_location, "20_Raw_Inputs")
  .GlobalEnv$proc_input_path <- file.path(.GlobalEnv$project_location, "30_Processed_Inputs")
  .GlobalEnv$results_path <- file.path(.GlobalEnv$project_location, "40_Results")
  .GlobalEnv$outputs_path <- file.path(.GlobalEnv$project_location, "50_Outputs")
}
