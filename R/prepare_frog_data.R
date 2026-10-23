#----------------------------------------------------------#
#
#
#                         L11
#
#            Prepare froglet data from drying tanks
#
#               Claude (Anthropic) and Ondřej Mottl
#                         2026
#
#----------------------------------------------------------#

# The source table is the CC0 Dryad dataset of Ward et al. (2023),
#    doi:10.5061/dryad.hx3ffbgkn. Dryad refuses scripted downloads, so the
#    file is read from the identical Zenodo mirror (record 8083635) and
#    pinned by its SHA-256.


#----------------------------------------------------------#
# Download the pinned source file -----
#----------------------------------------------------------#

source_url <-
  paste0(
    "https://zenodo.org/api/records/8083635/files/",
    "Frog_Metamorph_Data_Dryad.xlsx/content"
  )

source_sha256 <-
  paste0(
    "cc879383de5a35a7ee57c9e6b446bb9c",
    "364bc9fd7007452e55ba39ea06f2fef4"
  )

path_source <-
  tempfile(fileext = ".xlsx")

download_status <-
  try(
    expr = utils::download.file(
      url = source_url,
      destfile = path_source,
      mode = "wb",
      quiet = TRUE
    ),
    silent = TRUE
  )

if (
  !identical(download_status, 0L)
) {
  cli::cli_abort(
    "Could not download the froglet table from Zenodo record 8083635."
  )
}

if (
  digest::digest(
    object = path_source,
    algo = "sha256",
    file = TRUE
  ) != source_sha256
) {
  cli::cli_abort(
    "The downloaded froglet table has an unexpected SHA-256."
  )
}


#----------------------------------------------------------#
# Read the source table -----
#----------------------------------------------------------#

data_frogs_source <-
  readxl::read_excel(
    path = path_source,
    sheet = "Sheet1"
  )


#----------------------------------------------------------#
# Prepare the teaching table -----
#----------------------------------------------------------#

# Only the amphibian-only tanks produced froglets, so the treatment code
#    reduces to the drying history ("A:DR" dried and refilled, "A:ND" not
#    dried). Cup weights are weighing intermediates and are left out;
#    dry mass is already the final minus the cup weight.
if (
  !all(data_frogs_source$Treatment %in% c("A:DR", "A:ND"))
) {
  cli::cli_abort(
    "The source table contains an unexpected treatment code."
  )
}

# Dry mass is a difference of two weights read to 0.001 g; rounding
#    removes floating-point noise without changing any recorded value.
data_frogs_teaching <-
  data_frogs_source |>
  dplyr::mutate(
    nadrz = as.integer(.data$Tank),
    vyschnuti = dplyr::if_else(
      condition = .data$Treatment == "A:DR",
      true = "vyschla",
      false = "nevyschla"
    ),
    poradi_zabky = as.integer(.data$Indiv),
    datum_metamorfozy = as.Date(.data$Date),
    den_pokusu = as.integer(.data$Day),
    delka_tela_mm = .data$SVL,
    hmotnost_mokra_g = .data$Wet_Mass,
    hmotnost_sucha_g = round(.data$Dry_Mass, digits = 3)
  ) |>
  dplyr::select(
    "nadrz",
    "vyschnuti",
    "poradi_zabky",
    "datum_metamorfozy",
    "den_pokusu",
    "delka_tela_mm",
    "hmotnost_mokra_g",
    "hmotnost_sucha_g"
  ) |>
  dplyr::arrange(
    .data$nadrz,
    .data$poradi_zabky
  ) |>
  # Tank labels such as "N27" read as names, not as quantities, in tables,
  #    figures and text; rows stay sorted by the numeric tank number
  dplyr::mutate(
    nadrz = as.character(stringr::str_glue("N{.data$nadrz}"))
  )

vec_tanks_per_treatment <-
  data_frogs_teaching |>
  dplyr::distinct(
    .data$nadrz,
    .data$vyschnuti
  ) |>
  dplyr::count(.data$vyschnuti) |>
  dplyr::pull(.data$n)

if (
  nrow(data_frogs_teaching) != 485L ||
    anyNA(data_frogs_teaching) ||
    !identical(vec_tanks_per_treatment, c(8L, 8L)) ||
    anyDuplicated(
      data_frogs_teaching[, c("nadrz", "poradi_zabky")]
    ) > 0L
) {
  cli::cli_abort(
    "The prepared froglet table failed its row, tank, or missing-value check."
  )
}


#----------------------------------------------------------#
# Save the teaching table -----
#----------------------------------------------------------#

readr::write_csv(
  x = data_frogs_teaching,
  file = here::here(
    "data",
    "zabky_nadrze.csv"
  ),
  na = ""
)
