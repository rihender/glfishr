% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_flen2tlen.R
\name{get_flen2tlen}
\alias{get_flen2tlen}
\title{Get FLEN~TLEn regression coefficients  GLIS API}
\usage{
get_flen2tlen(filter_list = list(), to_upper = TRUE)
}
\arguments{
\item{filter_list}{list}

\item{to_upper}{\itemize{
\item should the names of the dataframe be converted to
upper case?
}}
}
\value{
dataframe
}
\description{
This function accesses the api endpoint in the Great Lakes
Information System that returns the species specific regression
coefficients to estimate Total Length from Fork Length.
}
\details{
This function uses the same filters as the species list, so you can
use show_filters('species_list') to see available filters.
}
\examples{

flen2tlen <- get_flen2tlen()
flen2tlen <- get_flen2tlen(list(spc_nmco__like = "trout"))
}
\author{
Adam Cottrill \email{adam.cottrill@ontario.ca}
}
