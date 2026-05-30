#' Simulate simplified abiogenesis
#'
#' Runs a multi-generation educational simulation of symbolic molecular evolution.
#' The simulation can include molecular variation, mutation, selection, and changes
#' in population-level metrics over time.
#'
#' @param n_molecules Number of molecules in the initial population.
#' @param generations Number of generations to simulate.
#' @param alphabet Character vector of symbols used to build molecules.
#' @param min_length Minimum sequence length.
#' @param max_length Maximum sequence length.
#' @param mutation_rate Probability of mutation.
#' @param selection_strength Strength of selection.
#' @param seed Optional random seed for reproducibility.
#'
#' @return A data frame or list containing simulation results through time.
#'
#' @examples
#' sim <- simulate_abiogenesis(
#'   n_molecules = 50,
#'   generations = 20,
#'   mutation_rate = 0.02,
#'   selection_strength = 1,
#'   seed = 123
#' )
#' head(sim)
#'
#' @export
