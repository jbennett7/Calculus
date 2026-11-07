devtools::load_all('.')

f <- function(x) 7.25 * 0.94^x
x_cross <- log(3.5/7.25) / log(0.94)

p <- ggplot()+
    stat_function(fun = f, xlim = c(0, 25), n = 500) +
    geom_hline(yintercept = 3.5, color = "blue") +
    geom_vline(xintercept = x_cross, color = "blue", linetype = "dashed") +
    annotate("point", x = x_cross, y = 3.5, color = "red", size = 2) +
    labs(x = "years from now", y = "hours per vehicle") +
    theme_calc()
    annotate("text", x = x_cross, y = 3.5, label = paste0("x == ", round(x_cross, 2)),
             parse = TRUE, hjust = -0.15, vjust = -0.6, family = "serif", size = 3)

save_figure(p, "inst/figures/08-Chapter/8-01-p30b.png")
