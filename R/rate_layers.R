#' Secant line through (a, f(a)) and (b, f(b)), extended `ext[1]` to the left
#' of a and `ext[2]` to the right of b.
secant_line <- function(f, a, b, ext = c(0, 0), color = "red", linewidth = 0.5) {
    stopifnot(a != b)
    m <- (f(b) - f(a)) / (b - a)
    ext <- rep_len(ext, 2)
    x <- c(a - ext[1], b + ext[2])
    annotate("segment", x = x[1], y = f(a) + m * (x[1] - a),
             xend = x[2], yend = f(a) + m * (x[2] - a),
             color = color, linewidth = linewidth)
}

#' Tangent line at x = a. Uses the derivative `fprime` if given, otherwise a
#' central-difference estimate. Drawn from a - left to a + right.
tangent_line <- function(f, a, left = 1, right = 1, fprime = NULL, h = 1e-5,
                         color = "darkgreen", linewidth = 0.5) {
    m <- if (is.null(fprime)) (f(a + h) - f(a - h)) / (2 * h) else fprime(a)
    annotate("segment", x = a - left, y = f(a) - m * left,
             xend = a + right, yend = f(a) + m * right,
             color = color, linewidth = linewidth)
}

#' Dashed run and rise from (a, f(a)) to (b, f(b)).
rise_run <- function(f, a, b, color = "gray40") {
    list(
        annotate("segment", x = a, y = f(a), xend = b, yend = f(a),
                 linetype = "dashed", color = color),
        annotate("segment", x = b, y = f(a), xend = b, yend = f(b),
                 linetype = "dashed", color = color)
    )
}

#' Successive secant lines through P = (a, f(a)) and Q_k = (b, f(b)) for each b
#' in `bs` (farthest first). Every line is drawn over the same x-range `xlim`,
#' so the lines fan out from P and visibly rotate. Lines darken as Q_k nears P.
#'   curve_arrows: arrows along the curve showing Q_k moving toward P
#'                 (`offset` shifts them off the curve vertically).
#'   rotate_arrow: a curved arrow at the right end of the lines, from the first
#'                 secant to the tangent, showing the direction the lines turn.
secant_sequence <- function(f, a, bs, xlim, colors = NULL, linewidth = 0.4,
                            point_size = 1.2, curve_arrows = TRUE, offset = 0,
                            gap = 0.15, rotate_arrow = TRUE, curvature = -0.4,
                            h = 1e-5) {
    n <- length(bs)
    if (is.null(colors)) colors <- grDevices::gray.colors(n, start = 0.75, end = 0.3)
    head <- grid::arrow(length = grid::unit(0.05, "inches"), type = "closed")

    layers <- lapply(seq_len(n), function(k)
        secant_line(f, a, bs[k], ext = c(a - xlim[1], xlim[2] - bs[k]),
                    color = colors[k], linewidth = linewidth))
    layers <- c(layers, list(
        annotate("point", x = bs, y = f(bs), color = colors, size = point_size)))

    if (curve_arrows && n > 1) {
        for (k in seq_len(n - 1)) {
            span <- bs[k + 1] - bs[k]
            t <- seq(bs[k] + gap * span, bs[k + 1] - gap * span, length.out = 30)
            layers <- c(layers, list(
                annotate("path", x = t, y = f(t) + offset, linewidth = 0.3,
                         arrow = head)))
        }
    }

    if (rotate_arrow) {
        d  <- xlim[2] - a
        m1 <- (f(bs[1]) - f(a)) / (bs[1] - a)
        mt <- (f(a + h) - f(a - h)) / (2 * h)
        layers <- c(layers, list(
            annotate("curve", x = xlim[2], y = f(a) + m1 * d,
                     xend = xlim[2], yend = f(a) + mt * d,
                     curvature = curvature, linewidth = 0.3, arrow = head)))
    }
    layers
}
