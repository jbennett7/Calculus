#' Book-wide serif theme with no grid or panel border.
theme_calc <- function(axis_text = 10, axis_title = 12) {
    theme_bw(base_family = "serif") +
        theme(
            panel.grid = element_blank(),
            panel.border = element_blank(),
            axis.text = element_text(size = axis_text),
            axis.title = element_text(size = axis_title)
        )
}
