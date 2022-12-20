save_csv_rds <- function(df, output, rownames = FALSE){
  write.csv(df, paste0(output, ".csv"), row.names = rownames)
  saveRDS(df, file=paste0(output, ".rds"))
}
