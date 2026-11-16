#----------------------------------------------------------#
#
#
#                         L11
#
#           Prepare mistletoe-on-oak stem data
#
#               Claude (Anthropic) and Ondrej Mottl
#                         2026
#
#----------------------------------------------------------#

# Source: Matula et al. (2015) PLoS ONE 10(5): e0127055, data published
#    on Dryad (doi:10.5061/dryad.vk283) under CC0 and mirrored on
#    Zenodo (record 4945816). One row is one stem of sessile oak
#    (Quercus petraea) in the Nad Sobesem plot, Podyji National Park.
#    The mistletoe is Loranthus europaeus.


#----------------------------------------------------------#
# Download the pinned source file -----
#----------------------------------------------------------#

source_url <-
  paste0(
    "https://zenodo.org/api/records/4945816/files/",
    "Data%20on%20tree%20size,%20competition%20and%20mistletoe",
    "%20occurence%20on%20individual%20stems.csv/content"
  )

source_sha256 <-
  paste0(
    "32439687be0a2b2410a05629e60ce0f4",
    "0486b416adb186184a4ea03ae7aef5f6"
  )

path_source <-
  tempfile(fileext = ".csv")

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
    "Could not download the mistletoe stem file from Zenodo."
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
    "The downloaded mistletoe stem file has an unexpected SHA-256."
  )
}


#----------------------------------------------------------#
# Read the source table -----
#----------------------------------------------------------#

# The file is semicolon-separated, Latin-1 encoded, with "." as the
#    decimal mark.
data_stems_source <-
  readr::read_delim(
    file = path_source,
    delim = ";",
    locale = readr::locale(
      encoding = "latin1",
      decimal_mark = "."
    ),
    show_col_types = FALSE
  )


#----------------------------------------------------------#
# Prepare the teaching table -----
#----------------------------------------------------------#

# "Distance from infected stem (m)" is identical to "Min distance to
#    mistletoe (m)" in the source file; only the first one is kept.
#    The stand column has one value and the distance-by-mistletoe-size
#    and neighbour-count columns are not used in the lesson.
data_stems_teaching <-
  data_stems_source |>
  dplyr::transmute(
    kmen = as.integer(.data$ID),
    dbh_cm = as.integer(.data$`DBH (cm)`),
    napaden = as.integer(.data$Infected),
    pocet_ochmetu = as.integer(.data$`No of mistletoes`),
    vzdalenost_napadeny_m = .data$`Distance from infected stem (m)`,
    index_konkurence = .data$CI_stem
  ) |>
  dplyr::arrange(.data$kmen)

if (
  nrow(data_stems_teaching) != 1015L ||
    anyNA(data_stems_teaching) ||
    anyDuplicated(data_stems_teaching$kmen) > 0L ||
    !all(
      data_stems_teaching$napaden ==
        as.integer(data_stems_teaching$pocet_ochmetu > 0L)
    ) ||
    sum(data_stems_teaching$napaden) != 96L ||
    any(data_stems_teaching$vzdalenost_napadeny_m <= 0)
) {
  cli::cli_abort(
    "The prepared mistletoe table failed its row, ID, or value check."
  )
}


#----------------------------------------------------------#
# Save the teaching table -----
#----------------------------------------------------------#

readr::write_csv(
  x = data_stems_teaching,
  file = here::here(
    "data",
    "ochmet_duby.csv"
  ),
  na = ""
)
