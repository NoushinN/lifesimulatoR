#' Mutate a Symbolic Molecular Sequence
#'
#' Randomly changes characters in a molecule according to a mutation rate.
#'
#' @param sequence A single symbolic molecular sequence.
#' @param alphabet Character vector used to build molecular sequences.
#' @param mutation_rate Probability that a copied character mutates.
#'
#' @return A mutated molecular sequence.
#' @export
#'
#' @examples
#' mutate_sequence("AUGC", mutation_rate = 0.2)
mutate_sequence <- function(sequence,
                            alphabet = c("A", "U", "G", "C"),
                            mutation_rate = 0.01) {
  validate_probability(mutation_rate, "mutation_rate")
  chars <- strsplit(sequence, "")[[1]]
  mutate <- stats::runif(length(chars)) < mutation_rate
  chars[mutate] <- sample(alphabet, sum(mutate), replace = TRUE)
  paste0(chars, collapse = "")
}

#' Mutate a Molecular Population
#'
#' Applies sequence mutation to every molecule in a population.
#'
#' @param molecules Character vector of symbolic molecular sequences.
#' @param alphabet Character vector used to build molecular sequences.
#' @param mutation_rate Probability that a copied character mutates.
#'
#' @return A character vector of mutated molecular sequences.
#' @export
#'
#' @examples
#' mutate_population(c("AUGC", "UUUU"), mutation_rate = 0.1)
mutate_population <- function(molecules,
                              alphabet = c("A", "U", "G", "C"),
                              mutation_rate = 0.01) {
  vapply(
    molecules,
    mutate_sequence,
    character(1),
    alphabet = alphabet,
    mutation_rate = mutation_rate,
    USE.NAMES = FALSE
  )
}

#' Select and Mutate One Molecular Generation
#'
#' Convenience function that combines parent selection, replication, and mutation.
#'
#' @param molecules Character vector of symbolic molecular sequences.
#' @param n_molecules Number of molecules in the next generation.
#' @param alphabet Character vector used to build molecular sequences.
#' @param mutation_rate Probability that a copied character mutates.
#' @param selection_strength Strength of fitness-based selection. Use 0 for neutral drift.
#'
#' @return A character vector of next-generation molecules.
#' @export
#'
#' @examples
#' evolve_generation(c("AUGC", "UUUU"), n_molecules = 10)
evolve_generation <- function(molecules,
                              n_molecules = length(molecules),
                              alphabet = c("A", "U", "G", "C"),
                              mutation_rate = 0.01,
                              selection_strength = 1) {
  parents <- replicate_molecules(
    molecules,
    n_molecules = n_molecules,
    selection_strength = selection_strength
  )
  mutate_population(parents, alphabet = alphabet, mutation_rate = mutation_rate)
}
