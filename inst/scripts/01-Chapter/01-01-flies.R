devtools::load_all('.')

# Logistic growth p(t) = K / (1 + exp(-r (t - t0))), with K, r, t0 chosen so the
# curve passes through P = (23, 150) and Q = (45, 340).
K <- 350
P <- c(23, 150)
Q <- c(45, 340)
u <- function(p) log(K / p - 1)     # equals -r (t - t0)
r <- (u(P[2]) - u(Q[2])) / (Q[1] - P[1])
t0 <- P[1] + u(P[2]) / r
pop <- function(t) K / (1 + exp(-r * (t - t0)))

dp <- Q[2] - P[2]
dt <- Q[1] - P[1]

p <- ggplot() +
    stat_function(fun = pop, xlim = c(0, 50), color = "blue", linewidth = 0.5) +
    secant_line(pop, P[1], Q[1]) +
    rise_run(pop, P[1], Q[1]) +
    annotate("text", x = (P[1] + Q[1]) / 2, y = P[2] - 18,
             label = paste0("Delta*t == ", dt, "~days"), parse = TRUE,
             family = "serif", size = 3) +
    annotate("text", x = Q[1] - 0.8, y = P[2] + 45, hjust = 1,
             label = paste0("Delta*p == ", dp, "~flies"), parse = TRUE,
             family = "serif", size = 3) +
    filled_points(data.frame(x = c(P[1], Q[1]), y = c(P[2], Q[2]))) +
    annotate("text", x = P[1] - 1, y = P[2] + 15, hjust = 1,
             label = sprintf("P(%g, %g)", P[1], P[2]), family = "serif", size = 3) +
    annotate("text", x = Q[1] - 1, y = Q[2] + 18, hjust = 1,
             label = sprintf("Q(%g, %g)", Q[1], Q[2]), family = "serif", size = 3) +
    scale_x_continuous(breaks = seq(0, 50, 10)) +
    scale_y_continuous(breaks = seq(0, 350, 50)) +
    coord_cartesian(xlim = c(0, 50), ylim = c(0, 380)) +
    labs(x = "Time (days)", y = "Number of flies") +
    theme_calc()

save_figure(p, "inst/figures/01-Chapter/01-01-flies.png", height = 2.6)
