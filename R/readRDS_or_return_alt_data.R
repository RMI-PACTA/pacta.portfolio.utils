readRDS_or_return_alt_data <- function(filepath, alt_return = NULL) {
  if (file.exists(filepath)) {
    return(readRDS(filepath))
  }
  alt_return
}
