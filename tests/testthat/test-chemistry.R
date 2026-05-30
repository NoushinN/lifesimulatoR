test_that("autocatalytic_network returns a list", {
  net <- autocatalytic_network(n_types = 4, steps = 5, seed = 2)
  expect_true(is.list(net))
  expect_true("time_series" %in% names(net))
  expect_true("catalysis_matrix" %in% names(net))
})

test_that("create_prebiotic_pool returns requested number of molecules", {
  pool <- create_prebiotic_pool(n_molecules = 8, seed = 1)
  expect_equal(length(pool), 8)
})
