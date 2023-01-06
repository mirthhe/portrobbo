#' prot_vis
#'
#' @param data File path to pdb file
#' @param style "Cartoon", "spheres" or "sticks"
#'
#' @return 3D structural visualisation of the protein
#' @export
#' @import r3dmol
#'
#' @examples
#' prot_vis(kinesin, "cartoon")
prot_vis <- function(data, style){
  protein <- readLines(data)

  r3dmol(
    viewer_spec = m_viewer_spec(
      # How far user can zoom in
      lowerZoomLimit = 30,
      # How far user can zoom out
      upperZoomLimit = 400,
      # Decrease quality to improve performance
      antialias = FALSE)) %>%
    # Adding the protein
    m_add_model(data = protein, format = "pdb") %>%
    # Center the protein at first
    m_zoom_to() %>%
    if (style == "cartoon"){
      # Set style of structures
      m_set_style(style = m_style_cartoon(color = "#00cc96")) %>%
      # Set style of specific selection (selecting by secondary)
      m_set_style(
        sel = m_sel(ss = "s"),
        style = m_style_cartoon(color = "#636efa", arrows = TRUE)) %>%
      # Style the alpha helix
      m_set_style(
        sel = m_sel(ss = "h"), # Style alpha helix
        style = m_style_cartoon(color = "#ff7f0e"))}
    else if (style == "spheres") {
      # Set style of structures
      m_set_style(style = m_style_sphere()) }
    else if (style == "sticks"){
      m_set_style(style = m_style_stick())
    } %>%
    # Rotate the scene by given angle on given axis
    m_rotate(angle = 90, axis = "y")
}
