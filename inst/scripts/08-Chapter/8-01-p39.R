devtools::load_all('.')

df <- data.frame(n = 1:15)
df$a_n <- ((-1)^df$n + 1)*((df$n+1)/df$n)

p <- ggplot(df, aes(x = n, y = a_n)) +
    geom_hline(yintercept = 0, linetype = "dashed", color = "gray40") +
    annotate("text", x = 15, y = 0, label = "y = 0", vjust = -0.6, hjust = 1,
             family = "serif", size = 3) +
    geom_hline(yintercept = 2, linetype = "dashed", color = "gray40") +
    annotate("text", x = 15, y = 1.7, label = "y = 2", vjust = -0.6, hjust = 1,
             family = "serif", size = 3) +
    geom_point(color = "blue", size = 1.2) +
    scale_x_continuous(breaks = seq(0, 15, 5)) +
    scale_y_continuous(limits = c(0, 3), breaks = seq(0, 3, 0.5)) +
    labs(x = "n", y = expression(a[n])) +
    theme_calc()

save_figure(p, "inst/figures/08-Chapter/8-01-p39.png")
