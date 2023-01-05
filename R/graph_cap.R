#' graph_cap
#'
#' @param content Caption content
#'
#' @return Caption that fits well in the graph
#' @export
#' @importFrom stringr str_wrap
#'
#' @examples
#' graph_cap("Figure 1. The caption can include any string of any length and will be shortened to a length suitable for the size of a graph.")
graph_cap <- function(content){
  str_wrap(content, 80)
}
