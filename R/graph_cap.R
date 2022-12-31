#' graph_cap
#'
#' @param content Caption content
#'
#' @return Caption that fits well in the graph
#' @export
#' @importFrom stringr str_wrap
#'
#' @examples
graph_cap <- function(content){
  str_wrap(content, 80)
}
