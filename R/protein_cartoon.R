#' protein_cartoon
#'
#' @param mydata R object of PDB file made using readLines
#'
#' @return 3D structural visualization of the protein in cartoon style with PyMOL colouring
#' @export
#' @import r3dmol
#'
#' @examples
#' protein_cartoon(kinesin)
protein_cartoon <- function(mydata){
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
    m_set_style(style = m_style_cartoon(color = "#3aff3a")) %>%
    # Set style of specific selection
    m_set_style(
      sel = m_sel(ss = "s"), # Style beta sheets
      style = m_style_cartoon(color = "#3aff3a", arrows = TRUE)) %>%
    # Style the alpha helix
    m_set_style(
      sel = m_sel(ss = "h"), # Style alpha helix
      style = m_style_cartoon(color = "#3aff3a")) %>%
    # Rotate the scene by given angle on given axis
    m_rotate(angle = 90, axis = "y")
}
