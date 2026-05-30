#' Mutate a molecular sequence
#'
#' Applies random symbolic mutations to a single sequence. This function is a
#' low-level helper for exploring copying errors and molecular variation.
#'
#' @param sequence A character string representing a symbolic molecule.
#' @param mutation_rate Probability of mutation.
#' @param alphabet Character vector of possible symbols.
#'
#' @return A mutated sequence as a character string.
#'
#' @examples
#' mutate_sequence(
#'   sequence = "AUGCUA",
#'   mutation_rate = 0.1,
#'   alphabet = c("A", "U", "G", "C")
#' )
#'
#' @export
