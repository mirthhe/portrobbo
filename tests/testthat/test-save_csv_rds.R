test_that("save_csv_rds saves csv and rds", {
  mydata <- data.frame(col1 = c("val1", "val2", "val3"), col2 = c("val1", "val2", "val3"))
  save_csv_rds(mydata, "mydata")
})
