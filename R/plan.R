#' Write basic plan
#'
#' @return A drake plan
#' @export
#'
#' @importFrom drake drake_plan
#' @examples
write_plan <- function() {
  drake::drake_plan(
    eco_list = data_ecoregion(),
    sp_eco = data_mammals(),
    sp_list = data_mammals_ecoregions(),
    pantheria = data_pantheria(),
    ursus = extract_ursidae(sp_list)
  )
}
