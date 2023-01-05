#' graph_jitter
#'
#' @param numb Amount of jitter
#'
#' @return Standard input for geom_point's position
#' @importFrom ggplot2 position_jitter
#' @export
#'
#' @examples
#' graph_jitter(0.2)
graph_jitter <- function(numb){
  position_jitter(width = numb, height = numb, seed = 123)
}
