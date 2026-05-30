#' Estimate Toy Molecular Fitness
#'
#' Calculates a simple fitness score for symbolic molecular sequences. The toy
#' score rewards moderate length and a few simple RNA-like motifs.
#'
#' @param molecules Character vector of symbolic molecular sequences.
#'
#' @return Numeric fitness values.
#' @export
#'
#' @examples
#' molecule_fitness(c("AUGC", "AAAAUUUU"))
molecule_fitness <- function(molecules) {
  len <- nchar(molecules)
  motif_score <- grepl("AU|GC|CG|UA", molecules)
  length_score <- exp(-((len - 12)^2) / 80)
  length_score + 0.25 * motif_score
}

#' Replicate a Molecular Population
#'
#' Samples parent molecules according to fitness and creates the next generation.
#'
#' @param molecules Character vector of symbolic molecular sequences.
#' @param n_molecules Number of molecules to return.
#' @param selection_strength Strength of fitness-based selection. Use 0 for neutral drift.
#'
#' @return A character vector of parent sequences before mutation.
#' @export
#'
#' @examples
#' replicate_molecules(c("AUGC", "UUUU"), n_molecules = 5)
replicate_molecules <- function(molecules,
                                n_molecules = length(molecules),
                                selection_strength = 1) {
  validate_positive_integer(n_molecules, "n_molecules")
  fitness <- molecule_fitness(molecules)
  weights <- exp(selection_strength * fitness)
  sample(molecules, size = n_molecules, replace = TRUE, prob = weights)
}
