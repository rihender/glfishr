% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_SC125_Tags.R
\name{get_SC125_Tags}
\alias{get_SC125_Tags}
\title{Get SC125_Tags - Tagging data from SC_Portal API}
\usage{
get_SC125_Tags(filter_list = list(), show_id = FALSE, to_upper = TRUE)
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
This function accesses the api endpoint to for SC125Tags
records. SC125Tags records contain information about the
individual tags applied to or recovered from on a sampled fish.
Historically, tag data was stored in three related fields -
TAGDOC, TAGSTAT and TAGID.  This convention is fine as long a
single biological sample only has a one tag. In recent years, it
has been come increasingly common for fish to have multiple tags,
or tag types associated with individual sampling events. SC125Tag
accommodates those events.  This function takes an optional filter
list which can be used to return records based on several
different attributes of the tag (tag type, colour, placement,
agency, tag stat, and tag number) as well as, attributes of the
sampled fish such as the species, or group code, or attributes of
the effort, the sample, or the project(s) that the samples were
collected in.
}
\details{
Use ~show_filters("sc125tags")~ to see the full list
of available filter keys (query parameters)
}
\examples{
#'
filters <- list(lake = "HU", spc = "075")
sc125Tags <- get_SC125_Tags(filters)
sc125Tags <- get_SC125_Tags(filters, show_id = TRUE)
}
\author{
Adam Cottrill \email{adam.cottrill@ontario.ca}
}
