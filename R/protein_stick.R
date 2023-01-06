#' protein_stick
#'
#' @param mydata R object of PDB file made using readLines
#'
#' @return 3D structural visualization of the protein in stick style
#' @export
#' @import r3dmol
#'
#' @examples
#' protein_stick(kinesin)
protein_stick <- function(mydata){
  r3dmol(
    viewer_spec = m_viewer_spec(
      # How far user can zoom in
      lowerZoomLimit = 30,
      # How far user can zoom out
      upperZoomLimit = 400,
      # Decrease quality to improve performance
      antialias = FALSE,
      disableFog = TRUE,
      backgroundColor = "black")) %>%
    # Adding the protein
    m_add_model(data = mydata, format = "pdb") %>%
    # Center the protein at first
    m_zoom_to() %>%
    # Set style of structures
    m_set_style(style = m_style_stick()) %>%
    # Rotate the scene by given angle on given axis
    m_rotate(angle = 90, axis = "y")
}
