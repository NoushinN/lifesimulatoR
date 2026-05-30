#' Simulate an autocatalytic network
#'
#' Simulates a simplified autocatalytic network in which molecular types may
#' catalyze the production of other types. This toy model helps illustrate
#' feedback, mutual reinforcement, and self-sustaining chemical systems.
#'
#' @param n_types Number of molecular types.
#' @param steps Number of simulation steps.
#' @param catalysis_probability Probability that one type catalyzes another.
#' @param seed Optional random seed for reproducibility.
#'
#' @return A list or data frame containing network structure and time-series output.
#'
#' @examples
#' network <- autocatalytic_network(
#'   n_types = 8,
#'   steps = 30,
#'   catalysis_probability = 0.2,
#'   seed = 123
#' )
#' str(network)
#'
#' @export
