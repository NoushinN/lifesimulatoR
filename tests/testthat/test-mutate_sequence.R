test_that("mutate_sequence returns character", {
  x <- mutate_sequence(
    sequence = "AUGCAUGC",
    alphabet = c("A", "U", "G", "C"),
    mutation_rate = 0.1
  )
  
  expect_true(is.character(x))
  expect_length(x, 1)
})