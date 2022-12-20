#' Title
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
#' mydata <- data.frame(col1 = c("val1", "val2", "val3"), col2 = c("val1", "val2", "val3"))
#' save_csv_rds(mydata, "mydata")
save_csv_rds <- function(df, output, rownames = FALSE){
  write.csv(df, paste0(output, ".csv"), row.names = rownames)
  saveRDS(df, file=paste0(output, ".rds"))
}
