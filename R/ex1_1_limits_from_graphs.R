ex1_1_limits_from_graphs_plot <- function(segments, open_pts, filled_pts,
                                          filename, xlab = "x", ylab = "y") {
    x_lim <- c(min(segments$x), max(segments$xend))
    y_lim <- c(min(segments$y), max(segments$yend))
  
    p <- ggplot() +
      calc_axes() +
      graph_segments(segments) +
      open_points(open_pts) +
      filled_points(filled_pts) +
      scale_x_continuous(limits = x_lim) +
      scale_y_continuous(breaks = seq(y_lim[1], y_lim[2], 1), limits = y_lim) +
      coord_fixed(ratio = 1) +
      labs(x = xlab, y = ylab) +
      theme_calc()

  save_figure(p, filename)
}


