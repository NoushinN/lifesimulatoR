#' Create a prebiotic molecular pool
#'
#' Generates an initial population of symbolic molecules for use in simplified
#' origin-of-life simulations. Molecules are represented as sequences built from
#' a user-defined alphabet, such as RNA-inspired symbols A, U, G, and C.
#'
#' @param n_molecules Number of molecules to generate.
#' @param alphabet Character vector of symbols used to build molecules.
#' @param min_length Minimum sequence length.
#' @param max_length Maximum sequence length.
#'
#' @return A molecular population object, typically a vector or data frame of symbolic sequences.
#'
#' @examples
#' pool <- create_prebiotic_pool(
#'   n_molecules = 20,
#'   alphabet = c("A", "U", "G", "C"),
#'   min_length = 5,
#'   max_length = 10
#' )
#' head(pool)
#'
#' @export
