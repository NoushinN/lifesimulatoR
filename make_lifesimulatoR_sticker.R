library(hexSticker)
library(ggplot2)

dir.create("man/figures", recursive = TRUE, showWarnings = FALSE)

theta <- seq(0, 2 * pi, length.out = 300)

membrane <- data.frame(
  x = 1.01 * cos(theta),
  y = 1.01 * sin(theta)
)

inner_membrane <- data.frame(
  x = 0.95 * cos(theta),
  y = 0.95 * sin(theta)
)

# Smaller molecules
molecules <- data.frame(
  x = c(-0.45, 0.10, 0.48, -0.10, 0.32, -0.30),
  y = c( 0.35, 0.55, 0.15, -0.10, -0.42, -0.45),
  size = c(2.4, 1.8, 2.1, 2.8, 1.7, 1.9)
)

# Bonds
bonds <- data.frame(
  x = c(-0.45, 0.10, 0.48, -0.10, -0.30),
  y = c( 0.35, 0.55, 0.15, -0.10, -0.45),
  xend = c(0.10, 0.48, -0.10, -0.30, -0.45),
  yend = c(0.55, 0.15, -0.10, -0.45, 0.35)
)

# Smaller background particles
particles <- data.frame(
  x = c(-0.72, 0.72, -0.65, 0.68, 0.00),
  y = c( 0.05, 0.42, -0.58, -0.25, -0.75),
  size = c(0.8, 0.7, 0.6, 0.7, 0.6)
)

p <- ggplot() +
  geom_path(
    data = membrane,
    aes(x = x, y = y),
    linewidth = 2.0,
    color = "#1F5B4F",
    lineend = "round"
  ) +
  geom_path(
    data = inner_membrane,
    aes(x = x, y = y),
    linewidth = 0.6,
    color = "#8FB8AA",
    alpha = 0.65,
    lineend = "round"
  ) +
  geom_segment(
    data = bonds,
    aes(x = x, y = y, xend = xend, yend = yend),
    linewidth = 0.8,
    color = "#465A55",
    lineend = "round"
  ) +
  geom_point(
    data = molecules,
    aes(x = x, y = y, size = size),
    shape = 21,
    fill = "#253B38",
    color = "#1F5B4F",
    stroke = 0.35
  ) +
  geom_point(
    data = particles,
    aes(x = x, y = y, size = size),
    shape = 21,
    fill = "#AFC8BD",
    color = "#6E9185",
    stroke = 0.2,
    alpha = 0.85
  ) +
  scale_size_identity() +
  coord_equal(
    xlim = c(-1.25, 1.25),
    ylim = c(-1.25, 1.25),
    expand = FALSE
  ) +
  theme_void()

sticker(
  subplot = p,
  package = "",
  s_x = 1,
  s_y = 1,
  s_width = 1.8,
  s_height = 1.8,
  h_fill = "#F3F8F6",
  h_color = "#155C4C",
  h_size = 1.8,
  filename = "man/figures/lifesimulatoR_hex.png"
)

message("Saved to: man/figures/lifesimulatoR_hex.png")