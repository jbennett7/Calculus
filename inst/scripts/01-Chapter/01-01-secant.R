devtools::load_all('.')

f <- function(x) 0.25 * x^2 + 1
a <- 1
b <- 4
m <- (f(b) - f(a)) / (b - a)               # slope of the secant line
secant <- function(x) f(a) + m * (x - a)

p <- ggplot() +
    calc_axes() +
    # dotted guides from P and Q down to a and b
    annotate("segment", x = c(a, b), y = 0, xend = c(a, b), yend = c(f(a), f(b)),
             linetype = "dotted", color = "gray50") +
    # the curve y = f(x)
    stat_function(fun = f, xlim = c(0, 5), color = "blue", linewidth = 0.5) +
    # the secant line through P and Q, extended past both points
    secant_line(f, a, b, ext = c(.7, 2)) +
    rise_run(f, a, b) +
    annotate("text", x = (a + b) / 2, y = f(a) - 0.3, label = "Delta*x == b - a",
             parse = TRUE, family = "serif", size = 3) +
    annotate("text", x = b + 0.1, y = (f(a) + f(b)) / 2, hjust = 0,
             label = "Delta*y == f(b) - f(a)", parse = TRUE, family = "serif", size = 3) +
    # P and Q
    filled_points(data.frame(x = c(a, b), y = c(f(a), f(b)))) +
    annotate("text", x = a - 0.15, y = f(a) + 0.35, label = "P", family = "serif", size = 3) +
    annotate("text", x = b - 0.2,  y = f(b) + 0.35, label = "Q", family = "serif", size = 3) +
    # labels for the two lines
    annotate("text", x = 4.7, y = f(5), label = "y == f(x)", parse = TRUE,
             hjust = 1, family = "serif", size = 3, color = "blue") +
    annotate("text", x = 5.2, y = secant(5.2) - 0.8, label = "secant line", hjust = 0,
             family = "serif", size = 3, color = "red") +
    scale_x_continuous(breaks = c(a, b), labels = c("a", "b")) +
    scale_y_continuous(breaks = NULL) +
    coord_cartesian(xlim = c(0, 6.6), ylim = c(0, 7.6), expand = FALSE) +
    labs(x = "x", y = "y") +
    theme_calc()

save_figure(p, "inst/figures/01-Chapter/01-01-secant.png", height = 2.8)
