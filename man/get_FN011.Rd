% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_FN011.R
\name{get_FN011}
\alias{get_FN011}
\title{Get FN011 - Project meta data from FN_Portal API}
\usage{
get_FN011(filter_list = list(), show_id = FALSE, to_upper = TRUE)
}
\arguments{
\item{filter_list}{list}

\item{show_id}{When 'FALSE', the default, the 'id' and 'slug'
fields are hidden from the data frame. To return these columns
as part of the data frame, use 'show_id = TRUE'.}

\item{to_upper}{\itemize{
\item should the names of the dataframe be converted to
upper case?
}}
}
\value{
dataframe
}
\description{
This function accesses the api endpoint to for FN011
records. FN011 records contain the hi-level meta data about an
OMNR netting project.  The FN011 records contain information like
project code, project name, project leader, start and end date,
protocol, and the lake where the project was conducted.  This
function takes an optional filter list which can be used to return
record based on several attributes of the project such as
project code, or part of the project code, lake, first year, last
year, protocol, etc.
}
\details{
See
http://10.167.37.157/fn_portal/api/v1/redoc/#operation/fn_011_list
for the full list of available filter keys (query parameters)
}
\examples{

fn011 <- get_FN011(list(lake = "ON", year__gte = 2012, year__lte = 2018))

fn011 <- get_FN011(list(lake = "ER", protocol = "TWL"))

filters <- list(lake = "SU", prj_cd = c("LSA_IA15_CIN", "LSA_IA17_CIN"))
fn011 <- get_FN011(filters)

fn011 <- get_FN011(list(lake = "HU", prj_cd__like = "_006"))

fn011 <- get_FN011(list(lake = "HU", protocol = "USA"))
fn011 <- get_FN011(list(lake = "HU", protocol = "USA"),
  show_id =
    TRUE
)
}
\author{
Adam Cottrill \email{adam.cottrill@ontario.ca}
}
