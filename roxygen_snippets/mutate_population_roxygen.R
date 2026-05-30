#' Mutate a molecular population
#'
#' Applies mutation to a population of symbolic molecules. Mutation introduces
#' new variation and allows the simulated population to explore sequence space.
#'
#' @param molecules A molecular population.
#' @param mutation_rate Probability of mutation.
#' @param alphabet Character vector of possible symbols.
#'
#' @return A mutated molecular population.
#'
#' @examples
#' pool <- create_prebiotic_pool(n_molecules = 10)
#' mutated <- mutate_population(
#'   pool,
#'   mutation_rate = 0.02,
#'   alphabet = c("A", "U", "G", "C")
#' )
#' head(mutated)
#'
#' @export
