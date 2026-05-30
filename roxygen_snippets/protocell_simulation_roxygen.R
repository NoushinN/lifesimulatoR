#' Simulate protocell dynamics
#'
#' Simulates a simplified protocell-like population with growth, leakage, and
#' division. This function is intended for educational exploration of primitive
#' compartment dynamics.
#'
#' @param n_cells Initial number of protocells.
#' @param steps Number of simulation steps.
#' @param growth_rate Rate of internal abundance growth.
#' @param division_threshold Abundance threshold for division.
#' @param leakage_rate Fraction of abundance lost at each step.
#' @param seed Optional random seed for reproducibility.
#'
#' @return A data frame containing protocell population metrics through time.
#'
#' @examples
#' cells <- protocell_simulation(
#'   n_cells = 20,
#'   steps = 50,
#'   growth_rate = 0.2,
#'   division_threshold = 10,
#'   leakage_rate = 0.03,
#'   seed = 123
#' )
#' head(cells)
#'
#' @export
