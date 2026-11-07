devtools::load_all('.')
# Exercise 29: x_n = x_{n-1} + cos(x_{n-1}). On the unit circle, the arc from P
# to (0, 1) has length ../..- x, and the horizontal segment from P to the
# y-axis has length cos(x). Near the top they are nearly equal.

x0 <- 1                     # x_{n-1}, the first term
x1 <- x0 + cos(x0)          # x_n = 1.5403
P  <- c(cos(x0), sin(x0))
Q  <- c(cos(x1), sin(x1))

arc <- function(from, to, r = 1, k = 200) {
    t <- seq(from, to, length.out = k)
    data.frame(x = r * cos(t), y = r * sin(t))
}

p <- ggplot() +
    # quarter circle and axes
    geom_path(data = arc(0, pi / 2), aes(x, y), color = "gray60") +
    geom_segment(aes(x = 0, y = 0, xend = 1.08, yend = 0), color = "gray60") +
    geom_segment(aes(x = 0, y = 0, xend = 0, yend = 1.08), color = "gray60") +
    # radius to P and the angle x_{n-1}
    geom_segment(aes(x = 0, y = 0, xend = P[1], yend = P[2]), color = "gray40") +
    geom_path(data = arc(0, x0, r = 0.15), aes(x, y), color = "gray40") +
    annotate("text", x = 0.2, y = 0.12, label = "x[n-1]", parse = TRUE,
             family = "serif", size = 3) +
    # arc from P to (0, 1): length pi/2 - x_{n-1}
    geom_path(data = arc(x0, pi / 2), aes(x, y), color = "red", linewidth = 0.9) +
    annotate("text", x = 0.42, y = 1.04, label = "pi/2 - x[n-1]", parse = TRUE,
             family = "serif", size = 3, color = "red") +
    # horizontal segment from P to the y-axis: length cos x_{n-1}
    geom_segment(aes(x = 0, y = P[2], xend = P[1], yend = P[2]),
                 color = "blue", linewidth = 0.9) +
    annotate("text", x = P[1] / 2, y = P[2] - 0.06, label = "cos~x[n-1]",
             parse = TRUE, family = "serif", size = 3, color = "blue") +
    # points P and the next term x_n
    annotate("point", x = c(P[1], Q[1]), y = c(P[2], Q[2]), size = 1.6) +
    annotate("text", x = Q[1] + 0.03, y = Q[2] + 0.05, label = "x[n]", parse = TRUE,
             family = "serif", size = 3, hjust = 0) +
    annotate("text", x = P[1] + 0.05, y = P[2] + 0.02, label = "P",
             family = "serif", size = 3, hjust = 0) +
    coord_fixed(xlim = c(-0.05, 1.1), ylim = c(-0.05, 1.12)) +
    theme_calc()

save_figure(p, "inst/figures/08-Chapter/8-01-p29.png", width = 3, height = 3)

