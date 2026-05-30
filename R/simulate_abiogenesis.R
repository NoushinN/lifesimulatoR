#' Simulate a Simple Abiogenesis-Like Molecular Population
#'
#' This educational model simulates a population of symbolic molecules that can
#' replicate, mutate, and experience simple selection. It is not intended to be a
#' chemically realistic model. Instead, it helps students explore how variation,
#' replication, and selection can change molecular populations over time.
#'
#' @param n_molecules Initial number of molecules.
#' @param generations Number of generations to simulate.
#' @param alphabet Character vector used to build molecular sequences.
#' @param min_length Minimum initial molecule length.
#' @param max_length Maximum initial molecule length.
#' @param mutation_rate Probability that a copied character mutates.
#' @param selection_strength Strength of fitness-based selection. Use 0 for neutral drift.
#' @param seed Optional random seed for reproducibility.
#'
#' @return A tibble with generation-level summary statistics.
#' @export
#'
#' @examples
#' result <- simulate_abiogenesis(n_molecules = 50, generations = 20, seed = 1)
#' head(result)
simulate_abiogenesis <- function(n_molecules = 100,
                                 generations = 100,
                                 alphabet = c("A", "U", "G", "C"),
                                 min_length = 5,
                                 max_length = 20,
                                 mutation_rate = 0.01,
                                 selection_strength = 1,
                                 seed = NULL) {
  if (!is.null(seed)) set.seed(seed)
  validate_positive_integer(n_molecules, "n_molecules")
  validate_positive_integer(generations, "generations")
  validate_probability(mutation_rate, "mutation_rate")

  molecules <- replicate(
    n_molecules,
    paste0(sample(alphabet, sample(min_length:max_length, 1), replace = TRUE), collapse = "")
  )

  history <- vector("list", generations + 1)

  for (g in 0:generations) {
    fitness <- molecule_fitness(molecules)
    history[[g + 1]] <- tibble::tibble(
      generation = g,
      n_molecules = length(molecules),
      mean_length = mean(nchar(molecules)),
      mean_fitness = mean(fitness),
      diversity = length(unique(molecules)),
      max_fitness = max(fitness)
    )

    if (g < generations) {
      weights <- exp(selection_strength * fitness)
      parents <- sample(molecules, size = n_molecules, replace = TRUE, prob = weights)
      molecules <- vapply(parents, mutate_sequence, character(1), alphabet = alphabet, mutation_rate = mutation_rate)
    }
  }

  dplyr::bind_rows(history)
}

molecule_fitness <- function(molecules) {
  # Toy fitness: rewards moderate length and presence of repeated motifs.
  len <- nchar(molecules)
  motif_score <- grepl("AU|GC|CG|UA", molecules)
  length_score <- exp(-((len - 12)^2) / 80)
  length_score + 0.25 * motif_score
}

mutate_sequence <- function(sequence, alphabet, mutation_rate) {
  chars <- strsplit(sequence, "")[[1]]
  mutate <- stats::runif(length(chars)) < mutation_rate
  chars[mutate] <- sample(alphabet, sum(mutate), replace = TRUE)
  paste0(chars, collapse = "")
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
