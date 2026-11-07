devtools::load_all('.')
# Exercise 26: 2^n / n! < 10^-7 -> a_n = 2^n/n!, L = 0, eps = 10^-7

f   <- function(n) 2^n / factorial(n)
L   <- 0
eps <- 1e-7

# N = last n OUTSIDE the band, so the inequality holds for all n > N
n_all <- 1:100
N <- max(which(abs(f(n_all) - L) >= eps))   # 14
stopifnot(N < max(n_all))

# Plot the full approach, n = 1 to 25
df <- data.frame(n = 1:25)
df$a_n <- f(df$n)
df$tail <- df$n > N

p <- ggplot(df, aes(x = n, y = a_n)) +
    geom_hline(yintercept = eps, color = "blue", linewidth = 0.3) +
    geom_vline(xintercept = N, linetype = "dotted", color = "gray40") +
    geom_point(aes(color = tail), size = 0.9, show.legend = FALSE) +
    scale_color_manual(values = c(`FALSE` = "gray60", `TRUE` = "blue")) +
    annotate("text", x = N, y = 1e-2, label = paste0("N = ", N),
             hjust = -0.1, family = "serif", size = 3) +
    annotate("text", x = 1, y = eps, label = "epsilon == 10^-7", parse = TRUE,
             vjust = 1.4, hjust = 0, family = "serif", size = 3) +
    scale_y_log10(breaks = 10^seq(-18, 0, by = 3),
                       labels = scales::label_math(10^.x, format = log10)) +
    labs(x = "n", y = expression(a[n] ~ "(log scale)")) +
    theme_calc()

save_figure(p, "inst/figures/08-Chapter/8-01-p26.png")
