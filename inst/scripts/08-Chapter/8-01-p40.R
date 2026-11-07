devtools::load_all('.')

N <- 50
x_n <- c(cos(1))
for(n in 2:N) x_n <- c(x_n, max(x_n[length(x_n)], cos(n)))
df <- data.frame(n = 1:N, x_n = x_n)

p <- ggplot(df, aes(x = n, y = x_n)) +
    geom_hline(yintercept = 1, linetype = "dashed", color = "gray40") +
    annotate("text", x = N, y = 1, label = "y = 1", vjust = -0.6, hjust = 1,
             family = "serif", size = 3) +
    geom_point(color = "blue", size = 1.2) +
    scale_x_continuous(breaks = seq(0, N, 10)) +
    scale_y_continuous(limits = c(0.5, 1.05), breaks = seq(0.5, 1, 0.1)) +
    labs(x = "n", y = expression(x[n])) +
    theme_calc()

save_figure(p, "inst/figures/08-Chapter/8-01-p40.png")
