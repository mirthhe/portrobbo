#' protein_stick
#'
#' @param pdbobject R object of PDB file made using readLines
#'
#' @return 3D structural visualization of the protein in stick style
#' @export
#' @import r3dmol
#'
#' @examples
#' protein_stick(kinesin)
protein_stick <- function(pdbobject){
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
    # Set style of atoms
    m_set_style(
      sel = m_sel(elem = "C"), # Style carbon
      style = m_style_stick(color = "#33ff33")) %>%
    m_set_style(
      sel = m_sel(elem = "N"), # Style nitrogen
      style = m_style_stick(color = "#3333ff")) %>%
    m_set_style(
      sel = m_sel(elem = "O"), # Style oxygen
      style = m_style_stick(color = "#ff4c4c")) %>%
    m_set_style(
      sel = m_sel(elem = "S"), # Style sulfur
      style = m_style_stick(color = "#e5c53f")) %>%
    m_set_style(
      sel = m_sel(elem = "P"), # Style phosphorus
      style = m_style_stick(color = "#ff7f00")) %>%
    m_set_style(
      sel = m_sel(elem = "MG"), # Style magnesium
      style = m_style_stick(color = "#8aff00")) %>%
    # Rotate the scene by given angle on given axis
    m_rotate(angle = 90, axis = "y")
}
