#' Calculate molecular fitness
#'
#' Estimates a simplified fitness value for symbolic molecules. In this package,
#' fitness is a toy measure used to represent relative persistence, stability,
#' replication potential, or selective advantage.
#'
#' @param molecules A molecular population, usually created by [create_prebiotic_pool()].
#'
#' @return A numeric vector or data frame containing fitness values.
#'
#' @examples
#' pool <- create_prebiotic_pool(n_molecules = 10)
#' fitness <- molecule_fitness(pool)
#' head(fitness)
#'
#' @export
