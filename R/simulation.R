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

  molecules <- create_prebiotic_pool(
    n_molecules = n_molecules,
    alphabet = alphabet,
    min_length = min_length,
    max_length = max_length
  )

  history <- vector("list", generations + 1)

  for (generation_i in 0:generations) {
    history[[generation_i + 1]] <- summarize_molecules(
      molecules,
      generation = generation_i
    )

    if (generation_i < generations) {
      molecules <- evolve_generation(
        molecules,
        n_molecules = n_molecules,
        alphabet = alphabet,
        mutation_rate = mutation_rate,
        selection_strength = selection_strength
      )
    }
  }

  dplyr::bind_rows(history)
}

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

  for (step_i in 0:steps) {
    history[[step_i + 1]] <- tibble::tibble(
      step = step_i,
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
