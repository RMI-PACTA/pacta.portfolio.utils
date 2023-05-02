convert_user_errors_to_md <- function(
    errors,
    header_level = 3) {
  name_prefix <- paste(rep("#", header_level), collapse = "")
  action_prefix <- paste(rep("#", header_level + 1), collapse = "")
  all_error_texts <- list()
  for (error in errors) {
    section_names <- names(error)
    # Prepare section header
    if ("name" %in% section_names) {
      header <- paste(name_prefix, error[["name"]])
    } else {
      header <- paste(name_prefix, "Unclassified Error")
    }
    section <- list(header = header)
    # Add description
    if ("description" %in% section_names) {
      description <- paste("**Description:**", error[["description"]])
      section <- c(section, description = description)
    }
    # Suggested actions
    if ("action" %in% section_names) {
      action <- paste0(
        action_prefix,
        " Suggested Action", "\n\n",
        error[["action"]]
      )
      section <- c(section, action = action)
    }
    error_text <- paste(section, collapse = "\n\n")
    all_error_texts <- c(all_error_texts, error_text)
  }
  all_error_texts <- paste(all_error_texts, collapse = "\n\n")
  return(all_error_texts)
}
