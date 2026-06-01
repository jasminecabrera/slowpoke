#' Load bundled Pokémon TCG dataset
#'
#' @return A tibble containing Pokémon TCG data.
#' @importFrom arrow read_parquet
#' @importFrom dplyr tbl

#' @export
load_data <- function() {

  con <- duckdb::dbConnect(duckdb::duckdb(), dbdir = ":memory:")

  # path
  path <- system.file("extdata",
                      "pokemon.parquet",
                      package = "slowpoke")

  # read in parquet file
  tbl(con, sprintf("read_parquet('%s')", path))}
