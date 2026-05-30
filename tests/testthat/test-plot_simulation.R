test_that("plot_simulation returns plot", {
  sim <- simulate_abiogenesis(
    n_molecules = 20,
    generations = 5,
    seed = 1
  )
  
  p <- plot_simulation(
    sim,
    x = "generation",
    y = "mean_fitness"
  )
  
  expect_s3_class(p, "ggplot")
})