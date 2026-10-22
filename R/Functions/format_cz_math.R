# CUNI-NATUR-Biostatistics L11 — Czech number formatting for equations, 2026.
# Format a number with a decimal comma inside LaTeX math -----
# In math mode both MathJax (HTML) and Typst (PDF) treat a comma as
#    punctuation followed by a space, so the whole number, including a
#    typographic minus sign (U+2212), goes into \text{}.
format_cz_math <- function(x, digits = 2) {
  res_digits <-
    format_cz(
      x = abs(x),
      digits = digits
    )

  res_formatted <-
    paste0(
      "\\text{",
      ifelse(x < 0, "−", ""),
      res_digits,
      "}"
    )

  return(res_formatted)
}
