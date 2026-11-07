devtools::load_all('.')

theta <- seq(0, pi, length.out = 100)
p <- ggplot() +
    calc_axes() +
    geom_segment(aes(x = -1, y = -1, xend = 0, yend = 0),
                 color = "blue", linewidth = 0.5) +
    geom_curve(aes(x = 0, y = 0, xend = 1, yend = -2),
               curvature = -0.3, color = "blue", linewidth = 0.5) +
    geom_path(aes(x = 2 + 1 * cos(theta), y = 0 + 1 * sin(theta)),
              color = "blue", linewidth = 0.5) +
    open_points(data.frame(x = c(1, 2), y = c(-2, 1))) +
    filled_points(data.frame(x = c(-1, 0, 1, 2, 3), y = c(-1, 0, 0, 0, 0))) +
    scale_x_continuous(limits = c(-1, 3)) +
    scale_y_continuous(limits = c(-2, 1)) +
    coord_fixed(ratio = 1) +
    labs(x = "x", y = "y") +
    theme_calc()

save_figure(p, "inst/figures/01-Chapter/01-01-p04.png", height = 2.8)
