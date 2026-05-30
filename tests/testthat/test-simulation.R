test_that("simulate_abiogenesis returns expected columns", {
  result <- simulate_abiogenesis(n_molecules = 20, generations = 5, seed = 1)
  expect_s3_class(result, "tbl_df")
  expect_equal(nrow(result), 6)
  expect_true(all(c("generation", "n_molecules", "mean_length", "mean_fitness", "diversity", "max_fitness") %in% names(result)))
})

test_that("protocell_simulation returns expected columns", {
  result <- protocell_simulation(n_cells = 5, steps = 5, seed = 3)
  expect_s3_class(result, "tbl_df")
  expect_equal(nrow(result), 6)
  expect_true(all(c("step", "n_cells", "mean_abundance", "max_abundance") %in% names(result)))
})
