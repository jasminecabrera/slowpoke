#' Find Pokémon by name pattern
#'
#' @param poke_name A character string to match against Pokémon names.
#' @return A tibble of matching Pokémon card names and their flavor text.
#' @importFrom dplyr filter select distinct collect
#' @importFrom stringr str_detect str_to_title
#' @export
find_poke <- function(poke_name) {

  # load data
  dat <- load_data()

  # capitalize pokemon name
  poke_name <- str_to_title(poke_name)

  # get pokemons
  dat |>
    filter(str_detect(name, poke_name)) |>
    select(name, flavorText) |>
    distinct() |>
    collect()}

#' Find multiple Pokémon by name patterns
#'
#' @param poke_names A character vector of name patterns.
#' @return A tibble of matching Pokémon card names and flavor text.
#' @importFrom dplyr tibble
#' @importFrom furrr future_map_dfr furrr_options
#' @export

find_many_pokes <- function(poke_names) {

  future_map_dfr(poke_names,
                 .f = find_poke)}
