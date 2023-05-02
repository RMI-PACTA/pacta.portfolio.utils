prepare_error_report <- function(
    report_template = file.path("inst", "rmd", "user_errors.Rmd"),
    error_file = file.path(html_directory, "user_errors.json"),
    html_directory = file.path(.GlobalEnv$outputs_path, .GlobalEnv$portfolio_name_ref_all, "report"),
    file_name = "index.html") {
  if (file.exists(error_file)) {
    errors <- jsonlite::read_json(path = error_file)
  } else {
    stop("user errors file cannot be found.")
  }
  if (!dir.exists(html_directory)) {
    dir.create(html_directory)
  }

  output_file <- file.path(html_directory, file_name)
  rmarkdown::render(
    input = report_template,
    output_file = output_file,
    params = list(errors = errors)
  )

  pdf_directory <- file.path(dirname(html_directory), "executive_summary")
  if (!dir.exists(pdf_directory)) {
    dir.create(pdf_directory)
  }

  output_file <- file.path(pdf_directory, "template.pdf")
  rmarkdown::render(
    input = report_template,
    output_format = "pdf_document",
    output_file = output_file,
    params = list(errors = errors)
  )
}
