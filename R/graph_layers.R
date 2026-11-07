#' Gray x- and y-axis lines through the origin.
calc_axes <- function(color = "gray70") {
    list(
        geom_hline(yintercept = 0, color = color),
        geom_vline(xintercept = 0, color = color)
    )
}

#' Straight pieces of a graph; `df` has columns x, y, xend, yend.
graph_segments <- function(df, color = "blue", linewidth = 0.5) {
    geom_segment(data = df, aes(x = x, y = y, xend = xend, yend = yend),
                 color = color, linewidth = linewidth)
}

#' Open circles (a point not on the graph); `df` has columns x, y.
open_points <- function(df, color = "blue", size = 0.8) {
    geom_point(data = df, aes(x = x, y = y),
               shape = 21, size = size, stroke = 1, color = color, fill = "white")
}

#' Filled points (the function's value); `df` has columns x, y.
filled_points <- function(df, color = "blue", size = 1.2) {
    geom_point(data = df, aes(x = x, y = y),
               shape = 19, size = size, color = color)
}
