#' protein_cartoon
#'
#' @param pdbobject R object of PDB file made using readLines
#'
#' @return 3D structural visualization of the protein in cartoon style with PyMOL colouring
#' @export
#' @import r3dmol
#'
#' @examples
#' protein_cartoon(kinesin)
protein_cartoon <- function(pdbobject){
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
    m_add_model(data = pdbobject, format = "pdb") %>%
    # Center the protein at first
    m_zoom_to() %>%
    # Set style of structures
    m_set_style(
      sel = m_sel(ss = "s"), # Style beta sheets
      style = m_style_cartoon(color = "#3aff3a", arrows = TRUE)) %>%
    m_set_style(
      sel = m_sel(ss = "h"), # Style alpha helix
      style = m_style_cartoon(color = "#3aff3a")) %>%
    # Set style of atoms
    m_set_style(
      sel = m_sel(elem = "C"), # Style carbon
      style = m_style_cartoon(color = "#33ff33")) %>%
    m_set_style(
      sel = m_sel(elem = "N"), # Style nitrogen
      style = m_style_cartoon(color = "#3333ff")) %>%
    m_set_style(
      sel = m_sel(elem = "O"), # Style oxygen
      style = m_style_cartoon(color = "#ff4c4c")) %>%
    m_set_style(
      sel = m_sel(elem = "S"), # Style sulfur
      style = m_style_cartoon(color = "#e5c53f")) %>%
    m_set_style(
      sel = m_sel(elem = "P"), # Style phosphorus
      style = m_style_cartoon(color = "#ff7f00")) %>%
    m_set_style(
      sel = m_sel(elem = "MG"), # Style magnesium
      style = m_style_cartoon(color = "#8aff00")) %>%
    # Rotate the scene by given angle on given axis
    m_rotate(angle = 90, axis = "y")
}
