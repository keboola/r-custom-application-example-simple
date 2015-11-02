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
    data[[column]] <- as.character(data[[column]])
    data[[column]] <- gsub("cc", "c", data[[column]])
    data[[column]] <- gsub("ss", "s", data[[column]])
    data[[column]] <- gsub("c", "th", data[[column]])
    data[[column]] <- gsub("s", "th", data[[column]])
    data[[column]] <- gsub("tt", "t", data[[column]])
    data[[paste0('length_', column)]] <- stringr::str_length(data[[column]])
  }

  # write output
  write.csv(data, file = file.path(datadir, "out/tables/result.csv"), row.names = FALSE)
}
