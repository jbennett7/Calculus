devtools::load_all('.')

df <- data.frame(n = 1:30)
df$a_n <- 2 - 2/df$n - 1/2^df$n

p <- ggplot(df, aes(x = n, y = a_n)) +
    geom_hline(yintercept = 2, linetype = "dashed", color = "gray40") +
    geom_point(color = "blue", size = 1.2) +
    annotate("text", x = 30, y = 2, label = "y = 2",
             vjust = -0.6, hjust = 1, family = "serif", size = 3) +
    scale_x_continuous(breaks = seq(0, 30, 10)) +
    scale_y_continuous(limits = c(-0.6, 2.25), breaks = c(-0.5, 0, 0.5, 1, 1.5, 2)) +
    labs(x = "n", y = expression(a[n])) +
    theme_calc()

save_figure(p, "inst/figures/08-Chapter/8-01-p34.png")
