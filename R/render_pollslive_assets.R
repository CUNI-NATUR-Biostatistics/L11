#----------------------------------------------------------#
#
#
#                         L11
#
#      Render PollsLive evidence assets (retrieves L10)
#
#
#----------------------------------------------------------#

# The three evidence images reproduce familiar L10 displays. Two come from
# the approved L10 teaching data (Galapagos islands, faraway::galamiss, GPL;
# Johnson & Raven 1973). L11 keeps an unchanged copy in
# data/druhy_galapagy.csv. The copy is verified by a line-ending-independent
# SHA-256 so that the check behaves the same on Windows and Linux checkouts.
# The mammal box plot uses ggplot2::msleep (Savage & West 2007) directly.

here::i_am("R/render_pollslive_assets.R")

source_path <-
  here::here("data", "druhy_galapagy.csv")

output_dir <-
  here::here("pollslive", "assets")

dir.create(output_dir, recursive = TRUE, showWarnings = FALSE)

# Default seed of the course; no random numbers are drawn below
seed_kurz <- 900723L
set.seed(seed_kurz)

#----------------------------------------------------------#
# 1. Verify the source -----
#----------------------------------------------------------#

# Same content as L10 data/druhy_galapagy.csv (raw file SHA-256
# a60499f4070e59dfe729035bdb2d14fb84ca6c2db5fee3694ceca1ce84c98fb2)
expected_source_hash <-
  "c4b0cf72c00a91b4684425243d1ebcf47f9c958ce64c67f8fe4b92891fee346c"

text_source <-
  readLines(
    con = source_path,
    warn = FALSE,
    encoding = "UTF-8"
  ) |>
  stringr::str_c(collapse = "\n")

hash_source <-
  digest::digest(
    object = text_source,
    algo = "sha256",
    serialize = FALSE
  )

if (
  !identical(hash_source, expected_source_hash)
) {
  stop(
    "data/druhy_galapagy.csv does not match the pinned L10 source ",
    "(normalised SHA-256 ", hash_source, ")."
  )
}

#----------------------------------------------------------#
# 2. Rebuild the L10 power-law model and the mammal data -----
#----------------------------------------------------------#

data_ostrovy <-
  readr::read_csv(
    file = source_path,
    show_col_types = FALSE
  )

mod_mocninny <-
  stats::lm(
    formula = log(pocet_druhu) ~ log(plocha_km2),
    data = data_ostrovy
  )

data_koeficienty <-
  stats::confint(object = mod_mocninny, level = 0.95) |>
  tibble::as_tibble(rownames = "clen") |>
  dplyr::mutate(
    odhad = stats::coef(object = mod_mocninny)
  ) |>
  dplyr::rename(
    dolni = `2.5 %`,
    horni = `97.5 %`
  )

data_savci <-
  ggplot2::msleep |>
  dplyr::select(hmotnost_kg = bodywt)

# Numbers the quiz text and the alt texts rely on
data_sklon <-
  data_koeficienty |>
  dplyr::filter(clen == "log(plocha_km2)")

stopifnot(
  base::nrow(data_ostrovy) == 30L,
  base::nrow(data_savci) == 83L,
  base::round(dplyr::pull(data_sklon, odhad), 3) == 0.389,
  base::round(dplyr::pull(data_sklon, dolni), 2) == 0.30,
  base::round(dplyr::pull(data_sklon, horni), 2) == 0.47,
  base::length(
    grDevices::boxplot.stats(dplyr::pull(data_savci, hmotnost_kg))[["out"]]
  ) == 11L
)

#----------------------------------------------------------#
# 3. Shared styling -----
#----------------------------------------------------------#

cols <-
  c(
    parchment = "#F4F1EC",
    indigo = "#5D2890",
    graphite = "#2E2E2E",
    grey = "#8A8A8A",
    orange = "#F3A712"
  )

theme_quiz <-
  ggplot2::theme_minimal(base_size = 20) +
  ggplot2::theme(
    plot.background = ggplot2::element_rect(
      fill = cols[["parchment"]],
      colour = NA
    ),
    panel.grid.minor = ggplot2::element_blank(),
    plot.title = ggplot2::element_text(
      colour = cols[["indigo"]],
      face = "bold",
      size = 26
    ),
    plot.subtitle = ggplot2::element_text(colour = cols[["graphite"]]),
    text = ggplot2::element_text(colour = cols[["graphite"]])
  )

theme_table <-
  theme_quiz +
  ggplot2::theme(
    axis.text = ggplot2::element_blank(),
    axis.title = ggplot2::element_blank(),
    panel.grid = ggplot2::element_blank()
  )

save_quiz_plot <- function(plot, filename) {
  ggplot2::ggsave(
    filename = here::here(output_dir, filename),
    plot = plot,
    width = 10,
    height = 5.625,
    dpi = 160,
    bg = cols[["parchment"]]
  )
}

# Czech decimal comma and a space as the thousands separator
format_cz <- function(x, digits) {
  res_formatted <-
    formatC(
      x = x,
      format = "f",
      digits = digits,
      decimal.mark = ",",
      big.mark = " "
    )

  return(res_formatted)
}

#----------------------------------------------------------#
# 4. Q1: coefficient table of the power-law model -----
#----------------------------------------------------------#

# The L10 slide also shows the worked 2^0,389 result; it is left out here
# because the quiz asks students to do that calculation themselves.
vec_clenu <-
  c("intercept", "log(plocha)")

data_q1_bunky <-
  tibble::tibble(
    radek = rep(1:2, times = 2),
    sloupec = rep(1:2, each = 2),
    hodnota = c(
      format_cz(dplyr::pull(data_koeficienty, odhad), 3),
      stringr::str_c(
        format_cz(dplyr::pull(data_koeficienty, dolni), 2),
        " až ",
        format_cz(dplyr::pull(data_koeficienty, horni), 2)
      )
    )
  )

vec_q1_x <-
  c(0.62, 0.98)

graf_q1 <-
  ggplot2::ggplot() +
  ggplot2::scale_x_continuous(limits = c(-0.02, 1.02)) +
  ggplot2::scale_y_continuous(limits = c(0.5, 3.5)) +
  ggplot2::labs(
    title = "Koeficienty modelu Mocninný vztah",
    subtitle = "log(pocet_druhu) ~ log(plocha_km2) · 30 ostrovů Galapág"
  ) +
  theme_table +
  ggplot2::annotate(
    geom = "text",
    x = c(0.02, vec_q1_x),
    y = 3.1,
    label = c("Člen", "Odhad", "95% interval"),
    hjust = c(0, 1, 1),
    size = 7,
    colour = cols[["grey"]]
  ) +
  ggplot2::annotate(
    geom = "text",
    x = 0.02,
    y = 2:1,
    label = vec_clenu,
    hjust = 0,
    size = 9,
    colour = cols[["graphite"]],
    fontface = "bold"
  ) +
  ggplot2::geom_text(
    data = data_q1_bunky,
    mapping = ggplot2::aes(
      x = vec_q1_x[sloupec],
      y = 3 - radek,
      label = hodnota
    ),
    hjust = 1,
    size = 9,
    colour = cols[["indigo"]]
  )

save_quiz_plot(
  plot = graf_q1,
  filename = "l10-koeficienty-mocninneho-vztahu.png"
)

#----------------------------------------------------------#
# 5. Q2: mammal body mass in kilograms -----
#----------------------------------------------------------#

# Reproduces the single vertical box plot of the L10 skripta (base R
# boxplot() of ggplot2::msleep$bodywt in kilograms). The box and whiskers are
# drawn from grDevices::boxplot.stats(), the same rule as boxplot(), so that
# exactly the 11 species named in the quiz stem are flagged. The logarithmic
# box plot is left out because it would answer the question.
list_q2_stats <-
  grDevices::boxplot.stats(x = dplyr::pull(data_savci, hmotnost_kg))

data_q2_box <-
  tibble::tibble(
    x = 1,
    ymin = list_q2_stats[["stats"]][1],
    lower = list_q2_stats[["stats"]][2],
    middle = list_q2_stats[["stats"]][3],
    upper = list_q2_stats[["stats"]][4],
    ymax = list_q2_stats[["stats"]][5]
  )

data_q2_odlehle <-
  tibble::tibble(
    x = 1,
    hmotnost_kg = list_q2_stats[["out"]]
  )

stopifnot(
  base::nrow(data_q2_odlehle) == 11L
)

graf_q2 <-
  ggplot2::ggplot() +
  ggplot2::scale_x_continuous(limits = c(0.4, 1.6)) +
  ggplot2::scale_y_continuous(
    labels = function(x) format_cz(x, 0)
  ) +
  ggplot2::labs(
    title = "Tělesná hmotnost 83 druhů savců",
    y = "Tělesná hmotnost (kg)"
  ) +
  theme_quiz +
  ggplot2::theme(
    axis.text.x = ggplot2::element_blank(),
    axis.title.x = ggplot2::element_blank(),
    panel.grid.major.x = ggplot2::element_blank()
  ) +
  ggplot2::geom_boxplot(
    data = data_q2_box,
    mapping = ggplot2::aes(
      x = x,
      ymin = ymin,
      lower = lower,
      middle = middle,
      upper = upper,
      ymax = ymax
    ),
    stat = "identity",
    width = 0.5,
    fill = cols[["parchment"]],
    colour = cols[["graphite"]],
    linewidth = 1
  ) +
  ggplot2::geom_point(
    data = data_q2_odlehle,
    mapping = ggplot2::aes(x = x, y = hmotnost_kg),
    shape = 1,
    size = 3.2,
    stroke = 1,
    colour = cols[["graphite"]]
  )

save_quiz_plot(
  plot = graf_q2,
  filename = "l10-hmotnost-savcu-kg-krabicovy-graf.png"
)

#----------------------------------------------------------#
# 6. Q3: diagnostics of the power-law model -----
#----------------------------------------------------------#

# Same three panels as vykreslit_diagnostiku() in the L10 presentation:
# residuals vs fitted values, residual histogram and residual Q-Q plot
data_diagnostika <-
  tibble::tibble(
    odhad = stats::fitted(object = mod_mocninny),
    residuum = stats::residuals(object = mod_mocninny)
  )

theme_panel <-
  theme_quiz +
  ggplot2::theme(
    plot.title = ggplot2::element_text(size = 18),
    axis.title = ggplot2::element_text(size = 13),
    axis.text = ggplot2::element_text(size = 12),
    plot.background = ggplot2::element_blank()
  )

graf_q3_rv <-
  ggplot2::ggplot(
    data = data_diagnostika,
    mapping = ggplot2::aes(x = odhad, y = residuum)
  ) +
  ggplot2::labs(
    x = "Odhadnutá hodnota",
    y = "Residuum (log)",
    title = "Residua"
  ) +
  theme_panel +
  ggplot2::geom_hline(
    yintercept = 0,
    linetype = "dashed",
    colour = cols[["graphite"]]
  ) +
  ggplot2::geom_point(
    colour = cols[["grey"]],
    size = 2.6,
    alpha = 0.85
  )

graf_q3_hist <-
  ggplot2::ggplot(
    data = data_diagnostika,
    mapping = ggplot2::aes(x = residuum)
  ) +
  ggplot2::scale_y_continuous(
    breaks = function(limity) unique(floor(pretty(limity))),
    labels = function(x) format_cz(x, 0)
  ) +
  ggplot2::labs(
    x = "Residuum (log)",
    y = "Počet ostrovů",
    title = "Histogram"
  ) +
  theme_panel +
  ggplot2::geom_histogram(
    bins = 12,
    fill = cols[["grey"]],
    colour = "white"
  )

graf_q3_qq <-
  ggplot2::ggplot(
    data = data_diagnostika,
    mapping = ggplot2::aes(sample = residuum)
  ) +
  ggplot2::labs(
    x = "Teoretický kvantil",
    y = "Residuum (log)",
    title = "Q–Q graf"
  ) +
  theme_panel +
  ggplot2::stat_qq(
    colour = cols[["grey"]],
    size = 2.6
  ) +
  ggplot2::stat_qq_line(
    colour = cols[["graphite"]],
    linetype = "dashed",
    linewidth = 1
  )

graf_q3_panely <-
  cowplot::plot_grid(
    graf_q3_rv,
    graf_q3_hist,
    graf_q3_qq,
    nrow = 1
  )

graf_q3_titulek <-
  cowplot::ggdraw() +
  cowplot::draw_label(
    label = "Diagnostika modelu Mocninný vztah",
    x = 0.02,
    hjust = 0,
    fontface = "bold",
    size = 22,
    colour = cols[["indigo"]]
  )

graf_q3 <-
  cowplot::plot_grid(
    graf_q3_titulek,
    graf_q3_panely,
    ncol = 1,
    rel_heights = c(0.12, 1)
  )

save_quiz_plot(
  plot = graf_q3,
  filename = "l10-diagnostika-mocninneho-vztahu.png"
)

message("Rendered three L11 PollsLive evidence assets (retrieving L10).")
