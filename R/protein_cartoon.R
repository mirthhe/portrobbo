#' protein_cartoon
#'
#' @param mydata File path to pdb file
#'
#' @return 3D structural visualization of the protein in cartoon style
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
      antialias = FALSE)) %>%
    # Adding the protein
    m_add_model(data = mydata, format = "pdb") %>%
    # Center the protein at first
    m_zoom_to() %>%
    # Set style of structures
    m_set_style(style = m_style_cartoon(color = "#00cc96")) %>%
    # Set style of specific selection (selecting by secondary)
    m_set_style(
      sel = m_sel(ss = "s"),
      style = m_style_cartoon(color = "#636efa", arrows = TRUE)) %>%
    # Style the alpha helix
    m_set_style(
      sel = m_sel(ss = "h"), # Style alpha helix
      style = m_style_cartoon(color = "#ff7f0e")) %>%
    # Rotate the scene by given angle on given axis
    m_rotate(angle = 90, axis = "y")
}
