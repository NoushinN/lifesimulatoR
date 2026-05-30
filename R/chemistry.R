#' Create an Initial Prebiotic Molecular Pool
#'
#' Creates a symbolic pool of RNA-like molecules from a supplied alphabet. This
#' is an educational helper used by the simulation functions; it is not intended
#' to represent chemically realistic reaction pathways.
#'
#' @param n_molecules Initial number of molecules.
#' @param alphabet Character vector used to build molecular sequences.
#' @param min_length Minimum molecule length.
#' @param max_length Maximum molecule length.
#' @param seed Optional random seed for reproducibility.
#'
#' @return A character vector of symbolic molecular sequences.
#' @export
#'
#' @examples
#' pool <- create_prebiotic_pool(n_molecules = 10, seed = 1)
#' pool
create_prebiotic_pool <- function(n_molecules = 100,
                                  alphabet = c("A", "U", "G", "C"),
                                  min_length = 5,
                                  max_length = 20,
                                  seed = NULL) {
  if (!is.null(seed)) set.seed(seed)
  validate_positive_integer(n_molecules, "n_molecules")
  validate_positive_integer(min_length, "min_length")
  validate_positive_integer(max_length, "max_length")

  if (min_length > max_length) {
    stop("min_length must be less than or equal to max_length.", call. = FALSE)
  }
  if (!is.character(alphabet) || length(alphabet) < 2) {
    stop("alphabet must be a character vector with at least two symbols.", call. = FALSE)
  }

  replicate(
    n_molecules,
    paste0(sample(alphabet, sample(min_length:max_length, 1), replace = TRUE), collapse = "")
  )
}

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

  for (step_i in 0:steps) {
    out[[step_i + 1]] <- tibble::tibble(
      step = step_i,
      molecule = names(abundance),
      abundance = as.numeric(abundance)
    )

    catalytic_input <- as.numeric(base::t(catalysis) %*% abundance)
    growth <- base_rate + catalytic_boost * catalytic_input
    abundance <- abundance + growth - decay_rate * abundance
    abundance <- pmax(abundance, 0)
  }

  list(
    time_series = dplyr::bind_rows(out),
    catalysis_matrix = catalysis
  )
}
