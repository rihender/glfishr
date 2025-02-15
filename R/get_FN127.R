#' Get FN127 - Age data from FN_Portal API
#'
#' This function accesses the api endpoint to for FN127 - age
#' estimate/interpretations.  This function takes an optional filter
#' list which can be used to return records based on several
#' different attributes of the age estimate such as the assigned age,
#' the aging structure, confidence, number of complete annuli and
#' edge code, or whether or not it was identified as the 'preferred'
#' age for this fish. Additionally, filters can be applied to
#' select age estimates based on attributes of the sampled fish such
#' as the species, or group code, or attributes of the effort, the
#' sample, or the project(s) that the samples were collected in.
#'
#' See
#' http://10.167.37.157/fn_portal/api/v1/redoc/#operation/fn_127_list
#' for the full list of available filter keys (query parameters)
#'
#' @param filter_list list
#' @param show_id When 'FALSE', the default, the 'id' and 'slug'
#' fields are hidden from the data frame. To return these columns
#' as part of the data frame, use 'show_id = TRUE'.
#' @param to_upper - should the names of the dataframe be converted to
#' upper case?
#'
#' @author Adam Cottrill \email{adam.cottrill@@ontario.ca}
#' @return dataframe
#' @export
#' @examples
#'
#' fn127 <- get_FN127(list(lake = "ON", year = 2012, spc = "334", gr = "GL"))
#'
#' filters <- list(
#'   lake = "ER",
#'   protocol = "TWL",
#'   spc = c("331", "334"),
#'   year = 2010,
#'   sidep__lte = 20
#' )
#' fn127 <- get_FN127(filters)
#'
#' filters <- list(
#'   lake = "SU",
#'   prj_cd = c("LSA_IA15_CIN", "LSA_IA17_CIN"),
#'   eff = "051",
#'   spc = "091"
#' )
#' fn127 <- get_FN127(filters)
#'
#' filters <- list(lake = "HU", spc = "076", grp = "55")
#' fn127 <- get_FN127(filters)
#' fn127 <- get_FN127(filters, show_id = TRUE)
get_FN127 <- function(filter_list = list(), show_id = FALSE, to_upper = TRUE) {
  recursive <- ifelse(length(filter_list) == 0, FALSE, TRUE)
  query_string <- build_query_string(filter_list)
  check_filters("fn127", filter_list, "fn_portal")
  my_url <- sprintf(
    "%s/fn127/%s",
    get_fn_portal_root(),
    query_string
  )
  payload <- api_to_dataframe(my_url, recursive = recursive)
  payload <- prepare_payload(payload, show_id, to_upper)

  return(payload)
}
