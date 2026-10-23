#----------------------------------------------------------#
# Verify approved local evidence for the L11 retrieval quiz
#----------------------------------------------------------#

here::i_am("R/verify_pollslive_assets.R")

# These images are reviewed teaching inputs. Re-rendering them can change their
# bytes across R sessions and therefore makes immutable synchronization
# unreliable. R/render_pollslive_assets.R stays as their reproducible source;
# local PollsLive preparation verifies the approved bytes instead.
approved_assets <-
  c(
    "l10-koeficienty-mocninneho-vztahu.png" =
      "eca43a7aafe160d593d227628a7d47bbd473b80d238766efa72efc04d8192758",
    "l10-hmotnost-savcu-kg-krabicovy-graf.png" =
      "b06bf5c994eb2540071db6e1e7f36740ab77083d3c0f81318733eee171907161",
    "l10-diagnostika-mocninneho-vztahu.png" =
      "e46f371718d1940422d2b1561e2c51139c4bf0a027c657dd72dee6a9c77b870c"
  )

asset_paths <-
  here::here("pollslive", "assets", names(approved_assets))

missing_assets <-
  names(approved_assets)[!file.exists(asset_paths)]

if (
  length(missing_assets) > 0L
) {
  stop(
    "Missing approved PollsLive evidence assets: ",
    stringr::str_c(missing_assets, collapse = ", ")
  )
}

actual_checksums <-
  asset_paths |>
  purrr::map_chr(
    .f = ~ digest::digest(
      object = .x,
      algo = "sha256",
      file = TRUE
    )
  ) |>
  unname()

changed_assets <-
  names(approved_assets)[actual_checksums != unname(approved_assets)]

if (
  length(changed_assets) > 0L
) {
  stop(
    "Approved PollsLive evidence assets changed: ",
    stringr::str_c(changed_assets, collapse = ", ")
  )
}
