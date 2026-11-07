devtools::load_all('.')

segments <- data.frame(
  x    = c(-1, 0, 1),
  y    = c(-1, 0, 0),
  xend = c(0, 1, 2),
  yend = c(0, -1, 1)
)

open_pts <- data.frame(x = c(0, 1), y = c(0, -1))
filled_pts <- data.frame(x = c(-1, 0, 1, 2), y = c(-1, 1, 0, 1))

ex1_1_limits_from_graphs_plot(segments, open_pts, filled_pts,
                              "inst/figures/01-Chapter/01-01-p03.png")
