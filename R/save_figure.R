#' save a figure at the book's standard size.
save_figure <- function(p, filename, width = 3.5, height = 2.2) {
    ggsave(filename, plot = p, width = width, height = height,
           dpi = 300, bg = "white")
}
