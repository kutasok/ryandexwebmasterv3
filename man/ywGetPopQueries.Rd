\name{ywGetPopQueries}
\alias{ywGetPopQueries}
\title{Get site popular queries from Yandex Webmaster}
\description{ywGetPopQueries downloads site popular queries from Yandex Webmaster API v 3.0}
\usage{
ywGetPopQueries(user_id = NULL, host_id = NULL, order_by = "TOTAL_CLICKS", token = NULL)
}

\arguments{
  \item{user_id}{User id from function ywGetUserId.}
  \item{host_id}{Host id of your site. You can get by function ywGetSitesList.}
  \item{order_by}{Order by TOTAL_CLICKS or by TOTAL_SHOWS.}
  \item{token}{Token for Yandex Webmaster API from function ywGetToken}
}
\details{}
\value{Returns data frame with columns:
  date_from - start date for query, 
  date_to - end date for query, 
  query_text - text of search query form yandex search engine, 
  indicators_total_shows - total shows,
  indicators_total_clicks - total clicks,
  indicators_avg_show_position - average show position
  indicators_avg_click_position - average click position
}
\references{}
\author{Ivan Kutas}
\note{}

\seealso{}
\examples{
sitePopQueries <- ywGetPopQueries(user_id - userId,
                                  host_id=hostId, 
                                  order_by="TOTAL_CLICKS",
                                  token=myToken)
}

\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line                           
