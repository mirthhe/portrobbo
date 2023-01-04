#' uniq_call
#'
#' @param column The column to count unique values on
#'
#' @return Number
#' @export
#'
#' @examples
uniq_val <- function(column){
  length(unique(column))
}
