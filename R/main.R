# Sample skeleton for custom application
#

#' Main application entrypoint
#'
#' @param datadir Path to data directory.
main <- function(datadir) {
  # read input
  data <- read.csv(file = file.path(datadir, "in/tables/source.csv"));

  # do something very clever
  for (column in colnames(data)) {
    data[[column]] <- gsub("rr", "r", data[[column]])
    data[[column]] <- gsub("r", "w", data[[column]])
    data[[paste0('length_', column)]] <- stringr::str_length(data[[column]])
  }

  # write output
  write.csv(data, file = file.path(datadir, "out/tables/result.csv"), row.names = FALSE)
}
