devtools::load_all('.')

df <- data.frame(n = 1:20)
df$a_n <- 6^df$n / factorial(df$n)  # 2^n 3^n = 6^n
M <- max(df$a_n)                    # least upper bound: a_5 = a_6 = 64.8
df$is_max <- abs(df$a_n - M) < 1e-9

p <- ggplot(df, aes(x = n, y = a_n)) +
    geom_hline(yintercept = M, linetype = "dashed", color = "gray40") +
    geom_point(aes(color = is_max), size = 1.2, show.legend = FALSE) +
    scale_color_manual(values = c(`FALSE` = "blue", `TRUE` = "red")) +
    annotate("text", x = 20, y = M, label = paste0("y = ", M),
             vjust = -0.6, hjust = 1, family = "serif", size = 3) +
    scale_x_continuous(breaks = seq(0, 20, 5)) +
    scale_y_continuous(limits = c(0, 72)) +
    labs(x = "n", y = expression(a[n])) +
    theme_calc()

save_figure(p, "inst/figures/08-Chapter/8-01-p33.png")
