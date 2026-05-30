validate_positive_integer <- function(x, name) {
  if (!is.numeric(x) ||
      length(x) != 1 ||
      is.na(x) ||
      x <= 0 ||
      x != as.integer(x)) {
    stop(name, " must be a positive integer.", call. = FALSE)
  }
  
  invisible(TRUE)
}

validate_probability <- function(x, name) {
  if (!is.numeric(x) ||
      length(x) != 1 ||
      is.na(x) ||
      x < 0 ||
      x > 1) {
    stop(name, " must be a probability between 0 and 1.", call. = FALSE)
  }
  
  invisible(TRUE)
}