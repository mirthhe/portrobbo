#' uniq_call
#'
#' @param column The column to count unique values of
#'
#' @return Number
#' @export
#'
#' @examples
#' uniq_val(covid19$countryterritoryCode)
uniq_val <- function(column){
  length(unique(column))
}
