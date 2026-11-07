devtools::load_all('.')

f <- function(x) 0.25 * x^2 + 1
a <- 1
bs <- c(4, 3, 2.2, 1.6)
xl <- c(0.3, 4.8)

p <- ggplot() +
    calc_axes() +
    stat_function(fun = f, xlim = c(0, 4.4), color = "blue", linewidth = 0.5) +
    secant_sequence(f, a, bs, xlim = xl, offset = -0.35) +
    tangent_line(f, a, left = a - xl[1], right = xl[2] - a) +
    filled_points(data.frame(x = a, y = f(a))) +
    annotate("text", x = a - 0.1, y = f(a) + 0.35, label = "P", family = "serif", size = 3) +
    annotate("text", x = bs - 0.05, y = f(bs) + 0.4, hjust = 1, family = "serif", size = 2.6,
             label = paste0("Q[", seq_along(bs), "]"), parse = TRUE) +
    annotate("text", x = xl[2], y = f(a) + 0.5 * (xl[2] - a) - 0.4, label = "tangent",
             hjust = 1, family = "serif", size = 3, color = "darkgreen") +
    scale_x_continuous(breaks = NULL) +
    scale_y_continuous(breaks = NULL) +
    coord_cartesian(xlim = c(0, 5.6), ylim = c(0, 6.6), expand = FALSE) +
    labs(x = "x", y = "y") +
    theme_calc()

save_figure(p, "inst/figures/01-Chapter/01-01-secants-to-tangent.png", height = 2.8)
