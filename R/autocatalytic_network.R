#' Simulate a Toy Autocatalytic Network
#'
#' Creates a random network of molecular types where some molecules catalyze
#' the production of others. This simplified model is useful for visualizing
#' how mutually reinforcing chemical systems may grow.
#'
#' @param n_types Number of molecular types.
#' @param steps Number of simulation steps.
#' @param catalysis_probability Probability that one molecule type catalyzes another.
#' @param base_rate Baseline production rate.
#' @param catalytic_boost Additional production rate from catalysts.
#' @param decay_rate Fraction of each molecule type lost per step.
#' @param seed Optional random seed.
#'
#' @return A list containing a time-series tibble and the catalysis matrix.
#' @export
#'
#' @examples
#' net <- autocatalytic_network(n_types = 5, steps = 20, seed = 2)
#' head(net$time_series)
autocatalytic_network <- function(n_types = 10,
                                  steps = 100,
                                  catalysis_probability = 0.15,
                                  base_rate = 0.05,
                                  catalytic_boost = 0.1,
                                  decay_rate = 0.02,
                                  seed = NULL) {
  if (!is.null(seed)) set.seed(seed)
  validate_positive_integer(n_types, "n_types")
  validate_positive_integer(steps, "steps")
  validate_probability(catalysis_probability, "catalysis_probability")
  validate_probability(decay_rate, "decay_rate")

  catalysis <- matrix(
    stats::runif(n_types * n_types) < catalysis_probability,
    nrow = n_types,
    ncol = n_types
  )
  diag(catalysis) <- FALSE

  abundance <- stats::runif(n_types, min = 0.1, max = 1)
  names(abundance) <- paste0("M", seq_len(n_types))

  out <- vector("list", steps + 1)

  for (t in 0:steps) {
    out[[t + 1]] <- tibble::tibble(
      step = t,
      molecule = names(abundance),
      abundance = as.numeric(abundance)
    )

    catalytic_input <- as.numeric(t(catalysis) %*% abundance)
    growth <- base_rate + catalytic_boost * catalytic_input
    abundance <- abundance + growth - decay_rate * abundance
    abundance <- pmax(abundance, 0)
  }

  list(
    time_series = dplyr::bind_rows(out),
    catalysis_matrix = catalysis
  )
}
