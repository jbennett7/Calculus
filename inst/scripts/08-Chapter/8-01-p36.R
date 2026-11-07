devtools::load_all('.')

df <- data.frame(n = 1:20)
df$a_n <- df$n - 1/df$n

p <- ggplot(df, aes(x = n, y = a_n)) +
    geom_abline(slope = 1, intercept = 0, linetype = "dashed", color = "gray40") +
    annotate("text", x = 20, y = 20, label = "y = n", vjust = -0.6, hjust = 1,
             family = "serif", size = 3) +
    geom_point(color = "blue", size = 1.2) +
    scale_x_continuous(breaks = seq(0, 20, 5)) +
    scale_y_continuous(limits = c(0, 22), breaks = seq(0, 20, 5)) +
    labs(x = "n", y = expression(a[n])) +
    theme_calc()

save_figure(p, "inst/figures/08-Chapter/8-01-p36.png")

