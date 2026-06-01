#' Count card rarity by grouping variable
#'
#' @param grouping_var A column to group by (unquoted).
#' @return A tibble with counts of each rarity by group.
#' @importFrom dplyr count mutate group_by collect
#' @importFrom tidyr pivot_wider
#' @export

rarity_by_release <- function(grouping_var) {
 load_data() |>
 count({{grouping_var}}, rarity) |>
 group_by({{grouping_var}}) |>
 mutate(pct = n / sum(n)) |>
 collect() |>
 pivot_wider(names_from = rarity,
             values_from = pct)}
