devtools::load_all('.')

a_seq <- function(n) {
    if (n == 1) return(2)
    if (n == 2) return(c(2, -1))
    prev <- a_seq(n - 1)
    k <- length(prev)
    c(prev, prev[k] / prev[k - 1])
}

df <- data.frame(n = 1:10, a_n = a_seq(10))

p <- ggplot(df, aes(x = n, y = a_n)) +
    geom_point(size = 1.2, show.legend = FALSE) +
    scale_y_continuous(labels = function(b) as.character(MASS::fractions(b))) +
    labs(x = "n", y = expression(a[n])) +
    theme_calc()

save_figure(p, "inst/figures/08-Chapter/8-01-p12.png")
