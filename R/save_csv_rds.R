#' save_csv_rds
#'
#' @param df dataframe to save as csv and rds
#' @param output output location including filename
#' @param rownames rownames or not
#'
#' @return A csv and rds file
#' @export
#' @importFrom utils write.csv
#'
#' @examples
#' save_csv_rds(covid19, "covid19")
save_csv_rds <- function(df, output, rownames = FALSE){
  write.csv(df, paste0(output, ".csv"), row.names = rownames)
  saveRDS(df, file=paste0(output, ".rds"))
}
