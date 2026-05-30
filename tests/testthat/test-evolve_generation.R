test_that("evolve_generation returns population", {
  pop <- create_prebiotic_pool(20, seed = 1)
  
  out <- evolve_generation(
    molecules = pop,
    mutation_rate = 0.01,
    selection_strength = 1
  )
  
  expect_true(length(out) > 0)
})