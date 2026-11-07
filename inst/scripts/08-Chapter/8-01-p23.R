devtools::load_all('.')
# Exercise 23: |0.5^(1/n) - 1| < 10^-3 -> a_n = 0.5^(1/n), L = 1, eps = 10^-3

f <- function(n) 0.5^(1/n)   # a_n = .05^(1/n)
L <- 1
eps <- 1e-3

# N = last n OUTSIDE the band, so the inequality holds for all n > N
n_all <- 1:5000
N <- max(which(abs(f(n_all) - L) >= eps))       # 692

# Zoom in around N; plot every 20th term so the points read as a sequence
df <- data.frame(n = seq(300, 1500, by = 20))
df$a_n <- f(df$n)
df$tail <- df$n > N

p <- ggplot(df, aes(x = n, y = a_n)) +
    annotate("rect", xmin = -Inf, xmax = Inf, ymin = L - eps, ymax = L + eps,
             fill = "blue", alpha = 0.08) +
    geom_hline(yintercept = L, linetype = "dashed", color = "gray40") +
    geom_hline(yintercept = L + c(-eps, eps), color = "blue", linewidth = 0.3) +
    geom_vline(xintercept = N, linetype = "dotted", color = "gray40") +
    geom_point(aes(color = tail), size = 0.9, show.legend = FALSE) +
    scale_color_manual(values = c(`FALSE` = "gray60", `TRUE` = "blue")) +
    annotate("text", x = N, y = 0.9998, label = paste0("N = ", N),
             hjust = -0.1, family = "serif", size = 3) +
    scale_y_continuous(breaks = c(L - 2 * eps, L - eps, L, L + eps),
                       labels = expression(1 - 2 * epsilon, 1 - epsilon, 1, 1 + epsilon)) +
    coord_cartesian(ylim = c(L - 2.5 * eps, L + 1.3 * eps)) +
    labs(x = "n", y = expression(a[n] == sqrt(0.5, n))) +
    theme_calc()

save_figure(p, "inst/figures/08-Chapter/8-01-p23.png")
