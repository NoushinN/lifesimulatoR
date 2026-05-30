#' Summarize a molecular population
#'
#' Produces summary statistics for a symbolic molecular population, such as total
#' number of molecules, unique molecule types, sequence lengths, or diversity
#' metrics depending on the implementation.
#'
#' @param molecules A molecular population.
#'
#' @return A summary table or list of population-level metrics.
#'
#' @examples
#' pool <- create_prebiotic_pool(n_molecules = 20)
#' summarize_molecules(pool)
#'
#' @export
