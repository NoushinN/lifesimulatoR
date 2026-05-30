#' Simulate Simple Protocell Growth and Division
#'
#' This toy model represents protocells as containers with internal molecular
#' abundance. Protocells grow, divide above a threshold, and may lose material.
#'
#' @param n_cells Initial number of protocells.
#' @param steps Number of simulation steps.
#' @param growth_rate Mean growth rate per step.
#' @param division_threshold Abundance threshold for division.
#' @param leakage_rate Fraction of abundance lost per step.
#' @param seed Optional random seed.
#'
#' @return A tibble with population-level summaries.
#' @export
#'
#' @examples
#' cells <- protocell_simulation(n_cells = 10, steps = 30, seed = 3)
#' head(cells)
protocell_simulation <- function(n_cells = 20,
                                 steps = 100,
                                 growth_rate = 0.2,
                                 division_threshold = 10,
                                 leakage_rate = 0.03,
                                 seed = NULL) {
  if (!is.null(seed)) set.seed(seed)
  validate_positive_integer(n_cells, "n_cells")
  validate_positive_integer(steps, "steps")
  validate_probability(leakage_rate, "leakage_rate")

  abundance <- stats::runif(n_cells, min = 1, max = 3)
  history <- vector("list", steps + 1)

  for (t in 0:steps) {
    history[[t + 1]] <- tibble::tibble(
      step = t,
      n_cells = length(abundance),
      mean_abundance = mean(abundance),
      max_abundance = max(abundance)
    )

    abundance <- abundance + stats::rlnorm(length(abundance), meanlog = log(growth_rate), sdlog = 0.4)
    abundance <- abundance * (1 - leakage_rate)

    dividing <- abundance >= division_threshold
    if (any(dividing)) {
      daughters <- abundance[dividing] / 2
      abundance <- c(abundance[!dividing], daughters, daughters)
    }
  }

  dplyr::bind_rows(history)
}
