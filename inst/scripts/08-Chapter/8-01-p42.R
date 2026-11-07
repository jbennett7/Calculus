devtools::load_all('.')

df <- data.frame(n = 1:30)
df$a_n <- (df$n + 1)/df$n

p <- ggplot(df, aes(x = n, y = a_n)) +
    geom_hline(yintercept = 1, linetype = "dashed", color = "gray40") +
    geom_point(color = "blue", size = 1.2) +
    annotate("text", x = 30, y = 1, label = "y = 1",
             vjust = 1.6, hjust = 1, family = "serif", size = 3) +
    scale_x_continuous(breaks = seq(0, 30, 10)) +
    scale_y_continuous(limits = c(0.8, 2.05), breaks = seq(1, 2, 0.25)) +
    labs(x = "n", y = expression(a[n])) +
    theme_calc()

save_figure(p, "inst/figures/08-Chapter/8-01-p42.png")

