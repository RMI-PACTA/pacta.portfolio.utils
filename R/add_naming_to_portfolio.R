add_naming_to_portfolio <- function(portfolio_raw) {
  portfolio_raw$portfolio_name <- .GlobalEnv$portfolio_name
  portfolio_raw$investor_name <- .GlobalEnv$investor_name

  return(portfolio_raw)
}
