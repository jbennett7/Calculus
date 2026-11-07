devtools::load_all('.')

rule <- function(x0, n){
    if(n==0) return(x0)
    prev <- rule(x0, n-1)
    x <- prev[length(prev)]
    c(prev, x / (length(prev) + 1))
}
df <- data.frame(n = 1:10)
df$a_n <- rule(1, 9)

p <- ggplot(df, aes(x = n, y = a_n)) +
    geom_point(size = 1.2, show.legend = FALSE) +
    scale_y_continuous(labels = function(b) as.character(MASS::fractions(b))) +
    labs(x = "n", y = expression(a[n])) +
    theme_calc()

save_figure(p, "inst/figures/08-Chapter/8-01-p08.png")

