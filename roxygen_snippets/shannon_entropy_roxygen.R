#' Calculate Shannon entropy
#'
#' Calculates Shannon entropy as a simple diversity metric for a symbolic
#' molecular population. Higher entropy usually indicates greater diversity or a
#' more even distribution among molecule types.
#'
#' @param x A vector or population object containing molecule identities or counts.
#'
#' @return A numeric entropy value.
#'
#' @examples
#' pool <- create_prebiotic_pool(n_molecules = 30)
#' shannon_entropy(pool)
#'
#' @export
