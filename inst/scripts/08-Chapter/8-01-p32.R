devtools::load_all('.')
# Exercise 32: a_n = (2n + 3)! / (n + 1)!
# lfactorial() avoids overflow: factorial() returns Inf once 2n + 3 > 170
df <- data.frame(n = 1:30)
df$a_n <- exp(lfactorial(2 * df$n + 3) - lfactorial(df$n + 1))

p <- ggplot(df, aes(x = n, y = a_n)) +
    geom_point(color = "blue", size = 1.2) +
    scale_y_log10(breaks = 10^seq(0, 60, by = 10),
                  labels = scales::label_math(10^.x, format = log10)) +
    labs(x = "n", y = expression(a[n] ~ "(log scale)")) +
    theme_calc()

save_figure(p, "inst/figures/08-Chapter/8-01-p32.png")

