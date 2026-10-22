# CUNI-NATUR-Biostatistics L11 — Czech number formatting, 2026.
# Format a number with a decimal comma -----
# Used for inline values in the learning materials, so that every printed
#   number comes from its source object in Czech notation.
format_cz <- function(x, digits = 2, signed = FALSE) {
  res_formatted <- formatC(
    x = x,
    format = "f",
    digits = digits,
    decimal.mark = ",",
    big.mark = " "
  )

  if (signed && is.finite(x) && x > 0) {
    res_formatted <- paste0("+", res_formatted)
  }

  return(res_formatted)
}
