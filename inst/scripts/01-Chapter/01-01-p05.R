devtools::load_all('.')

segments <- data.frame(x = c(-2, 0), y = c(-1, 1), xend = c(0, 2), yend = c(-1, 1))
open_pts <- data.frame(x = c(0, 0), y = c(-1, 1))
filled_pts <- data.frame(x = numeric(0), y = numeric(0))

ex1_1_limits_from_graphs_plot(segments, open_pts, filled_pts,
                              "inst/figures/01-Chapter/01-01-p05.png")
