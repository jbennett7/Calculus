devtools::load_all('.')

df <- data.frame(n = 1:4)
df$a_n <- (-1)^(df$n + 1) / (2 * df$n - 1)

p <- ggplot(df, aes(x = n, y = a_n)) +
    geom_point(size = 1.2, show.legend = FALSE) +
    scale_y_continuous(labels = function(b) as.character(MASS::fractions(b))) +
    labs(x = "n", y = expression(a[n])) +
    theme_calc()

save_figure(p, "inst/figures/08-Chapter/8-01-p03.png")
