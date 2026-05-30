#' Plot simulation results
#'
#' Creates a simple visualization of simulation output using ggplot2. This helper
#' is designed to quickly inspect trajectories from molecular, protocell, or
#' network simulations.
#'
#' @param data A simulation output data frame.
#' @param x Name of the x-axis variable.
#' @param y Name of the y-axis variable.
#' @param ... Additional plotting arguments.
#'
#' @return A ggplot object.
#'
#' @examples
#' sim <- simulate_abiogenesis(n_molecules = 30, generations = 20, seed = 123)
#' plot_simulation(sim)
#'
#' @export
