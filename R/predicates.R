is_string <- function(x) {
  is.character(x) && identical(length(x), 1L) && !is.na(x)
}
