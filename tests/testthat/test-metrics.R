test_that("shannon_entropy works for positive abundances", {
  expect_gt(shannon_entropy(c(10, 5, 1)), 0)
})
