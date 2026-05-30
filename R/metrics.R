#' Summarize a Molecular Population
#'
#' Computes simple population-level metrics for symbolic molecular populations.
#'
#' @param molecules Character vector of symbolic molecular sequences.
#' @param generation Generation number to record.
#'
#' @return A one-row tibble of summary metrics.
#' @export
#'
#' @examples
#' summarize_molecules(c("AUGC", "AUGC", "UUUU"), generation = 0)
summarize_molecules <- function(molecules, generation = 0) {
  fitness <- molecule_fitness(molecules)
  tibble::tibble(
    generation = generation,
    n_molecules = length(molecules),
    mean_length = mean(nchar(molecules)),
    mean_fitness = mean(fitness),
    diversity = length(unique(molecules)),
    max_fitness = max(fitness)
  )
}

#' Calculate Shannon Entropy
#'
#' Calculates Shannon entropy from a vector of counts or abundances.
#'
#' @param x Numeric vector of counts or abundances.
#'
#' @return Shannon entropy.
#' @export
#'
#' @examples
#' shannon_entropy(c(10, 5, 1))
shannon_entropy <- function(x) {
  x <- x[x > 0]
  p <- x / sum(x)
  -sum(p * log2(p))
}

validate_positive_integer <- function(x, name) {
  if (!is.numeric(x) || length(x) != 1 || is.na(x) || x < 1 || x != as.integer(x)) {
    stop(name, " must be a positive integer.", call. = FALSE)
  }
}

validate_probability <- function(x, name) {
  if (!is.numeric(x) || length(x) != 1 || is.na(x) || x < 0 || x > 1) {
    stop(name, " must be between 0 and 1.", call. = FALSE)
  }
}
