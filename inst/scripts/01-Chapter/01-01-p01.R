devtools::load_all('.')


segments <- data.frame(
  x    = c(0, 1, 2, 3),
  y    = c(0, 0, 1, 0),
  xend = c(1, 2, 3, 4),
  yend = c(1, 1, 0, 1)
)

open_pts <- data.frame(x = c(1, 3), y = c(1, 0))
filled_pts <- data.frame(x = c(1, 2), y = c(0, 1))

ex1_1_limits_from_graphs_plot(segments, open_pts, filled_pts,
                              "inst/figures/01-Chapter/01-01-p01.png")

