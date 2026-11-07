devtools::load_all('.')

df <- data.frame(n = 1:30)
df$a_n <- (3 * df$n + 1) / (df$n + 1)

p <- ggplot(df, aes(x = n, y = a_n)) +
    geom_hline(yintercept = 3, linetype = "dashed", color = "gray40") +
    geom_point(color = "blue", size = 1.2) +
    annotate("text", x = 30, y = 3, label = "y = 3", vjust = -0.6, hjust = 1,
             family = "serif", size = 3) +
    scale_y_continuous(limits = c(2, 3.15), breaks = c(2, 2.5, 3)) +
    labs(x = "n", y = expression(a[n])) +
    theme_calc()

save_figure(p, "inst/figures/08-Chapter/8-01-p31.png")
