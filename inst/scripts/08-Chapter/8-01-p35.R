devtools::load_all('.')

df <- data.frame(n = 1:30)
df$a_n <- 1 - 1/df$n

p <- ggplot(df, aes(x = n, y = a_n)) +
    geom_hline(yintercept = 1, linetype = "dashed", color = "gray40") +
    geom_point(color = "blue", size = 1.2) +
    annotate("text", x = 30, y = 1, label = "y = 1",
             vjust = -0.6, hjust = 1, family = "serif", size = 3) +
    scale_x_continuous(breaks = seq(0, 30, 10)) +
    scale_y_continuous(limits = c(0, 1.1), breaks = c(0, 0.5, 1)) +
    labs(x = "n", y = expression(a[n])) +
    theme_calc()

save_figure(p, "inst/figures/08-Chapter/8-01-p35.png")
