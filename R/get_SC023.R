#' Get SC023 - Day Type Data Creel_Portal API
#'
#' This function accesses the api endpoint for SC023 records. SC023
#' records contain information about the day types considered in a
#' creel and the codes used to identify those days. Days are usually
#' identified as either weekday, or weekend days. (the SC025 end point
#' is used to identify exception dates - weekdays that should be
#' treated like a weekend).
#'
#' Use ~show_filters("sc023")~ to see the full list of available filter
#' keys (query parameters)
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
#' sc023 <- get_SC023(list(lake = "ON", year = 2012))
#'
#' sc023 <- get_SC023(list(prj_cd = "LHA_IA19_812"))
#' sc023 <- get_SC023(list(prj_cd = "LHA_IA19_812"), show_id = TRUE)
get_SC023 <- function(filter_list = list(), show_id = FALSE, to_upper = TRUE) {
  recursive <- ifelse(length(filter_list) == 0, FALSE, TRUE)
  query_string <- build_query_string(filter_list)
  check_filters("sc023", filter_list, api_app = "creels")
  my_url <- sprintf(
    "%s/sc023/%s",
    get_sc_portal_root(),
    query_string
  )

  payload <- api_to_dataframe(my_url, recursive = recursive)
  payload <- prepare_payload(payload, show_id, to_upper)

  return(payload)
}
