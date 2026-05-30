#' Plot Origin-of-Life Simulation Results
#'
#' @param data A data frame returned by one of the simulation functions.
#' @param x Column name for x-axis.
#' @param y Column name for y-axis.
#'
#' @return A ggplot object.
#' @export
#'
#' @examples
#' result <- simulate_abiogenesis(generations = 10, seed = 1)
#' plot_simulation(result, x = "generation", y = "mean_fitness")
plot_simulation <- function(data, x, y) {
  if (!x %in% names(data)) stop("x must be a column in data.", call. = FALSE)
  if (!y %in% names(data)) stop("y must be a column in data.", call. = FALSE)

  ggplot2::ggplot(data, ggplot2::aes(x = .data[[x]], y = .data[[y]])) +
    ggplot2::geom_line() +
    ggplot2::geom_point() +
    ggplot2::theme_minimal() +
    ggplot2::labs(x = x, y = y)
}

